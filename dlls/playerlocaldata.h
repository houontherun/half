//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#ifndef PLAYERLOCALDATA_H
#define PLAYERLOCALDATA_H
#ifdef _WIN32
#pragma once
#endif


#include "playernet_vars.h"
#include "networkvar.h"

//-----------------------------------------------------------------------------
// Purpose: Player specific data ( sent only to local player, too )
//-----------------------------------------------------------------------------
class CPlayerLocalData
{
public:
	// Save/restore
	DECLARE_SIMPLE_DATADESC();
	// Prediction data copying
	DECLARE_PREDICTABLE();
	DECLARE_CLASS_NOBASE( CPlayerLocalData );
	DECLARE_EMBEDDED_NETWORKVAR();

	CPlayerLocalData();

	CNetworkArray( unsigned char, m_chAreaBits, 32 );

	CNetworkVar( int, m_iHideHUD );					// bitfields containing sections of the HUD to hide
	CNetworkVar( int, m_iFOV );						// field of view
	CNetworkVar( float, m_flFOVRate );				// rate at which the FOV changes (defaults to 0)
	Vector					m_vecOverViewpoint;			// Viewpoint overriding the real player's viewpoint
	
	// Fully ducked
	CNetworkVar( bool, m_bDucked );
	// In process of ducking
	CNetworkVar( bool, m_bDucking );
	// During ducking process, amount of time before full duc
	CNetworkVar( float, m_flDucktime );
	// Step sound side flip/flip
	int m_nStepside;;
	// Velocity at time when we hit ground
	CNetworkVar( float, m_flFallVelocity );
	// Previous button state
	CNetworkVar( int, m_nOldButtons );
	// Base velocity that was passed in to server physics so 
	//  client can predict conveyors correctly.  Server zeroes it, so we need to store here, too.
	CNetworkVector( m_vecClientBaseVelocity );  
	// auto-decaying view angle adjustment
	CNetworkQAngle( m_vecPunchAngle );		
	CNetworkQAngle( m_vecPunchAngleVel );
	// Draw view model for the player
	CNetworkVar( bool, m_bDrawViewmodel );

	// Is the player wearing the HEV suit
	CNetworkVar( bool, m_bWearingSuit );
	CNetworkVar( float, m_flStepSize );
	CNetworkVar( bool, m_bAllowAutoMovement );

	// 3d skybox
	CNetworkVarEmbedded( sky3dparams_t, m_skybox3d );
	// wold fog
	CNetworkVarEmbedded( fogparams_t, m_fog );
	// audio environment
	CNetworkVarEmbedded( audioparams_t, m_audio );
};

EXTERN_SEND_TABLE(DT_Local);

void* SendProxy_SendLocalDataTable( const void *pStruct, const void *pVarData, CSendProxyRecipients *pRecipients, int objectID );

#endif // PLAYERLOCALDATA_H
