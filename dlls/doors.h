//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#ifndef DOORS_H
#define DOORS_H
#pragma once


#include "locksounds.h"
#include "entityoutput.h"


// doors
#define SF_DOOR_ROTATE_Y			0
#define	SF_DOOR_START_OPEN			1
#define SF_DOOR_ROTATE_BACKWARDS	2
#define SF_DOOR_PASSABLE			8
#define SF_DOOR_ONEWAY				16
#define	SF_DOOR_NO_AUTO_RETURN		32
#define SF_DOOR_ROTATE_Z			64
#define SF_DOOR_ROTATE_X			128
#define SF_DOOR_PUSE				256	// door can be opened by player's use button.
#define SF_DOOR_NONPCS				512	// NPC can't open
#define SF_DOOR_PTOUCH				1024 // player touch opens
#define SF_DOOR_LOCKED				2048	// Door is initially locked
#define SF_DOOR_SILENT				4096
// FLAGS ABOVE THIS ARE USED BY SUBCLASSES!


class CBaseDoor : public CBaseToggle
{
public:
	DECLARE_CLASS( CBaseDoor, CBaseToggle );

	DECLARE_SERVERCLASS();

	void Spawn( void );
	void Precache( void );
	bool CreateVPhysics();
	bool KeyValue( const char *szKeyName, const char *szValue );
	virtual void Use( CBaseEntity *pActivator, CBaseEntity *pCaller, USE_TYPE useType, float value );

	virtual void StartBlocked( CBaseEntity *pOther );
	virtual void Blocked( CBaseEntity *pOther );
	virtual void EndBlocked( void );

	void Activate( void );

	virtual int	ObjectCaps( void ) 
	{
		int flags = BaseClass::ObjectCaps();
		if ( HasSpawnFlags( SF_DOOR_PUSE ) )
		{
			if ( HasSpawnFlags( SF_DOOR_PASSABLE ) )
			{
				return flags | FCAP_IMPULSE_USE | FCAP_USE_IN_RADIUS;
			}
			else
			{
				return flags | FCAP_IMPULSE_USE;
			}
		}

		return flags;
	};

	bool	ShouldSavePhysics()	{ return false; }
	
	DECLARE_DATADESC();

	// This is ONLY used by the node graph to test movement through a door
	virtual void SetToggleState( int state );

	virtual bool IsRotatingDoor() { return false; }
	// used to selectivly override defaults
	void DoorTouch( CBaseEntity *pOther );

	// local functions
	int DoorActivate( );
	void DoorGoUp( void );
	void DoorGoDown( void );
	void DoorHitTop( void );
	void DoorHitBottom( void );
	void UpdateAreaPortals( bool isOpen );
	void Unlock( void );
	void Lock( void );
	int GetDoorMovementGroup( CBaseDoor *pDoorList[], int listMax );

	// Input handlers
	void InputClose( inputdata_t &inputdata );
	void InputLock( inputdata_t &inputdata );
	void InputOpen( inputdata_t &inputdata );
	void InputToggle( inputdata_t &inputdata );
	void InputUnlock( inputdata_t &inputdata );

	Vector m_vecMoveDir;		// The direction of motion for linear moving doors.

	locksound_t m_ls;			// door lock sounds
	
	byte	m_bLockedSentence;	
	byte	m_bUnlockedSentence;
	bool	m_bLocked;				// Whether the door is locked
	float	m_flBlockDamage;		// Damage inflicted when blocked.

	string_t	m_NoiseMoving;		//Start/Looping sound
	string_t	m_NoiseArrived;		//End sound

	CNetworkVar( float, m_flWaveHeight );

	// Outputs
	COutputEvent m_OnBlockedClosing;		// Triggered when the door becomes blocked while closing.
	COutputEvent m_OnBlockedOpening;		// Triggered when the door becomes blocked while opening.
	COutputEvent m_OnUnblockedClosing;		// Triggered when the door becomes unblocked while closing.
	COutputEvent m_OnUnblockedOpening;		// Triggered when the door becomes unblocked while opening.
	COutputEvent m_OnFullyClosed;			// Triggered when the door reaches the fully closed position.
	COutputEvent m_OnFullyOpen;				// Triggered when the door reaches the fully open position.
	COutputEvent m_OnClose;					// Triggered when the door is told to close.
	COutputEvent m_OnOpen;					// Triggered when the door is told to open.
};

#endif // DOORS_H