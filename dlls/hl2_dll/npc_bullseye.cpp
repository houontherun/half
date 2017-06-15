//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: Bullseyes act as targets for other NPC's to attack and to trigger
//			events 
//
// $NoKeywords: $
//=============================================================================

#include "cbase.h"
#include "basecombatcharacter.h"
#include "AI_BaseNPC.h"
#include "decals.h"
#include "filters.h"
#include "npc_bullseye.h"
#include "collisionutils.h"
#include "igamesystem.h"

class CBullseyeList : public CAutoGameSystem
{
public:
	virtual void LevelShutdownPostEntity() 
	{
		Clear();
	}

	void Clear()
	{
		m_list.Purge();
	}

	void AddToList( CNPC_Bullseye *pBullseye );
	void RemoveFromList( CNPC_Bullseye *pBullseye );

	CUtlVector< CNPC_Bullseye * >	m_list;
};

void CBullseyeList::AddToList( CNPC_Bullseye *pBullseye )
{
	m_list.AddToTail( pBullseye );
}

void CBullseyeList::RemoveFromList( CNPC_Bullseye *pBullseye )
{
	int index = m_list.Find( pBullseye );
	if ( index != m_list.InvalidIndex() )
	{
		m_list.FastRemove( index );
	}
}

CBullseyeList g_BullseyeList;

int FindBullseyesInCone( CBaseEntity **pList, int listMax, const Vector &coneOrigin, const Vector &coneAxis, float coneAngleCos, float coneLength )
{
	if ( listMax <= 0 )
		return 0;

	int count = 0;

	for ( int i = g_BullseyeList.m_list.Count() - 1; i >= 0; --i )
	{
		CNPC_Bullseye *pTest = g_BullseyeList.m_list[i];

		if ( IsPointInCone( pTest->GetAbsOrigin(), coneOrigin, coneAxis, coneAngleCos, coneLength ) )
		{
			pList[count] = pTest;
			count++;
			if ( count >= listMax )
				break;
		}
	}

	return count;
}


ConVar	sk_bullseye_health( "sk_bullseye_health","0");

BEGIN_DATADESC( CNPC_Bullseye )

	DEFINE_FIELD( CNPC_Bullseye, m_hPainPartner, FIELD_EHANDLE ),
	// DEFINE_FIELD( CNPC_Bullseye, m_bPerfectAccuracy, FIELD_BOOLEAN ),	// Don't save

	// Function Pointers
	DEFINE_THINKFUNC( CNPC_Bullseye, BullseyeThink ),

	DEFINE_INPUTFUNC( CNPC_Bullseye, FIELD_VOID, "InputTargeted", InputTargeted ),
	DEFINE_INPUTFUNC( CNPC_Bullseye, FIELD_VOID, "InputReleased", InputReleased ),
	// Outputs
	DEFINE_OUTPUT( CNPC_Bullseye, m_OnTargeted, "OnTargeted"),
	DEFINE_OUTPUT( CNPC_Bullseye, m_OnReleased, "OnReleased"),

END_DATADESC()

LINK_ENTITY_TO_CLASS( npc_bullseye, CNPC_Bullseye );



//-----------------------------------------------------------------------------
// Purpose: Constructor
//-----------------------------------------------------------------------------
CNPC_Bullseye::CNPC_Bullseye( void )
{
	m_takedamage	= DAMAGE_YES;
	m_iHealth		= sk_bullseye_health.GetFloat();
	m_hPainPartner	= NULL;
	g_BullseyeList.AddToList( this );
}

CNPC_Bullseye::~CNPC_Bullseye( void )
{
	g_BullseyeList.RemoveFromList( this );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CNPC_Bullseye::Precache( void )
{
	BaseClass::Precache();
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CNPC_Bullseye::Spawn( void )
{
	Precache();

	// This is a dummy model that is never used!
	SetModel( "models/player.mdl" );

	UTIL_SetSize(this, Vector(-16,-16,-16), Vector(16,16,16));

	SetMoveType( MOVETYPE_NONE );
	SetBloodColor( BLOOD_COLOR_RED );
	m_fEffects			= 0;
	m_flFieldOfView		= 0.5;
	SetGravity( 0.0 );

	//Got blood?
	if ( m_spawnflags & SF_BULLSEYE_BLEED )
	{
		SetBloodColor(BLOOD_COLOR_RED);
	}
	else
	{
		SetBloodColor(DONT_BLEED);
	}

	AddFlag( FL_NPC );

	SetThink( BullseyeThink );
	SetNextThink( gpGlobals->curtime + 0.1f );

	SetSolid( SOLID_BBOX );
	AddSolidFlags( FSOLID_NOT_STANDABLE );
	if( m_spawnflags & SF_BULLSEYE_NONSOLID )
	{
		AddSolidFlags( FSOLID_NOT_SOLID );
	}
	
	if( m_spawnflags & SF_BULLSEYE_NODAMAGE )
	{
		m_takedamage = DAMAGE_NO;
	}
	else
	{
		m_takedamage = DAMAGE_YES;
	}

	// Relink for solid type.
	Relink();

	m_fEffects |= EF_NODRAW;

	//Check our water level
	PhysicsCheckWater();
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CNPC_Bullseye::Activate( void )
{
	BaseClass::Activate();

	if ( m_spawnflags & SF_BULLSEYE_PERFECTACC )
	{
		m_bPerfectAccuracy = true;
	}
	else
	{
		m_bPerfectAccuracy = false;
	}
}


//------------------------------------------------------------------------------
// Purpose : Override so doesn't fall to ground when killed
//------------------------------------------------------------------------------
void CNPC_Bullseye::Event_Killed( const CTakeDamageInfo &info )
{
	BaseClass::Event_Killed( info );

	// Don't want to collide with bullseye any more, but keep around for burns
	SetMoveType( MOVETYPE_NONE );
	AddSolidFlags( FSOLID_NOT_SOLID );
	UTIL_SetSize(this, vec3_origin, vec3_origin );
}

//------------------------------------------------------------------------------
// Purpose : Override base implimentation to let decals pass through
//			 me onto the surface beneath
// Input   :
// Output  :
//------------------------------------------------------------------------------
void CNPC_Bullseye::DecalTrace( trace_t *pOldTrace, char const *decalName )
{
	int index = decalsystem->GetDecalIndexForName( decalName );
	if ( index < 0 )
		return;

	// Get direction of original trace
	Vector vTraceDir = pOldTrace->endpos - pOldTrace->startpos;
	VectorNormalize(vTraceDir);

	// Create a new trace that passes through me
	Vector vStartTrace	= pOldTrace->endpos - (1.0 * vTraceDir);
	Vector vEndTrace	= pOldTrace->endpos + (MAX_TRACE_LENGTH * vTraceDir);

	trace_t pNewTrace;
	AI_TraceLine(vStartTrace, vEndTrace, MASK_SHOT, this, COLLISION_GROUP_NONE, &pNewTrace);

	CBroadcastRecipientFilter filter;
	te->Decal( filter, 0.0, &pNewTrace.endpos, &pNewTrace.startpos,
		ENTINDEX( pNewTrace.m_pEnt ), pNewTrace.hitbox, index );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CNPC_Bullseye::ImpactTrace( trace_t *pTrace, int iDamageType, char *pCustomImpactName )
{
	// Get direction of original trace
	Vector vTraceDir = pTrace->endpos - pTrace->startpos;
	VectorNormalize(vTraceDir);

	// Create a new trace that passes through me
	Vector vStartTrace	= pTrace->endpos - (1.0 * vTraceDir);
	Vector vEndTrace	= pTrace->endpos + (MAX_TRACE_LENGTH * vTraceDir);

	trace_t pNewTrace;
	AI_TraceLine(vStartTrace, vEndTrace, MASK_SHOT, this, COLLISION_GROUP_NONE, &pNewTrace);

	CBaseEntity	*pEntity = pNewTrace.m_pEnt;

	// Only do this for BSP model entities
	if ( ( pEntity ) && ( pEntity->IsBSPModel() == false ) )
		return;

	BaseClass::ImpactTrace( pTrace, iDamageType, pCustomImpactName );
}

//-----------------------------------------------------------------------------
// Purpose: 
//
//
// Output : 
//-----------------------------------------------------------------------------
Class_T	CNPC_Bullseye::Classify( void )
{
	return	CLASS_BULLSEYE;
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CNPC_Bullseye::BullseyeThink( void )
{
	SetNextThink( gpGlobals->curtime + 0.1f );

	ClearCondition( COND_LIGHT_DAMAGE  );
	ClearCondition( COND_HEAVY_DAMAGE );
}

//-----------------------------------------------------------------------------
// Purpose: Bullseyes should always report light damage if any amount of damage is taken
// Input  : fDamage - amount of damage
//			bitsDamageType - damage type
//-----------------------------------------------------------------------------
bool CNPC_Bullseye::IsLightDamage( float flDamage, int bitsDamageType )
{
	return ( flDamage > 0 );
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *pAttacker - 
//			flDamage - 
//			&vecDir - 
//			*ptr - 
//			bitsDamageType - 
//-----------------------------------------------------------------------------
void CNPC_Bullseye::TraceAttack( const CTakeDamageInfo &info, const Vector &vecDir, trace_t *ptr )
{
	//If specified, we must be the enemy of the target
	if ( m_spawnflags & SF_BULLSEYE_ENEMYDAMAGEONLY )
	{
		CAI_BaseNPC *pInstigator = info.GetAttacker()->MyNPCPointer();

		if ( pInstigator == NULL )
			return;

		if ( pInstigator->GetEnemy() != this )
			return;
	}

	//We can bleed if we want to, we can leave decals behind...
	if ( ( m_spawnflags & SF_BULLSEYE_BLEED ) && ( m_takedamage == DAMAGE_NO ) )
	{
		TraceBleed( info.GetDamage(), vecDir, ptr, info.GetDamageType() );
	}

	BaseClass::TraceAttack( info, vecDir, ptr );
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *pInflictor - 
//			*pAttacker - 
//			flDamage - 
//			bitsDamageType - 
// Output : int
//-----------------------------------------------------------------------------
int CNPC_Bullseye::OnTakeDamage( const CTakeDamageInfo &info )
{
	//If specified, we must be the enemy of the target
	if ( m_spawnflags & SF_BULLSEYE_ENEMYDAMAGEONLY )
	{
		CAI_BaseNPC *pInstigator = info.GetAttacker()->MyNPCPointer();

		if ( pInstigator == NULL )
			return 0;

		if ( pInstigator->GetEnemy() != this )
			return 0;
	}
	
	//If we're a pain proxy, send the damage through
	if ( m_hPainPartner != NULL )
	{
		m_hPainPartner->TakeDamage( info );
		
		//Fire all pain indicators but take no real damage
		CTakeDamageInfo subInfo = info;
		subInfo.SetDamage( 0 );
		return BaseClass::OnTakeDamage( subInfo );
	}

	return BaseClass::OnTakeDamage( info );
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *pOther - 
//-----------------------------------------------------------------------------
void CNPC_Bullseye::SetPainPartner( CBaseEntity *pOther )
{
	m_hPainPartner = pOther;
}

void CNPC_Bullseye::InputTargeted( inputdata_t &inputdata )
{
	m_OnTargeted.FireOutput( inputdata.pActivator, inputdata.pCaller, 0 );
}

void CNPC_Bullseye::InputReleased( inputdata_t &inputdata )
{
	m_OnReleased.FireOutput( inputdata.pActivator, inputdata.pCaller, 0 );
}
