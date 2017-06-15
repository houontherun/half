//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: Misc utility code.
//
// $NoKeywords: $
//=============================================================================

#ifndef UTIL_H
#define UTIL_H
#ifdef _WIN32
#pragma once
#endif

#include "ai_activity.h"
#include "enginecallback.h"
#include "basetypes.h"
#include "tempentity.h"
#include "string_t.h"
#include "gamestringpool.h"
#include "engine/IEngineTrace.h"
#include "worldsize.h"
#include "dt_send.h"
#include "server_class.h"
#include "shake.h"

#include "vstdlib/random.h"
#include <string.h>

#include "utlvector.h"
#include "util_shared.h"
#include "shareddefs.h"
#include "networkvar.h"

struct levellist_t;
class IServerNetworkable;
class IEntityFactory;

// Keeps clutter down a bit, when using a float as a bit-vector
#define SETBITS(flBitVector, bits)		((flBitVector) = (int)(flBitVector) | (bits))
#define CLEARBITS(flBitVector, bits)	((flBitVector) = (int)(flBitVector) & ~(bits))
#define FBitSet(flBitVector, bit)		((flBitVector) & (bit))


#ifdef _WIN32
	#define SETUP_EXTERNC(mapClassName)\
		extern "C" _declspec( dllexport ) IServerNetworkable* mapClassName( void );
#else
	#define SETUP_EXTERNC(mapClassName)
#endif


#include "tier0/memdbgon.h"


// entity creation
// creates an entity that has not been linked to a classname
template< class T >
T *_CreateEntityTemplate( T *newEnt, const char *className )
{
	newEnt = new T; // this is the only place 'new' should be used!
	newEnt->PostConstructor( className );
	return newEnt;
}

#include "tier0/memdbgoff.h"

// creates an entity by name, and ensure it's correctness
// does not spawn the entity
// use the CREATE_ENTITY() macro which wraps this, instead of using it directly
template< class T >
T *_CreateEntity( T *newClass, const char *className )
{
	T *newEnt = dynamic_cast<T*>( CreateEntityByName(className) );
	if ( !newEnt )
	{
		Warning( "classname %s used to create wrong class type\n" );
		Assert(0);
	}

	return newEnt;
}

#define CREATE_ENTITY( newClass, className ) _CreateEntity( (newClass*)NULL, className )
#define CREATE_UNSAVED_ENTITY( newClass, className ) _CreateEntityTemplate( (newClass*)NULL, className )


// This is the glue that hooks .MAP entity class names to our CPP classes
class IEntityFactoryDictionary
{
public:
	virtual void InstallFactory( IEntityFactory *pFactory, const char *pClassName ) = 0;
	virtual IServerNetworkable *Create( const char *pClassName ) = 0;
	virtual void Destroy( const char *pClassName, IServerNetworkable *pNetworkable ) = 0;
};

IEntityFactoryDictionary *EntityFactoryDictionary();

class IEntityFactory
{
public:
	virtual IServerNetworkable *Create( const char *pClassName ) = 0;
	virtual void Destroy( IServerNetworkable *pNetworkable ) = 0;
};

template <class T>
class CEntityFactory : public IEntityFactory
{
public:
	CEntityFactory( const char *pClassName )
	{
		EntityFactoryDictionary()->InstallFactory( this, pClassName );
	}

	IServerNetworkable *Create( const char *pClassName )
	{
		return _CreateEntityTemplate((T*)NULL, pClassName);
	}

	void Destroy( IServerNetworkable *pNetworkable )
	{
		if ( pNetworkable )
		{
			delete pNetworkable;
		}
	}
};

#define LINK_ENTITY_TO_CLASS(mapClassName,DLLClassName) \
	static CEntityFactory<DLLClassName> mapClassName( #mapClassName );


//
// Conversion among the three types of "entity", including identity-conversions.
//
inline int	  ENTINDEX( edict_t *pEdict)			
{ 
	return engine->IndexOfEdict(pEdict); 
}

int	  ENTINDEX( CBaseEntity *pEnt );

inline edict_t* INDEXENT( int iEdictNum )		
{ 
	return engine->PEntityOfEntIndex(iEdictNum); 
}

// Testing the three types of "entity" for nullity
inline bool FNullEnt(const edict_t* pent)
{ 
	return pent == NULL || ENTINDEX((edict_t*)pent) == 0; 
}

// Dot products for view cone checking
#define VIEW_FIELD_FULL		(float)-1.0 // +-180 degrees
#define	VIEW_FIELD_WIDE		(float)-0.7 // +-135 degrees 0.1 // +-85 degrees, used for full FOV checks 
#define	VIEW_FIELD_NARROW	(float)0.7 // +-45 degrees, more narrow check used to set up ranged attacks
#define	VIEW_FIELD_ULTRA_NARROW	(float)0.9 // +-25 degrees, more narrow check used to set up ranged attacks

class CBaseEntity;
class CBasePlayer;

extern CGlobalVars *gpGlobals;

// Misc useful
inline bool FStrEq(const char *sz1, const char *sz2)
{
	return(stricmp(sz1, sz2) == 0);
}

#if 0
// UNDONE: Remove/alter MAKE_STRING so we can do this?
inline bool FStrEq( string_t str1, string_t str2 )
{
	// now that these are pooled, we can compare them with 
	// integer equality
	return str1 == str2;
}
#endif

const char *nexttoken(char *token, const char *str, char sep);

// Misc. Prototypes
void		UTIL_SetSize			(CBaseEntity *pEnt, const Vector &vecMin, const Vector &vecMax);
void		UTIL_ClearTrace			( trace_t &trace );
void		UTIL_SetTrace			(trace_t& tr, const Ray_t &ray, edict_t* edict, float fraction, int hitgroup, unsigned int contents, const Vector& normal, float intercept );

int			UTIL_PrecacheDecal		( const char *name, bool preload = false );

//-----------------------------------------------------------------------------
// Purpose: Gets a player pointer by 1-based index
//			If player is not yet spawned or connected, returns NULL
// Input  : playerIndex - index of the player - first player is index 1
//-----------------------------------------------------------------------------
extern CBasePlayer	*UTIL_PlayerByIndex( int playerIndex );

void		UTIL_GetPlayerConnectionInfo( int playerIndex, int& ping, int &packetloss );

edict_t		*UTIL_FindClientInPVS( edict_t *pEdict );
CBaseEntity *UTIL_EntitiesInPVS( CBaseEntity *pPVSEntity, CBaseEntity *pStartingEntity );

// Pass in an array of pointers and an array size, it fills the array and returns the number inserted
int			UTIL_EntitiesInBox( CBaseEntity **pList, int listMax, const Vector &mins, const Vector &maxs, int flagMask );
int			UTIL_EntitiesInSphere( CBaseEntity **pList, int listMax, const Vector &center, float radius, int flagMask );

// marks the entity for deletion so it will get removed next frame
void UTIL_Remove( IServerNetworkable *oldObj );

// deletes an entity, without any delay.  Only use this when sure no pointers rely on this entity.
void UTIL_RemoveImmediate( CBaseEntity *oldObj );

// make this a fixed size so it just sits on the stack
#define MAX_SPHERE_QUERY	256
class CEntitySphereQuery
{
public:
	// currently this builds the list in the constructor
	// UNDONE: make an iterative query of ISpatialPartition so we could
	// make queries like this optimal
	CEntitySphereQuery( const Vector &center, float radius, int flagMask=0 );
	CBaseEntity *GetCurrentEntity();
	inline void NextEntity() { m_listIndex++; }

private:
	int			m_listIndex;
	int			m_listCount;
	CBaseEntity *m_pList[MAX_SPHERE_QUERY];
};

enum soundlevel_t;

// Drops an entity onto the floor
int			UTIL_DropToFloor( CBaseEntity *pEntity, unsigned int mask );

// Returns false if any part of the bottom of the entity is off an edge that is not a staircase.
bool		UTIL_CheckBottom( CBaseEntity *pEntity, ITraceFilter *pTraceFilter, float flStepSize );

void		UTIL_SetOrigin			( CBaseEntity *entity, const Vector &vecOrigin, bool bFireTriggers = false );
void		UTIL_Relink				( CBaseEntity *entity );
void		UTIL_EmitAmbientSound	( CBaseEntity *entity, const Vector &vecOrigin, const char *samp, float vol, soundlevel_t soundlevel, int fFlags, int pitch, float soundtime = 0.0f );
void		UTIL_ParticleEffect		( const Vector &vecOrigin, const Vector &vecDirection, ULONG ulColor, ULONG ulCount );
void		UTIL_ScreenShake		( const Vector &center, float amplitude, float frequency, float duration, float radius, ShakeCommand_t eCommand, bool bAirShake=false );
void		UTIL_ScreenShakeObject	( CBaseEntity *pEnt, const Vector &center, float amplitude, float frequency, float duration, float radius, ShakeCommand_t eCommand, bool bAirShake=false );
void		UTIL_ShowMessage		( const char *pString, CBaseEntity *pPlayer );
void		UTIL_ShowMessageAll		( const char *pString );
void		UTIL_ScreenFadeAll		( const color32 &color, float fadeTime, float holdTime, int flags );
void		UTIL_ScreenFade			( CBaseEntity *pEntity, const color32 &color, float fadeTime, float fadeHold, int flags );
void		UTIL_MuzzleFlash		( const Vector &origin, const QAngle &angles, int scale, int type );
Vector		UTIL_PointOnLineNearestPoint(const Vector& vStartPos, const Vector& vEndPos, const Vector& vPoint, bool clampEnds = false );

int			UTIL_EntityInSolid( CBaseEntity *ent );

bool		UTIL_IsMasterTriggered	(string_t sMaster, CBaseEntity *pActivator);
void		UTIL_BloodStream( const Vector &origin, const Vector &direction, int color, int amount );
void		UTIL_BloodDrips( const Vector &origin, const Vector &direction, int color, int amount );
void		UTIL_BloodSpray( const Vector &pos, const Vector &dir, int color, int amount, int flags );
Vector		UTIL_RandomBloodVector( void );
bool		UTIL_ShouldShowBlood( int bloodColor );
void		UTIL_BloodDecalTrace( trace_t *pTrace, int bloodColor );
void		UTIL_Tracer( const Vector &vecStart, const Vector &vecEnd, int iEntIndex = 0, int iAttachment = TRACER_DONT_USE_ATTACHMENT, float flVelocity = 0, bool bWhiz = false, char *pCustomTracerName = NULL);
void		UTIL_DecalTrace( trace_t *pTrace, char const *decalName );
void		UTIL_ImpactTrace( trace_t *pTrace, int iDamageType, char *pCustomImpactName = NULL );
void		UTIL_PlayerDecalTrace( trace_t *pTrace, int playernum );
void		UTIL_Smoke( const Vector &origin, const float scale, const float framerate );
void		UTIL_StringToVector( float *pVector, const char *pString );
void		UTIL_AxisStringToPointDir( Vector &start, Vector &dir, const char *pString );
void		UTIL_AxisStringToPointPoint( Vector &start, Vector &end, const char *pString );
void		UTIL_AxisStringToUnitDir( Vector &dir, const char *pString );
void		UTIL_StringToIntArray( int *pVector, int count, const char *pString );
void		UTIL_StringToFloatArray( float *pVector, int count, const char *pString );
void		UTIL_StringToColor32( color32 *color, const char *pString );
void		UTIL_ClipPunchAngleOffset( QAngle &in, const QAngle &punch, const QAngle &clip );
void		UTIL_PredictedPosition( CBaseEntity *pTarget, float flTimeDelta, Vector *vecPredictedPosition );
void		UTIL_Beam( Vector &Start, Vector &End, int nModelIndex, int nHaloIndex, unsigned char FrameStart, unsigned char FrameRate,
				float Life, unsigned char Width, unsigned char EndWidth, unsigned char FadeLength, unsigned char Noise, unsigned char Red, unsigned char Green,
				unsigned char Blue, unsigned char Brightness, unsigned char Speed);

char		*UTIL_VarArgs( char *format, ... );
bool		UTIL_IsValidEntity( CBaseEntity *pEnt );
bool		UTIL_TeamsMatch( const char *pTeamName1, const char *pTeamName2 );

// snaps a vector to the nearest axis vector (if within epsilon)
void		UTIL_SnapDirectionToAxis( Vector &direction, float epsilon = 0.01f );

//Set the entity to point at the target specified
bool UTIL_PointAtEntity( CBaseEntity *pEnt, CBaseEntity *pTarget );
void UTIL_PointAtNamedEntity( CBaseEntity *pEnt, string_t strTarget );

// Search for water transition along a vertical line
float		UTIL_WaterLevel( const Vector &position, float minz, float maxz );
void		UTIL_Bubbles( const Vector& mins, const Vector& maxs, int count );
void		UTIL_BubbleTrail( const Vector& from, const Vector& to, int count );

// allows precacheing of other entities
void		UTIL_PrecacheOther( const char *szClassname );

// prints a message to each client
void			UTIL_ClientPrintAll( int msg_dest, const char *msg_name, const char *param1 = NULL, const char *param2 = NULL, const char *param3 = NULL, const char *param4 = NULL );
inline void		UTIL_CenterPrintAll( const char *msg_name, const char *param1 = NULL, const char *param2 = NULL, const char *param3 = NULL, const char *param4 = NULL ) 
{
	UTIL_ClientPrintAll( HUD_PRINTCENTER, msg_name, param1, param2, param3, param4 );
}

void UTIL_ValidateSoundName( string_t &name, const char *defaultStr );

// prints messages through the HUD
void ClientPrint( CBasePlayer *player, int msg_dest, const char *msg_name, const char *param1 = NULL, const char *param2 = NULL, const char *param3 = NULL, const char *param4 = NULL );

// prints a message to the HUD say (chat)
void		UTIL_SayText( const char *pText, CBaseEntity *pEntity );
void		UTIL_SayTextAll( const char *pText, CBaseEntity *pEntity );

class CGameTrace;
typedef CGameTrace trace_t;

//-----------------------------------------------------------------------------
// These are inlined for backwards compatibility
//-----------------------------------------------------------------------------
inline float UTIL_Approach( float target, float value, float speed )
{
	return Approach( target, value, speed );
}

inline float UTIL_ApproachAngle( float target, float value, float speed )
{
	return ApproachAngle( target, value, speed );
}

inline float UTIL_AngleDistance( float next, float cur )
{
	return AngleDistance( next, cur );
}

inline float UTIL_AngleMod(float a)
{
	return anglemod(a);
}

inline float UTIL_AngleDiff( float destAngle, float srcAngle )
{
	return AngleDiff( destAngle, srcAngle );
}

typedef struct hudtextparms_s
{
	float		x;
	float		y;
	int			effect;
	byte		r1, g1, b1, a1;
	byte		r2, g2, b2, a2;
	float		fadeinTime;
	float		fadeoutTime;
	float		holdTime;
	float		fxTime;
	int			channel;
} hudtextparms_t;


//-----------------------------------------------------------------------------
// Sets the model to be associated with an entity
//-----------------------------------------------------------------------------
void UTIL_SetModel( CBaseEntity *pEntity, const char *pModelName );


// prints as transparent 'title' to the HUD
void			UTIL_HudMessageAll( const hudtextparms_t &textparms, const char *pMessage );
void			UTIL_HudMessage( CBaseEntity *pEntity, const hudtextparms_t &textparms, const char *pMessage );

// Writes message to console with timestamp and FragLog header.
void			UTIL_LogPrintf( char *fmt, ... );

// Sorta like FInViewCone, but for nonNPCs. 
float UTIL_DotPoints ( const Vector &vecSrc, const Vector &vecCheck, const Vector &vecDir );

void UTIL_StripToken( const char *pKey, char *pDest );// for redundant keynames

// Misc functions
int BuildChangeList( levellist_t *pLevelList, int maxList );

//
// How did I ever live without ASSERT?
//
#ifdef	DEBUG
void DBG_AssertFunction(bool fExpr, const char* szExpr, const char* szFile, int szLine, const char* szMessage);
#define ASSERT(f)		DBG_AssertFunction((bool)((f)!=0), #f, __FILE__, __LINE__, NULL)
#define ASSERTSZ(f, sz)	DBG_AssertFunction((bool)((f)!=0), #f, __FILE__, __LINE__, sz)
#else	// !DEBUG
#define ASSERT(f)
#define ASSERTSZ(f, sz)
#endif	// !DEBUG


//
// Constants that were used only by QC (maybe not used at all now)
//
// Un-comment only as needed
//
#define LANGUAGE_ENGLISH				0
#define LANGUAGE_GERMAN					1
#define LANGUAGE_FRENCH					2
#define LANGUAGE_BRITISH				3

#include "globals.h"

#define	LFO_SQUARE			1
#define LFO_TRIANGLE		2
#define LFO_RANDOM			3

// func_rotating
#define SF_BRUSH_ROTATE_Y_AXIS		0
#define SF_BRUSH_ROTATE_START_ON	1
#define SF_BRUSH_ROTATE_BACKWARDS	2
#define SF_BRUSH_ROTATE_Z_AXIS		4
#define SF_BRUSH_ROTATE_X_AXIS		8


#define SF_BRUSH_ROTATE_SMALLRADIUS	128
#define SF_BRUSH_ROTATE_MEDIUMRADIUS 256
#define SF_BRUSH_ROTATE_LARGERADIUS 512

#define PUSH_BLOCK_ONLY_X	1
#define PUSH_BLOCK_ONLY_Y	2

// NOTE:  THESE ARE DEFINED IN THE ENGINE IN commom/protocol.h
// IF YOU CHANGE THEM THERE< CHANGE THEM HERE, TOO!!!
#define SVC_DEBUG_ENTITYTEXT_OVERLAY	46
#define SVC_DEBUG_BOX_OVERLAY			47
#define SVC_DEBUG_LINE_OVERLAY			48
#define SVC_DEBUG_TEXT_OVERLAY			49
#define SVC_DEBUG_GRID_OVERLAY			50
#define SVC_DEBUG_SCREENTEXT_OVERLAY	52
#define SVC_DEBUG_TRIANGLE_OVERLAY		53

#define SF_LIGHT_START_OFF		1

#define SPAWNFLAG_NOMESSAGE	1
#define SPAWNFLAG_NOTOUCH	1
#define SPAWNFLAG_DROIDONLY	4

#define SPAWNFLAG_USEONLY	1		// can't be touched, must be used (buttons)

#define TELE_PLAYER_ONLY	1
#define TELE_SILENT			2

// Sound Utilities

enum soundlevel_t;

void SENTENCEG_Init();
void SENTENCEG_Stop(edict_t *entity, int isentenceg, int ipick);
int SENTENCEG_PlayRndI(edict_t *entity, int isentenceg, float volume, soundlevel_t soundlevel, int flags, int pitch);
int SENTENCEG_PlayRndSz(edict_t *entity, const char *szrootname, float volume, soundlevel_t soundlevel, int flags, int pitch);
int SENTENCEG_PlaySequentialSz(edict_t *entity, const char *szrootname, float volume, soundlevel_t soundlevel, int flags, int pitch, int ipick, int freset);
int SENTENCEG_GetIndex(const char *szrootname);
int SENTENCEG_Lookup(const char *sample);

char TEXTURETYPE_Find( trace_t *ptr );

void UTIL_EmitSoundSuit(edict_t *entity, const char *sample);
int UTIL_EmitGroupIDSuit(edict_t *entity, int isentenceg);
int UTIL_EmitGroupnameSuit(edict_t *entity, const char *groupname);

#define PRECACHE_SOUND_ARRAY( a ) \
	{ for (int i = 0; i < ARRAYSIZE( a ); i++ ) enginesound->PrecacheSound((char *) a [i]); }

#define RANDOM_SOUND_ARRAY( array ) (array) [ random->RandomInt(0,ARRAYSIZE( (array) )-1) ]


class EntityMatrix : public VMatrix
{
public:
	void InitFromEntity( CBaseEntity *pEntity, int iAttachment=0 );
	void InitFromEntityLocal( CBaseEntity *entity );

	inline Vector LocalToWorld( const Vector &vVec ) const
	{
		return VMul4x3( vVec );
	}

	inline Vector WorldToLocal( const Vector &vVec ) const
	{
		return VMul4x3Transpose( vVec );
	}

	inline Vector LocalToWorldRotation( const Vector &vVec ) const
	{
		return VMul3x3( vVec );
	}

	inline Vector WorldToLocalRotation( const Vector &vVec ) const
	{
		return VMul3x3Transpose( vVec );
	}
};

inline float UTIL_DistApprox( const Vector &vec1, const Vector &vec2 );
inline float UTIL_DistApprox2D( const Vector &vec1, const Vector &vec2 );

//---------------------------------------------------------
//---------------------------------------------------------
inline float UTIL_DistApprox( const Vector &vec1, const Vector &vec2 )
{
	float dx;
	float dy;
	float dz;

	dx = vec1.x - vec2.x;
	dy = vec1.y - vec2.y;
	dz = vec1.z - vec2.z;

	return fabs(dx) + fabs(dy) + fabs(dz);
}

//---------------------------------------------------------
//---------------------------------------------------------
inline float UTIL_DistApprox2D( const Vector &vec1, const Vector &vec2 )
{
	float dx;
	float dy;

	dx = vec1.x - vec2.x;
	dy = vec1.y - vec2.y;

	return fabs(dx) + fabs(dy);
}


struct datamap_t;
extern const char	*UTIL_FunctionToName( datamap_t *pMap, void *function );
extern void			*UTIL_FunctionFromName( datamap_t *pMap, const char *pName );

int UTIL_GetCommandClientIndex( void );
CBasePlayer *UTIL_GetCommandClient( void );

// These are accessed by appropriate macros
float	SharedRandomFloat( const char *filename, int line, float flMinVal, float flMaxVal, int additionalSeed = 0 );
int		SharedRandomInt( const char *filename, int line, int iMinVal, int iMaxVal, int additionalSeed = 0 );
Vector	SharedRandomVector( const char *filename, int line, float minVal, float maxVal, int additionalSeed = 0 );
QAngle	SharedRandomAngle( const char *filename, int line, float minVal, float maxVal, int additionalSeed = 0 );

#define SHARED_RANDOMFLOAT_SEED( minval, maxval, seed ) \
	SharedRandomFloat( __FILE__, __LINE__, minval, maxval, seed )
#define SHARED_RANDOMINT_SEED( minval, maxval, seed ) \
	SharedRandomInt( __FILE__, __LINE__, minval, maxval, seed )
#define SHARED_RANDOMVECTOR_SEED( minval, maxval, seed ) \
	SharedRandomVector( __FILE__, __LINE__, minval, maxval, seed )
#define SHARED_RANDOMANGLE_SEED( minval, maxval, seed ) \
	SharedRandomAngle( __FILE__, __LINE__, minval, maxval, seed )

#define SHARED_RANDOMFLOAT( minval, maxval ) \
	SharedRandomFloat( __FILE__, __LINE__, minval, maxval, 0 )
#define SHARED_RANDOMINT( minval, maxval ) \
	SharedRandomInt( __FILE__, __LINE__, minval, maxval, 0 )
#define SHARED_RANDOMVECTOR( minval, maxval ) \
	SharedRandomVector( __FILE__, __LINE__, minval, maxval, 0 )
#define SHARED_RANDOMANGLE( minval, maxval ) \
	SharedRandomAngle( __FILE__, __LINE__, minval, maxval, 0 )

AngularImpulse WorldToLocalRotation( const VMatrix &localToWorld, const Vector &worldAxis, float rotation );

#endif // UTIL_H
