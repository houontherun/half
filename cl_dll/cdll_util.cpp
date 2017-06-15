//======== (C) Copyright 1999, 2000 Valve, L.L.C. All rights reserved. ========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//
// Purpose: 
//
// $Workfile:     $
// $NoKeywords: $
//=============================================================================
#include "cbase.h"
#include <stdarg.h>
#include "hud.h"
#include "imessagechars.h"
#include "itextmessage.h"
#include "materialsystem/IMaterial.h"
#include "materialsystem/ITexture.h"
#include "materialsystem/IMaterialSystem.h"
#include "imovehelper.h"
#include "checksum_crc.h"
#include "decals.h"
#include "iefx.h"
#include "view_scene.h"
#include "model_types.h"
#include "engine/IEngineTrace.h"
#include "engine/ivmodelinfo.h"
#include "c_te_effect_dispatch.h"
#include <vgui_controls/Controls.h>
#include <vgui/ISurface.h>

//-----------------------------------------------------------------------------
// Purpose: Performs a var args printf into a static return buffer
// Input  : *format - 
//			... - 
// Output : char
//-----------------------------------------------------------------------------
char *VarArgs( char *format, ... )
{
	va_list		argptr;
	static char		string[1024];
	
	va_start (argptr, format);
	Q_vsnprintf (string, sizeof( string ), format,argptr);
	va_end (argptr);

	return string;	
}
	
//-----------------------------------------------------------------------------
// Purpose: Returns true if the entity index corresponds to a player slot 
// Input  : index - 
// Output : bool
//-----------------------------------------------------------------------------
bool IsPlayerIndex( int index )
{
	return ( index >= 1 && index <= engine->GetMaxClients() ) ? true : false;
}

//-----------------------------------------------------------------------------
// Purpose: Convert angles to -180 t 180 range
// Input  : angles - 
//-----------------------------------------------------------------------------
void NormalizeAngles( QAngle& angles )
{
	int i;
	
	// Normalize angles to -180 to 180 range
	for ( i = 0; i < 3; i++ )
	{
		if ( angles[i] > 180.0 )
		{
			angles[i] -= 360.0;
		}
		else if ( angles[i] < -180.0 )
		{
			angles[i] += 360.0;
		}
	}
}

//-----------------------------------------------------------------------------
// Purpose: Interpolate Euler angles using quaternions to avoid singularities
// Input  : start - 
//			end - 
//			output - 
//			frac - 
//-----------------------------------------------------------------------------
void InterpolateAngles( const QAngle& start, const QAngle& end, QAngle& output, float frac )
{
	Quaternion src, dest;

	// Convert to quaternions
	AngleQuaternion( start, src );
	AngleQuaternion( end, dest );

	Quaternion result;

	// Slerp
	QuaternionSlerp( src, dest, frac, result );

	// Convert to euler
	QuaternionAngles( result, output );
}

//-----------------------------------------------------------------------------
// Purpose: Simple linear interpolation
// Input  : frac - 
//			src - 
//			dest - 
//			output - 
//-----------------------------------------------------------------------------
void InterpolateVector( float frac, const Vector& src, const Vector& dest, Vector& output )
{
	int i;

	for ( i = 0; i < 3; i++ )
	{
		output[ i ] = src[ i ] + frac * ( dest[ i ] - src[ i ] );
	}
}

client_textmessage_t *TextMessageGet( const char *pName )
{ 
	return engine->TextMessageGet( pName );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
typedef struct
{
	int		m_nWidth;
	int		m_nHeight;
} SCREENINFO;

static SCREENINFO g_ScreenInfo;

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void SetScreenSize( void )
{
	engine->GetScreenSize( g_ScreenInfo.m_nWidth, g_ScreenInfo.m_nHeight );
}

//-----------------------------------------------------------------------------
// Purpose: ScreenHeight returns the height of the screen, in pixels
// Output : int
//-----------------------------------------------------------------------------
int ScreenHeight( void )
{
	return g_ScreenInfo.m_nHeight;
}

//-----------------------------------------------------------------------------
// Purpose: ScreenWidth returns the width of the screen, in pixels
// Output : int
//-----------------------------------------------------------------------------
int ScreenWidth( void )
{
	return g_ScreenInfo.m_nWidth;
}

//-----------------------------------------------------------------------------
// Purpose: Return the difference between two angles
// Input  : destAngle - 
//			srcAngle - 
// Output : float
//-----------------------------------------------------------------------------
float UTIL_AngleDiff( float destAngle, float srcAngle )
{
	float delta;

	delta = destAngle - srcAngle;
	if ( destAngle > srcAngle )
	{
		while ( delta >= 180 )
			delta -= 360;
	}
	else
	{
		while ( delta <= -180 )
			delta += 360;
	}
	return delta;
}


//-----------------------------------------------------------------------------
// Little utility class to deal with material references
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// constructor, destructor
//-----------------------------------------------------------------------------
CMaterialReference::CMaterialReference( char const* pMaterialName ) : m_pMaterial( 0 )
{
	if (pMaterialName)
	{
		Init(pMaterialName);
	}
}

CMaterialReference::~CMaterialReference()
{
	Shutdown();
}

//-----------------------------------------------------------------------------
// Attach to a material
//-----------------------------------------------------------------------------
void CMaterialReference::Init( char const* pMaterialName )
{
	m_pMaterial = materials->FindMaterial(pMaterialName, 0);
	Assert( m_pMaterial );
	if (m_pMaterial)
		m_pMaterial->IncrementReferenceCount();
}

void CMaterialReference::Init( IMaterial* pMaterial )
{
	m_pMaterial = pMaterial;
	if (m_pMaterial)
	{
		m_pMaterial->IncrementReferenceCount();
	}
}

void CMaterialReference::Init( CMaterialReference& ref )
{
	m_pMaterial = ref.m_pMaterial;
	if (m_pMaterial)
	{
		m_pMaterial->IncrementReferenceCount();
	}
}

//-----------------------------------------------------------------------------
// Detach from a material
//-----------------------------------------------------------------------------
void CMaterialReference::Shutdown( )
{
	if ( m_pMaterial )
	{
		m_pMaterial->DecrementReferenceCount();
		m_pMaterial = NULL;
	}
}


//-----------------------------------------------------------------------------
// Little utility class to deal with texture references
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// constructor, destructor
//-----------------------------------------------------------------------------
CTextureReference::CTextureReference( ) : m_pTexture(NULL)
{
}

CTextureReference::~CTextureReference( )
{
	Shutdown();
}

//-----------------------------------------------------------------------------
// Attach to a texture
//-----------------------------------------------------------------------------
void CTextureReference::Init( ITexture* pTexture )
{
	Shutdown();

	m_pTexture = pTexture;
	if (m_pTexture)
	{
		m_pTexture->IncrementReferenceCount();
	}
}

void CTextureReference::InitRenderTarget( int w, int h, ImageFormat fmt, bool depth )
{
	Shutdown();

	// NOTE: Refcount returned by CreateRenderTargetTexture is 1
	m_pTexture = materials->CreateRenderTargetTexture( w, h, fmt, depth );
#ifdef _DEBUG
	ITexture *pSaveRenderTarget = materials->GetRenderTarget();
	int saveX, saveY, saveWidth, saveHeight;
	materials->GetViewport( saveX, saveY, saveWidth, saveHeight );
	materials->SetRenderTarget( m_pTexture );
	materials->Viewport( 0, 0, w, h );
	materials->ClearColor4ub( 0, 0, 0, 0 );
	materials->ClearBuffers( true, false );
	materials->SetRenderTarget( pSaveRenderTarget );
	materials->Viewport( saveX, saveY, saveWidth, saveHeight );
#endif
	Assert( m_pTexture );
}

//-----------------------------------------------------------------------------
// Detach from a texture
//-----------------------------------------------------------------------------
void CTextureReference::Shutdown()
{
	if ( m_pTexture )
	{
		m_pTexture->DecrementReferenceCount();
		m_pTexture = NULL;
	}
}


float UTIL_WaterLevel( const Vector &position, float minz, float maxz )
{
	Vector midUp = position;
	midUp.z = minz;

	if ( !(UTIL_PointContents(midUp) & MASK_WATER) )
		return minz;

	midUp.z = maxz;
	if ( UTIL_PointContents(midUp) & MASK_WATER )
		return maxz;

	float diff = maxz - minz;
	while (diff > 1.0)
	{
		midUp.z = minz + diff/2.0;
		if ( UTIL_PointContents(midUp) & MASK_WATER )
		{
			minz = midUp.z;
		}
		else
		{
			maxz = midUp.z;
		}
		diff = maxz - minz;
	}

	return midUp.z;
}

void UTIL_Bubbles( const Vector& mins, const Vector& maxs, int count )
{
	Vector mid =  (mins + maxs) * 0.5;

	float flHeight = UTIL_WaterLevel( mid,  mid.z, mid.z + 1024 );
	flHeight = flHeight - mins.z;

	CPASFilter filter( mid );

	int bubbles = modelinfo->GetModelIndex( "sprites/bubble.vmt" );

	te->Bubbles( filter, 0.0,
		&mins, &maxs, flHeight, bubbles, count, 8.0 );
}

void UTIL_ScreenShake( const Vector &center, float amplitude, float frequency, float duration, float radius, ShakeCommand_t eCommand, bool bAirShake )
{
	// Nothing for now
}

char TEXTURETYPE_Find( trace_t *ptr )
{
	surfacedata_t *psurfaceData = physprops->GetSurfaceData( ptr->surface.surfaceProps );

	return psurfaceData->gameMaterial;
}

//-----------------------------------------------------------------------------
// Purpose: Make a tracer effect
//-----------------------------------------------------------------------------
void UTIL_Tracer( const Vector &vecStart, const Vector &vecEnd, int iEntIndex, int iAttachment, float flVelocity, bool bWhiz, char *pCustomTracerName )
{
	CEffectData data;
	data.m_vStart = vecStart;
	data.m_vOrigin = vecEnd;
	data.m_nEntIndex = iEntIndex;
	data.m_flScale = flVelocity;

	// Flags
	if ( bWhiz )
	{
		data.m_fFlags |= TRACER_FLAG_WHIZ;
	}
	if ( iAttachment != TRACER_DONT_USE_ATTACHMENT )
	{
		data.m_fFlags |= TRACER_FLAG_USEATTACHMENT;
		// Stomp the start, since it's not going to be used anyway
		data.m_vStart[0] = iAttachment;
	}

	// Fire it off
	if ( pCustomTracerName )
	{
		DispatchEffect( pCustomTracerName, data );
	}
	else
	{
		DispatchEffect( "Tracer", data );
	}
}
//------------------------------------------------------------------------------
// Purpose : Creates both an decal and any associated impact effects (such
//			 as flecks) for the given iDamageType and the trace's end position
// Input   :
// Output  :
//------------------------------------------------------------------------------
void UTIL_ImpactTrace( trace_t *pTrace, int iDamageType, char *pCustomImpactName )
{
	C_BaseEntity *pEntity = pTrace->m_pEnt;

	// Is the entity valid, is the surface sky?
	if ( !pEntity || (pTrace->surface.flags & SURF_SKY) )
		return;

	if (pTrace->fraction == 1.0)
		return;

	pEntity->ImpactTrace( pTrace, iDamageType, pCustomImpactName );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
int UTIL_PrecacheDecal( const char *name, bool preload )
{
	return effects->Draw_DecalIndexFromName( (char*)name );
}

extern short g_sModelIndexSmoke;

void UTIL_Smoke( const Vector &origin, const float scale, const float framerate )
{
	CPVSFilter filter( origin );
	te->Smoke( filter, 0.0f, &origin, g_sModelIndexSmoke, scale, framerate );
}

void UTIL_SetOrigin( C_BaseEntity *entity, const Vector &vecOrigin )
{
	entity->SetLocalOrigin( vecOrigin );
}

//-----------------------------------------------------------------------------
// Purpose: Helper function get get determinisitc random values for shared/prediction code
// Input  : seedvalue - 
//			*module - 
//			line - 
// Output : static int
//-----------------------------------------------------------------------------
static int SeedFileLineHash( int seedvalue, const char *module, int line, int additionalSeed )
{
	CRC32_t retval;

	CRC32_Init( &retval );

	CRC32_ProcessBuffer( &retval, (void *)&seedvalue, sizeof( int ) );
	CRC32_ProcessBuffer( &retval, (void *)&additionalSeed, sizeof( int ) );
	CRC32_ProcessBuffer( &retval, (void *)module, Q_strlen( module ) );
	CRC32_ProcessBuffer( &retval, (void *)&line, sizeof( int ) );

	CRC32_Final( &retval );

	return (int)( retval );
}

//-----------------------------------------------------------------------------
// Purpose: Accessed by SHARED_RANDOMFLOAT macro to get c/s neutral random float for prediction
// Input  : *filename - 
//			line - 
//			flMinVal - 
//			flMaxVal - 
// Output : float
//-----------------------------------------------------------------------------
float SharedRandomFloat( const char *filename, int line, float flMinVal, float flMaxVal, int additionalSeed /*=0*/ )
{
	Assert( C_BaseEntity::GetPredictionRandomSeed() != -1 );

	int seed = SeedFileLineHash( C_BaseEntity::GetPredictionRandomSeed(), filename, line, additionalSeed );
	RandomSeed( seed );
	return RandomFloat( flMinVal, flMaxVal );
}

//-----------------------------------------------------------------------------
// Purpose: Accessed by SHARED_RANDOMINT macro to get c/s neutral random int for prediction
// Input  : *filename - 
//			line - 
//			iMinVal - 
//			iMaxVal - 
// Output : int
//-----------------------------------------------------------------------------
int SharedRandomInt( const char *filename, int line, int iMinVal, int iMaxVal, int additionalSeed /*=0*/ )
{
	Assert( C_BaseEntity::GetPredictionRandomSeed() != -1 );

	int seed = SeedFileLineHash( C_BaseEntity::GetPredictionRandomSeed(), filename, line, additionalSeed );
	RandomSeed( seed );
	return RandomInt( iMinVal, iMaxVal );
}

//-----------------------------------------------------------------------------
// Purpose: Accessed by SHARED_RANDOMVECTOR macro to get c/s neutral random Vector for prediction
// Input  : *filename - 
//			line - 
//			minVal - 
//			maxVal - 
// Output : Vector
//-----------------------------------------------------------------------------
Vector SharedRandomVector( const char *filename, int line, float minVal, float maxVal, int additionalSeed /*=0*/ )
{
	Assert( C_BaseEntity::GetPredictionRandomSeed() != -1 );

	int seed = SeedFileLineHash( C_BaseEntity::GetPredictionRandomSeed(), filename, line, additionalSeed );
	RandomSeed( seed );
	// HACK:  Can't call RandomVector/Angle because it uses rand() not vstlib Random*() functions!
	// Get a random vector.
	Vector random;
	random.x = RandomFloat( minVal, maxVal );
	random.y = RandomFloat( minVal, maxVal );
	random.z = RandomFloat( minVal, maxVal );
	return random;
}

//-----------------------------------------------------------------------------
// Purpose: Accessed by SHARED_RANDOMANGLE macro to get c/s neutral random QAngle for prediction
// Input  : *filename - 
//			line - 
//			minVal - 
//			maxVal - 
// Output : QAngle
//-----------------------------------------------------------------------------
QAngle SharedRandomAngle( const char *filename, int line, float minVal, float maxVal, int additionalSeed /*=0*/ )
{
	Assert( C_BaseEntity::GetPredictionRandomSeed() != -1 );

	int seed = SeedFileLineHash( C_BaseEntity::GetPredictionRandomSeed(), filename, line, additionalSeed );
	RandomSeed( seed );

	// HACK:  Can't call RandomVector/Angle because it uses rand() not vstlib Random*() functions!
	// Get a random vector.
	Vector random;
	random.x = RandomFloat( minVal, maxVal );
	random.y = RandomFloat( minVal, maxVal );
	random.z = RandomFloat( minVal, maxVal );
	return QAngle( random.x, random.y, random.z );
}

//#define PRECACHE_OTHER_ONCE
// UNDONE: Do we need this to avoid doing too much of this?  Measure startup times and see
#if PRECACHE_OTHER_ONCE

#include "utlsymbol.h"
class CPrecacheOtherList : public CAutoServerSystem
{
public:
	virtual void LevelInitPreEntity();
	virtual void LevelShutdownPostEntity();

	bool AddOrMarkPrecached( const char *pClassname );

private:
	CUtlSymbolTable		m_list;
};

void CPrecacheOtherList::LevelInitPreEntity()
{
	m_list.RemoveAll();
}

void CPrecacheOtherList::LevelShutdownPostEntity()
{
	m_list.RemoveAll();
}

//-----------------------------------------------------------------------------
// Purpose: mark or add
// Input  : *pEntity - 
// Output : Returns true on success, false on failure.
//-----------------------------------------------------------------------------
bool CPrecacheOtherList::AddOrMarkPrecached( const char *pClassname )
{
	CUtlSymbol sym = m_list.Find( pClassname );
	if ( sym.IsValid() )
		return false;

	m_list.AddString( pClassname );
	return true;
}

CPrecacheOtherList g_PrecacheOtherList;
#endif

void UTIL_PrecacheOther( const char *szClassname )
{
#if PRECACHE_OTHER_ONCE
	// already done this one?, if not, mark as done
	if ( !g_PrecacheOtherList.AddOrMarkPrecached( szClassname ) )
		return;
#endif

	// Client should only do this once entities are coming down from server!!!
	// Assert( engine->IsConnected() );

	C_BaseEntity	*pEntity = CreateEntityByName( szClassname );
	if ( !pEntity )
	{
		Warning( "NULL Ent in UTIL_PrecacheOther\n" );
		return;
	}
	
	if (pEntity)
	{
		pEntity->Precache( );
	}

	// Bye bye
	pEntity->Release();
}

static csurface_t	g_NullSurface = { "**empty**", 0 };
//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void UTIL_SetTrace(trace_t& trace, const Ray_t& ray, C_BaseEntity *ent, float fraction, int hitgroup, unsigned int contents, const Vector& normal, float intercept )
{
	trace.startsolid = (fraction == 0.0f);
	trace.fraction = fraction;
	VectorCopy( ray.m_Start, trace.startpos );
	VectorMA( ray.m_Start, fraction, ray.m_Delta, trace.endpos );
	VectorCopy( normal, trace.plane.normal );
	trace.plane.dist = intercept;
	trace.m_pEnt = C_BaseEntity::Instance( ent );
	trace.hitgroup = hitgroup;
	trace.surface =	g_NullSurface;
	trace.contents = contents;
}

//-----------------------------------------------------------------------------
// Purpose: Get the x & y positions of a world position in screenspace
//			Returns true if it's onscreen
//-----------------------------------------------------------------------------
bool GetVectorInScreenSpace( Vector pos, int& iX, int& iY, Vector *vecOffset )
{
	Vector screen;

	// Apply the offset, if one was specified
	if ( vecOffset != NULL )
		pos += *vecOffset;

	// Transform to screen space
	int iFacing = ScreenTransform( pos, screen );
	iX =  0.5 * screen[0] * ScreenWidth();
	iY = -0.5 * screen[1] * ScreenHeight();
	iX += 0.5 * ScreenWidth();
	iY += 0.5 * ScreenHeight();

	// Make sure the player's facing it
	if ( iFacing )
	{
		// We're actually facing away from the Target. Stomp the screen position.
		iX = -640;
		iY = -640;
		return false;
	}

	return true;
}

//-----------------------------------------------------------------------------
// Purpose: Get the x & y positions of an entity in screenspace
//			Returns true if it's onscreen
//-----------------------------------------------------------------------------
bool GetTargetInScreenSpace( C_BaseEntity *pTargetEntity, int& iX, int& iY, Vector *vecOffset )
{
	return GetVectorInScreenSpace( pTargetEntity->WorldSpaceCenter(), iX, iY, vecOffset );
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *player - 
//			msg_dest - 
//			*msg_name - 
//			*param1 - 
//			*param2 - 
//			*param3 - 
//			*param4 - 
//-----------------------------------------------------------------------------
void ClientPrint( C_BasePlayer *player, int msg_dest, const char *msg_name, const char *param1 /*= NULL*/, const char *param2 /*= NULL*/, const char *param3 /*= NULL*/, const char *param4 /*= NULL*/ )
{
}

//-----------------------------------------------------------------------------
// class CFlaggedEntitiesEnum
//-----------------------------------------------------------------------------
// enumerate entities that match a set of edict flags into a static array
class CFlaggedEntitiesEnum : public IPartitionEnumerator
{
public:
	CFlaggedEntitiesEnum( C_BaseEntity **pList, int listMax, int flagMask );
	// This gets called	by the enumeration methods with each element
	// that passes the test.
	virtual IterationRetval_t EnumElement( IHandleEntity *pHandleEntity );
	
	int GetCount() { return m_count; }
	bool AddToList( C_BaseEntity *pEntity );
	
private:
	C_BaseEntity		**m_pList;
	int				m_listMax;
	int				m_flagMask;
	int				m_count;
};

CFlaggedEntitiesEnum::CFlaggedEntitiesEnum( C_BaseEntity **pList, int listMax, int flagMask )
{
	m_pList = pList;
	m_listMax = listMax;
	m_flagMask = flagMask;
	m_count = 0;
}

bool CFlaggedEntitiesEnum::AddToList( C_BaseEntity *pEntity )
{
	if ( m_count >= m_listMax )
		return false;
	m_pList[m_count] = pEntity;
	m_count++;
	return true;
}

IterationRetval_t CFlaggedEntitiesEnum::EnumElement( IHandleEntity *pHandleEntity )
{
	IClientEntity *pClientEntity = cl_entitylist->GetClientEntityFromHandle( pHandleEntity->GetRefEHandle() );
	C_BaseEntity *pEntity = pClientEntity ? pClientEntity->GetBaseEntity() : NULL;
	if ( pEntity )
	{
		if ( m_flagMask && !(pEntity->GetFlags() & m_flagMask) )	// Does it meet the criteria?
			return ITERATION_CONTINUE;

		if ( !AddToList( pEntity ) )
			return ITERATION_STOP;
	}

	return ITERATION_CONTINUE;
}

//-----------------------------------------------------------------------------
// Purpose: Pass in an array of pointers and an array size, it fills the array and returns the number inserted
// Input  : **pList - 
//			listMax - 
//			&mins - 
//			&maxs - 
//			flagMask - 
// Output : int
//-----------------------------------------------------------------------------
int UTIL_EntitiesInBox( C_BaseEntity **pList, int listMax, const Vector &mins, const Vector &maxs, int flagMask )
{
	CFlaggedEntitiesEnum boxEnum( pList, listMax, flagMask );
	partition->EnumerateElementsInBox( PARTITION_CLIENT_NON_STATIC_EDICTS, mins, maxs, false, &boxEnum );
	
	return boxEnum.GetCount();

}

//-----------------------------------------------------------------------------
// Purpose: Pass in an array of pointers and an array size, it fills the array and returns the number inserted
// Input  : **pList - 
//			listMax - 
//			&center - 
//			radius - 
//			flagMask - 
// Output : int
//-----------------------------------------------------------------------------
int UTIL_EntitiesInSphere( C_BaseEntity **pList, int listMax, const Vector &center, float radius, int flagMask )
{
	CFlaggedEntitiesEnum sphereEnum( pList, listMax, flagMask );
	partition->EnumerateElementsInSphere( PARTITION_CLIENT_NON_STATIC_EDICTS, center, radius, false, &sphereEnum );

	return sphereEnum.GetCount();

}

CEntitySphereQuery::CEntitySphereQuery( const Vector &center, float radius, int flagMask )
{
	m_listIndex = 0;
	m_listCount = UTIL_EntitiesInSphere( m_pList, ARRAYSIZE(m_pList), center, radius, flagMask );
}

CBaseEntity *CEntitySphereQuery::GetCurrentEntity()
{
	if ( m_listIndex < m_listCount )
		return m_pList[m_listIndex];
	return NULL;
}

//-----------------------------------------------------------------------------
// Purpose: Slightly modified strtok. Does not modify the input string. Does
//			not skip over more than one separator at a time. This allows parsing
//			strings where tokens between separators may or may not be present:
//
//			Door01,,,0 would be parsed as "Door01"  ""  ""  "0"
//			Door01,Open,,0 would be parsed as "Door01"  "Open"  ""  "0"
//
// Input  : token - Returns with a token, or zero length if the token was missing.
//			str - String to parse.
//			sep - Character to use as separator. UNDONE: allow multiple separator chars
// Output : Returns a pointer to the next token to be parsed.
//-----------------------------------------------------------------------------
const char *nexttoken(char *token, const char *str, char sep)
{
	if ((str == NULL) || (*str == '\0'))
	{
		*token = '\0';
		return(NULL);
	}

	//
	// Copy everything up to the first separator into the return buffer.
	// Do not include separators in the return buffer.
	//
	while ((*str != sep) && (*str != '\0'))
	{
		*token++ = *str++;
	}
	*token = '\0';

	//
	// Advance the pointer unless we hit the end of the input string.
	//
	if (*str == '\0')
	{
		return(str);
	}

	return(++str);
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : font - 
//			*str - 
// Output : int
//-----------------------------------------------------------------------------
int UTIL_ComputeStringWidth( vgui::HFont& font, const char *str )
{
	int pixels = 0;
	char *p = (char *)str;
	while ( *p )
	{
		pixels += vgui::surface()->GetCharacterWidth( font, *p++ );
	}
	return pixels;
}