//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#include "cbase.h"
#include "basecombatweapon.h"
#include "explode.h"
#include "EventQueue.h"
#include "gamerules.h"
#include "ammodef.h"
#include "in_buttons.h"
#include "soundent.h"
#include "ndebugoverlay.h"
#include "vstdlib/random.h"
#include "engine/IEngineSound.h"

#include "player.h"
#include "EntityList.h"
#include "iservervehicle.h"


#define SF_TANK_ACTIVE			0x0001


class CAPCController : public CPointEntity
{
	typedef CPointEntity BaseClass;
public:
	~CAPCController( void );
	void	Spawn( void );
	void	Precache( void );
	bool	KeyValue( const char *szKeyName, const char *szValue );
	void	Think( void );
	void	TrackTarget( void );

	void	StartRotSound( void );
	void	StopRotSound( void );

	// Bmodels don't go across transitions
	virtual int	ObjectCaps( void ) { return BaseClass::ObjectCaps() & ~FCAP_ACROSS_TRANSITION; }

	inline bool IsActive( void ) { return (m_spawnflags & SF_TANK_ACTIVE)?TRUE:FALSE; }

	// Input handlers.
	void InputActivate( inputdata_t &inputdata );
	void InputDeactivate( inputdata_t &inputdata );

	void ActivateRocketGuidance(void);
	void DeactivateRocketGuidance(void);

	bool		InRange( float range );

	Vector		WorldBarrelPosition( void )
	{
		EntityMatrix tmp;
		tmp.InitFromEntity( this );
		return tmp.LocalToWorld( m_barrelPos );
	}

	void		UpdateMatrix( void )
	{
		m_parentMatrix.InitFromEntity( GetParent() ? GetParent() : NULL );
	}
	QAngle		AimBarrelAt( const Vector &parentTarget );

	bool	ShouldSavePhysics()	{ return false; }
	
	DECLARE_DATADESC();

	CBaseEntity *FindTarget( string_t targetName, CBaseEntity *pActivator );

protected:
	float			m_yawCenter;	// "Center" yaw
	float			m_yawRate;		// Max turn rate to track targets
									// Zero is full rotation
	float			m_yawTolerance;	// Tolerance angle

	float			m_pitchCenter;	// "Center" pitch
	float			m_pitchRate;	// Max turn rate on pitch
	float			m_pitchTolerance;	// Tolerance angle

	float			m_minRange;		// Minimum range to aim/track
	float			m_maxRange;		// Max range to aim/track

	Vector			m_barrelPos;	// Length of the barrel
	
	Vector			m_sightOrigin;	// Last sight of target

	string_t		m_soundStartRotate;
	string_t		m_soundStopRotate;
	string_t		m_soundLoopRotate;

	string_t		m_targetEntityName;
	EHANDLE			m_hTarget;
	EntityMatrix	m_parentMatrix;

	COutputVector	m_OnFireAtTarget;

	float			m_flFiringDelay;
	bool			m_bFireDelayed;
};

LINK_ENTITY_TO_CLASS( point_apc_controller, CAPCController );

BEGIN_DATADESC( CAPCController )

	DEFINE_FIELD( CAPCController, m_yawCenter, FIELD_FLOAT ),
	DEFINE_KEYFIELD( CAPCController, m_yawRate, FIELD_FLOAT, "yawrate" ),
	DEFINE_KEYFIELD( CAPCController, m_yawTolerance, FIELD_FLOAT, "yawtolerance" ),


	DEFINE_FIELD( CAPCController, m_pitchCenter, FIELD_FLOAT ),
	DEFINE_KEYFIELD( CAPCController, m_pitchRate, FIELD_FLOAT, "pitchrate" ),
	DEFINE_KEYFIELD( CAPCController, m_pitchTolerance, FIELD_FLOAT, "pitchtolerance" ),

	DEFINE_KEYFIELD( CAPCController, m_minRange, FIELD_FLOAT, "minRange" ),
	DEFINE_KEYFIELD( CAPCController, m_maxRange, FIELD_FLOAT, "maxRange" ),
	DEFINE_FIELD( CAPCController, m_barrelPos, FIELD_VECTOR ),
	DEFINE_FIELD( CAPCController, m_sightOrigin, FIELD_VECTOR ),
	DEFINE_KEYFIELD( CAPCController, m_soundStartRotate, FIELD_SOUNDNAME, "rotatestartsound" ),
	DEFINE_KEYFIELD( CAPCController, m_soundStopRotate, FIELD_SOUNDNAME, "rotatestopsound" ),
	DEFINE_KEYFIELD( CAPCController, m_soundLoopRotate, FIELD_SOUNDNAME, "rotatesound" ),
	DEFINE_KEYFIELD( CAPCController, m_targetEntityName, FIELD_STRING, "targetentityname" ),
	DEFINE_FIELD( CAPCController, m_hTarget, FIELD_EHANDLE ),
	DEFINE_FIELD( CAPCController, m_parentMatrix, FIELD_VMATRIX_WORLDSPACE ),
	DEFINE_FIELD( CAPCController, m_flFiringDelay, FIELD_FLOAT ),
	DEFINE_FIELD( CAPCController, m_bFireDelayed, FIELD_BOOLEAN ),

	// Inputs
	DEFINE_INPUTFUNC( CAPCController, FIELD_VOID, "Activate", InputActivate ),
	DEFINE_INPUTFUNC( CAPCController, FIELD_VOID, "Deactivate", InputDeactivate ),

	// Outputs
	DEFINE_OUTPUT(CAPCController, m_OnFireAtTarget,	"OnFireAtTarget"),

END_DATADESC()



//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CAPCController::~CAPCController( void )
{
	if ( m_soundLoopRotate != NULL_STRING )
	{
		StopSound( entindex(), CHAN_STATIC, STRING(m_soundLoopRotate) );
	}
}

//------------------------------------------------------------------------------
// Purpose: Input handler for activating the tank.
//------------------------------------------------------------------------------
void CAPCController::InputActivate( inputdata_t &inputdata )
{	
	ActivateRocketGuidance();
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CAPCController::ActivateRocketGuidance(void)
{
	m_spawnflags	|= SF_TANK_ACTIVE; 
	SetNextThink( gpGlobals->curtime + 0.1f ); 
}


//-----------------------------------------------------------------------------
// Purpose: Input handler for deactivating the tank.
//-----------------------------------------------------------------------------
void CAPCController::InputDeactivate( inputdata_t &inputdata )
{
	DeactivateRocketGuidance();
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CAPCController::DeactivateRocketGuidance(void)
{
	m_spawnflags	&= ~SF_TANK_ACTIVE; 
	StopRotSound();
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : targetName - 
//			pActivator - 
//-----------------------------------------------------------------------------
CBaseEntity *CAPCController::FindTarget( string_t targetName, CBaseEntity *pActivator ) 
{
	return gEntList.FindEntityGenericNearest( STRING( targetName ), GetAbsOrigin(), 0, this, pActivator );
}

//-----------------------------------------------------------------------------
// Purpose: Caches entity key values until spawn is called.
// Input  : szKeyName - 
//			szValue - 
// Output : 
//-----------------------------------------------------------------------------
bool CAPCController::KeyValue( const char *szKeyName, const char *szValue )
{
	if (FStrEq(szKeyName, "barrel"))
	{
		m_barrelPos.x = atof(szValue);
	}
	else if (FStrEq(szKeyName, "barrely"))
	{
		m_barrelPos.y = atof(szValue);
	}
	else if (FStrEq(szKeyName, "barrelz"))
	{
		m_barrelPos.z = atof(szValue);
	}
	else
		return BaseClass::KeyValue( szKeyName, szValue );

	return true;
}

//-----------------------------------------
// Spawn
//-----------------------------------------
void CAPCController::Spawn( void )
{
	Precache();

	m_yawCenter			= GetLocalAngles().y;
	m_pitchCenter		= GetLocalAngles().x;

	if ( IsActive() )
	{
		SetNextThink( gpGlobals->curtime + 1.0f );
	}

	UpdateMatrix();
}


//-----------------------------------------
// Precache
//-----------------------------------------
void CAPCController::Precache( void )
{
	if ( m_soundStartRotate != NULL_STRING )
		enginesound->PrecacheSound( STRING(m_soundStartRotate) );
	if ( m_soundStopRotate != NULL_STRING )
		enginesound->PrecacheSound( STRING(m_soundStopRotate) );
	if ( m_soundLoopRotate != NULL_STRING )
		enginesound->PrecacheSound( STRING(m_soundLoopRotate) );
}


//-----------------------------------------
// InRange
//-----------------------------------------
bool CAPCController::InRange( float range )
{
	if ( range < m_minRange )
		return FALSE;
	if ( m_maxRange > 0 && range > m_maxRange )
		return FALSE;

	return TRUE;
}


//-----------------------------------------
// Think
//-----------------------------------------
void CAPCController::Think( void )
{
	// refresh the matrix
	UpdateMatrix();

	SetLocalAngularVelocity( vec3_angle );
	TrackTarget();

	if ( fabs(GetLocalAngularVelocity().x) > 1 || fabs(GetLocalAngularVelocity().y) > 1 )
		StartRotSound();
	else
		StopRotSound();
}


//-----------------------------------------------------------------------------
// Purpose: Aim the offset barrel at a position in parent space
// Input  : parentTarget - the position of the target in parent space
// Output : Vector - angles in local space
//-----------------------------------------------------------------------------
QAngle CAPCController::AimBarrelAt( const Vector &parentTarget )
{
	Vector target = parentTarget - GetLocalOrigin();
	float quadTarget = target.LengthSqr();
	float quadTargetXY = target.x*target.x + target.y*target.y;

		// We're trying to aim the offset barrel at an arbitrary point.
		// To calculate this, I think of the target as being on a sphere with 
		// it's center at the origin of the gun.
		// The rotation we need is the opposite of the rotation that moves the target 
		// along the surface of that sphere to intersect with the gun's shooting direction
		// To calculate that rotation, we simply calculate the intersection of the ray 
		// coming out of the barrel with the target sphere (that's the new target position)
		// and use atan2() to get angles

		// angles from target pos to center
		float targetToCenterYaw = atan2( target.y, target.x );
		float centerToGunYaw = atan2( m_barrelPos.y, sqrt( quadTarget - (m_barrelPos.y*m_barrelPos.y) ) );

		float targetToCenterPitch = atan2( target.z, sqrt( quadTargetXY ) );
		float centerToGunPitch = atan2( -m_barrelPos.z, sqrt( quadTarget - (m_barrelPos.z*m_barrelPos.z) ) );
		return QAngle( -RAD2DEG(targetToCenterPitch+centerToGunPitch), RAD2DEG( targetToCenterYaw + centerToGunYaw ), 0 );
}

void CAPCController::TrackTarget( void )
{
	trace_t tr;
	bool updateTime = FALSE, lineOfSight;
	QAngle angles;
	Vector barrelEnd;
	CBaseEntity *pTarget = NULL;

	barrelEnd.Init();

	if ( IsActive() )
	{
		SetNextThink( gpGlobals->curtime + 0.1f );
	}
	else
	{
		return;
	}

	// -----------------------------------
	//  Get world target position
	// -----------------------------------
	barrelEnd = WorldBarrelPosition();
	Vector worldTargetPosition;
	CBaseEntity *pEntity = (CBaseEntity *)m_hTarget;
	if ( !pEntity || ( pEntity->GetFlags() & FL_NOTARGET ) )
	{
		m_hTarget = FindTarget( m_targetEntityName, NULL );
		if ( IsActive() )
		{
			SetNextThink( gpGlobals->curtime + 2 );	// Wait 2 sec s
		}

		return;
	}
	pTarget = pEntity;

	// Calculate angle needed to aim at target
	worldTargetPosition = pEntity->EyePosition();

	float range = (worldTargetPosition - barrelEnd).Length();

	if ( !InRange( range ) )
	{
		m_bFireDelayed = false;
		return;
	}

	UTIL_TraceLine( barrelEnd, worldTargetPosition, MASK_OPAQUE, this, COLLISION_GROUP_NONE, &tr );

	lineOfSight = FALSE;
	// No line of sight, don't track
	if ( tr.fraction == 1.0 || tr.m_pEnt == pTarget )
	{
		lineOfSight = TRUE;

		CBaseEntity *pInstance = pTarget;
		if ( InRange( range ) && pInstance && pInstance->IsAlive() )
		{
			updateTime = TRUE;

			// Sight position is BodyTarget with no noise (so gun doesn't bob up and down)
			m_sightOrigin = pInstance->BodyTarget( GetLocalOrigin(), false );
		}
	}

	// Convert targetPosition to parent
	angles = AimBarrelAt( m_parentMatrix.WorldToLocal( m_sightOrigin ) );


	// Force the angles to be relative to the center position
	float offsetY = UTIL_AngleDistance( angles.y, m_yawCenter );
	float offsetX = UTIL_AngleDistance( angles.x, m_pitchCenter );
	angles.y = m_yawCenter + offsetY;
	angles.x = m_pitchCenter + offsetX;

	// Move toward target at rate or less
	float distY = UTIL_AngleDistance( angles.y, GetLocalAngles().y );

	QAngle vecAngVel = GetLocalAngularVelocity();
	vecAngVel.y = distY * 10;
	vecAngVel.y = clamp( vecAngVel.y, -m_yawRate, m_yawRate );

	// Move toward target at rate or less
	float distX = UTIL_AngleDistance( angles.x, GetLocalAngles().x );
	vecAngVel.x = distX  * 10;
	vecAngVel.x = clamp( vecAngVel.x, -m_pitchRate, m_pitchRate );
	SetLocalAngularVelocity( vecAngVel );

	SetMoveDoneTime( 0.1 );

	Vector forward;
	AngleVectors( GetLocalAngles(), &forward );
	forward = m_parentMatrix.ApplyRotation( forward );

	AngleVectors(angles, &forward);

	if ( lineOfSight == TRUE )
	{
		// see if player is in a vehicle, if so, check it's relationship
		CBasePlayer *pPlayer = UTIL_PlayerByIndex( 1 );
		if ( pPlayer && pPlayer->IsInAVehicle() )
		{
			IServerVehicle *pVehicle = pPlayer->GetVehicle();
			if ( pVehicle->ClassifyPassenger( pPlayer, CLASS_PLAYER ) == CLASS_PLAYER)
			{
				if ( !m_bFireDelayed )
				{
					m_bFireDelayed = true;
					m_flFiringDelay = gpGlobals->curtime + 1.5;	// setup delay time before we start firing
					return;
				}
				if ( gpGlobals->curtime > m_flFiringDelay )
				{
					m_OnFireAtTarget.Set(forward, this, this);		// tell apc to fire rockets, and what direction
				}
			}
		}
	}
	else
	{
		m_bFireDelayed = false;		// reset flag since we can no longer see target
	}
}
	
void CAPCController::StartRotSound( void )
{	
	if ( m_soundLoopRotate != NULL_STRING )
	{
		CPASAttenuationFilter filter( this );
		filter.MakeReliable();
		EmitSound( filter, entindex(), CHAN_STATIC, (char*)STRING(m_soundLoopRotate), 0.85, ATTN_NORM );
	}
	
	if ( m_soundStartRotate != NULL_STRING )
	{
		CPASAttenuationFilter filter( this );
		EmitSound( filter, entindex(), CHAN_BODY, (char*)STRING(m_soundStartRotate), 1.0, ATTN_NORM);
	}
}


void CAPCController::StopRotSound( void )
{
	if ( m_soundLoopRotate != NULL_STRING )
	{
		StopSound( entindex(), CHAN_STATIC, (char*)STRING(m_soundLoopRotate) );
	}
	if ( m_soundStopRotate != NULL_STRING )
	{
		CPASAttenuationFilter filter( this );
		EmitSound( filter, entindex(), CHAN_BODY, (char*)STRING(m_soundStopRotate), 1.0, ATTN_NORM);
	}
}

