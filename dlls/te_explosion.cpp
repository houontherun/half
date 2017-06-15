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
// $Date:         $
//
//-----------------------------------------------------------------------------
// $Log: $
//
// $NoKeywords: $
//=============================================================================
#include "cbase.h"
#include "te_particlesystem.h"

extern short	g_sModelIndexFireball;			// (in combatweapon.cpp) holds the index for the smoke cloud

//-----------------------------------------------------------------------------
// Purpose: Dispatches explosion tempentity
//-----------------------------------------------------------------------------
class CTEExplosion : public CTEParticleSystem
{
public:
	DECLARE_CLASS( CTEExplosion, CTEParticleSystem );
	DECLARE_SERVERCLASS();

					CTEExplosion( const char *name );
	virtual			~CTEExplosion( void );

	virtual void	Test( const Vector& current_origin, const QAngle& current_angles );
	virtual	void	Create( IRecipientFilter& filter, float delay = 0.0f );


public:
	CNetworkVar( int, m_nModelIndex );
	CNetworkVar( float, m_fScale );
	CNetworkVar( int, m_nFrameRate );
	CNetworkVar( int, m_nFlags );
	CNetworkVector( m_vecNormal );
	CNetworkVar( unsigned char, m_chMaterialType );
	CNetworkVar( int, m_nRadius );
	CNetworkVar( int, m_nMagnitude );
};

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *name - 
//-----------------------------------------------------------------------------
CTEExplosion::CTEExplosion( const char *name ) :
	BaseClass( name )
{
	m_nModelIndex = 0;
	m_fScale = 0;
	m_nFrameRate = 0;
	m_nFlags = 0;
	m_vecNormal.Init();
	m_chMaterialType = 'C';
	m_nRadius = 0;
	m_nMagnitude = 0;
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CTEExplosion::~CTEExplosion( void )
{
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *current_origin - 
//			*current_angles - 
//-----------------------------------------------------------------------------
void CTEExplosion::Test( const Vector& current_origin, const QAngle& current_angles )
{
	// Fill in data
	m_nModelIndex = g_sModelIndexFireball;
	m_fScale = 0.5;
	m_nFrameRate = 15;
	m_nFlags = TE_EXPLFLAG_NONE;
	m_vecOrigin = current_origin;
	
	Vector forward;

	m_vecOrigin.GetForModify()[2] += 24;

	AngleVectors( current_angles, &forward );
	forward[2] = 0.0;
	VectorNormalize( forward );

	m_vecOrigin += forward * 50;

	CBroadcastRecipientFilter filter;
	Create( filter, 0.0 );
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : msg_dest - 
//			delay - 
//			*origin - 
//			*recipient - 
//-----------------------------------------------------------------------------
void CTEExplosion::Create( IRecipientFilter& filter, float delay )
{
	engine->PlaybackTempEntity( filter, delay, 
		(void *)this, GetServerClass()->m_pTable, GetServerClass()->m_ClassID );
}

IMPLEMENT_SERVERCLASS_ST(CTEExplosion, DT_TEExplosion)
	SendPropModelIndex( SENDINFO(m_nModelIndex) ),
	SendPropFloat( SENDINFO(m_fScale ), 9, 0, 0.0, 51.2 ),
	SendPropInt( SENDINFO(m_nFrameRate), 8, SPROP_UNSIGNED ),
	SendPropInt( SENDINFO(m_nFlags), 8, SPROP_UNSIGNED ),
	SendPropVector( SENDINFO(m_vecNormal), -1, SPROP_COORD),
	SendPropInt( SENDINFO(m_chMaterialType), 8, SPROP_UNSIGNED ),
	SendPropInt( SENDINFO(m_nRadius), 32, SPROP_UNSIGNED ),
	SendPropInt( SENDINFO(m_nMagnitude), 32, SPROP_UNSIGNED ),
END_SEND_TABLE()

// Singleton to fire TEExplosion objects
static CTEExplosion g_TEExplosion( "Explosion" );

void TE_Explosion( IRecipientFilter& filter, float delay,
	const Vector* pos, int modelindex, float scale, int framerate, int flags, int radius, int magnitude, const Vector* normal, unsigned char materialType )
{
	g_TEExplosion.m_vecOrigin		= *pos;
	g_TEExplosion.m_nModelIndex		= modelindex;	
	g_TEExplosion.m_fScale			= scale;
	g_TEExplosion.m_nFrameRate		= framerate;
	g_TEExplosion.m_nFlags			= flags;
	g_TEExplosion.m_nRadius			= radius;
	g_TEExplosion.m_nMagnitude		= magnitude;

	if ( normal )
		g_TEExplosion.m_vecNormal	= *normal;
	else 
		g_TEExplosion.m_vecNormal	= Vector(0,0,1);
	g_TEExplosion.m_chMaterialType	= materialType;

	// Send it over the wire
	g_TEExplosion.Create( filter, delay );
}