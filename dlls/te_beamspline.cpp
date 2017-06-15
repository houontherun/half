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

#define MAX_SPLINE_POINTS 16
//-----------------------------------------------------------------------------
// Purpose: Dispatches beam spline tempentity
//-----------------------------------------------------------------------------
class CTEBeamSpline : public CBaseTempEntity
{
public:
	DECLARE_CLASS( CTEBeamSpline, CBaseTempEntity );

					CTEBeamSpline( const char *name );
	virtual			~CTEBeamSpline( void );

	virtual void	Test( const Vector& current_origin, const QAngle& current_angles );
	virtual	void	Create( IRecipientFilter& filter, float delay = 0.0f );

	DECLARE_SERVERCLASS();

public:
	CNetworkArray( Vector, m_vecPoints, MAX_SPLINE_POINTS );
	CNetworkVar( int, m_nPoints );
};

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *name - 
//-----------------------------------------------------------------------------
CTEBeamSpline::CTEBeamSpline( const char *name ) :
	CBaseTempEntity( name )
{
	int i;
	for ( i = 0; i < MAX_SPLINE_POINTS; i++ )
	{
		m_vecPoints.GetForModify( i ).Init();
	}
	m_nPoints = 0;
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CTEBeamSpline::~CTEBeamSpline( void )
{
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *current_origin - 
//			*current_angles - 
//-----------------------------------------------------------------------------
void CTEBeamSpline::Test( const Vector& current_origin, const QAngle& current_angles )
{
	// Fill in data
	m_nPoints = 6;
	Vector m_vecStart = current_origin;
	
	Vector forward, right;

	m_vecStart[2] += 24;

	AngleVectors( current_angles, &forward, &right, 0 );
	forward[2] = 0.0;
	VectorNormalize( forward );

	VectorMA( m_vecStart, 100.0, forward, m_vecStart );

	VectorMA( m_vecStart, -128.0, right, m_vecStart );

	for ( int i = 0; i < m_nPoints; i++ )
	{
		m_vecPoints.Set( i, m_vecStart );
		VectorMA( m_vecStart, 128/m_nPoints, right, m_vecStart );
		VectorMA( m_vecStart, 30.0/m_nPoints, forward, m_vecStart );
	}

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
void CTEBeamSpline::Create( IRecipientFilter& filter, float delay )
{
	engine->PlaybackTempEntity( filter, delay, 
		(void *)this, GetServerClass()->m_pTable, GetServerClass()->m_ClassID );
}

IMPLEMENT_SERVERCLASS_ST_NOBASE(CTEBeamSpline, DT_TEBeamSpline)
	SendPropInt( SENDINFO( m_nPoints ), 5, SPROP_UNSIGNED ),
	
	SendPropArray(
		SendPropVector( SENDINFO_ARRAY(m_vecPoints), -1, SPROP_COORD),
		m_vecPoints)
END_SEND_TABLE()


// Singleton to fire TEBeamSpline objects
static CTEBeamSpline g_TEBeamSpline( "BeamSpline" );

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : msg_dest - 
//			delay - 
//			*origin - 
//			*recipient - 
//			points - 
//			*points - 
//-----------------------------------------------------------------------------
void TE_BeamSpline( IRecipientFilter& filter, float delay,
	int points, Vector* rgPoints )
{
	int i;
	g_TEBeamSpline.m_nPoints = points;
	for ( i = 0; i < points; i++ )
	{
		g_TEBeamSpline.m_vecPoints.Set( i, rgPoints[ i ] );
	}
	
	for ( ; i < MAX_SPLINE_POINTS; i++ )
	{
		g_TEBeamSpline.m_vecPoints.GetForModify( i ).Init();
	}

	// Send it over the wire
	g_TEBeamSpline.Create( filter, delay );
}