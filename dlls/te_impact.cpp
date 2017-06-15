//======== (C) Copyright 1999, 2000 Valve, L.L.C. All rights reserved. ========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//
// Purpose: Send generic impact messages to the client for visualization
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

//-----------------------------------------------------------------------------
// Purpose: Dispatches Gunshot decal tempentity
//-----------------------------------------------------------------------------
class CTEImpact : public CBaseTempEntity
{
public:
	DECLARE_CLASS( CTEImpact, CBaseTempEntity );

	DECLARE_SERVERCLASS();

	CTEImpact( const char *name );
	virtual	~CTEImpact();

	void Precache( void );
	void Create( IRecipientFilter& filter, float delay );
	void Test( const Vector& current_origin, const Vector& current_normal );

public:

	CNetworkVector( m_vecOrigin );
	CNetworkVector( m_vecNormal );	//NOTENOTE: In a multi-play setup we'll probably want non-oriented effects for bandwidth
	CNetworkVar( int, m_iType );
};

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *name - 
// Output : 
//-----------------------------------------------------------------------------
CTEImpact::CTEImpact( const char *name ) : CBaseTempEntity( name )
{
	m_vecOrigin.Init();
	m_vecNormal.Init();
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CTEImpact::~CTEImpact( void )
{
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CTEImpact::Precache( void )
{
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *current_origin - 
//			*current_angles - 
//-----------------------------------------------------------------------------
void CTEImpact::Test( const Vector& current_origin, const Vector& current_normal )
{
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : msg_dest - 
//			delay - 
//			*origin - 
//			*recipient - 
//-----------------------------------------------------------------------------
void CTEImpact::Create( IRecipientFilter& filter, float delay )
{
	engine->PlaybackTempEntity( filter, 
								delay, 
								(void *) this, 
								GetServerClass()->m_pTable, 
								GetServerClass()->m_ClassID );
}

//Server class implementation
IMPLEMENT_SERVERCLASS_ST( CTEImpact, DT_TEImpact)
	SendPropVector( SENDINFO( m_vecOrigin ), -1, SPROP_COORD ),
	SendPropVector( SENDINFO( m_vecNormal ), -1, SPROP_COORD ),
	SendPropInt( SENDINFO( m_iType ), 32, SPROP_UNSIGNED ),
END_SEND_TABLE()

// Singleton to fire TEImpact objects
static CTEImpact g_TEImpact( "Impact" );

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : msg_dest - 
//			delay - 
//			*origin - 
//			*recipient - 
//-----------------------------------------------------------------------------
void TE_Impact( IRecipientFilter& filter, float delay )
{
	g_TEImpact.Create( filter, delay );
}