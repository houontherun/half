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
#include "basetempentity.h"

extern short	g_sModelIndexBubbles;// holds the index for the bubbles model

//-----------------------------------------------------------------------------
// Purpose: Dispatches bubble trail
//-----------------------------------------------------------------------------
class CTEBubbleTrail : public CBaseTempEntity
{
public:
	DECLARE_CLASS( CTEBubbleTrail, CBaseTempEntity );

					CTEBubbleTrail( const char *name );
	virtual			~CTEBubbleTrail( void );

	virtual void	Test( const Vector& current_origin, const QAngle& current_angles );
	virtual	void	Create( IRecipientFilter& filter, float delay = 0.0f );

	DECLARE_SERVERCLASS();

public:
	CNetworkVector( m_vecMins );
	CNetworkVector( m_vecMaxs );
	CNetworkVar( float, m_fHeight );
	CNetworkVar( int, m_nModelIndex );
	CNetworkVar( int, m_nCount );
	CNetworkVar( float, m_fSpeed );
};

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *name - 
//-----------------------------------------------------------------------------
CTEBubbleTrail::CTEBubbleTrail( const char *name ) :
	CBaseTempEntity( name )
{
	m_vecMins.Init();
	m_vecMaxs.Init();
	m_fHeight = 0.0;
	m_nModelIndex = 0;
	m_nCount = 0;
	m_fSpeed = 0;
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CTEBubbleTrail::~CTEBubbleTrail( void )
{
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *current_origin - 
//			*current_angles - 
//-----------------------------------------------------------------------------
void CTEBubbleTrail::Test( const Vector& current_origin, const QAngle& current_angles )
{
	// Fill in data
	m_vecMins = current_origin;
	
	Vector forward;

	m_vecMins.GetForModify()[2] += 24;

	AngleVectors( current_angles, &forward );
	forward[2] = 0.0;
	VectorNormalize( forward );

	VectorMA( m_vecMins, 100.0, forward, m_vecMins.GetForModify() );

	m_vecMaxs = m_vecMins + Vector( 256, 256, 256 );

	m_fSpeed = 8;
	m_nCount = 20;
	m_fHeight = 128;

	m_nModelIndex = g_sModelIndexBubbles;

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
void CTEBubbleTrail::Create( IRecipientFilter& filter, float delay )
{
	engine->PlaybackTempEntity( filter, delay, 
		(void *)this, GetServerClass()->m_pTable, GetServerClass()->m_ClassID );
}

IMPLEMENT_SERVERCLASS_ST(CTEBubbleTrail, DT_TEBubbleTrail)
	SendPropVector( SENDINFO(m_vecMins), -1, SPROP_COORD),
	SendPropVector( SENDINFO(m_vecMaxs), -1, SPROP_COORD),
	SendPropModelIndex( SENDINFO(m_nModelIndex) ),
	SendPropFloat( SENDINFO(m_fHeight ), 17, 0, MIN_COORD_INTEGER, MAX_COORD_INTEGER ),
	SendPropInt( SENDINFO(m_nCount), 8, SPROP_UNSIGNED ),
	SendPropFloat( SENDINFO(m_fSpeed ), 17, 0, MIN_COORD_INTEGER, MAX_COORD_INTEGER ),
END_SEND_TABLE()


// Singleton to fire TEBubbleTrail objects
static CTEBubbleTrail g_TEBubbleTrail( "Bubble Trail" );

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : msg_dest - 
//			delay - 
//			*origin - 
//			*recipient - 
//			*mins - 
//			*maxs - 
//			height - 
//			modelindex - 
//			count - 
//			speed - 
//-----------------------------------------------------------------------------
void TE_BubbleTrail( IRecipientFilter& filter, float delay,
	const Vector* mins, const Vector* maxs, float height, int modelindex, int count, float speed )
{
	g_TEBubbleTrail.m_vecMins = *mins;
	g_TEBubbleTrail.m_vecMaxs = *maxs;
	g_TEBubbleTrail.m_fHeight = height;
	g_TEBubbleTrail.m_nModelIndex = modelindex;
	g_TEBubbleTrail.m_nCount = count;
	g_TEBubbleTrail.m_fSpeed = speed;

	// Send it over the wire
	g_TEBubbleTrail.Create( filter, delay );
}