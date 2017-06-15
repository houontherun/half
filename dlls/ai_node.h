//=========== (C) Copyright 1999 Valve, L.L.C. All rights reserved. ===========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//
// Purpose:		Base combat character with no AI
//
// $Workfile:     $
// $Date:         $
//
//-----------------------------------------------------------------------------
// $Log: $
//
// $NoKeywords: $
//=============================================================================

#ifndef AI_NODE_H
#define AI_NODE_H
#pragma once

#include "ai_hull.h"
#include "bitstring.h"
#include "utlvector.h"

enum AI_ZoneIds_t
{
	AI_NODE_ZONE_UNKNOWN	= 0,
	AI_NODE_ZONE_SOLO 	 	= 1,
	AI_NODE_ZONE_UNIVERSAL	= 3,
	AI_NODE_FIRST_ZONE		= 4,
};

class	CAI_Network;
class	CAI_Link;
class	CAI_Hint;
class	CAI_BaseNPC;

#define NOT_CACHED			-2			// Returned if data not in cache
#define	NO_NODE				-1			// Returned when no node meets the qualification

#define	MAX_NODE_LINK_DIST			60*12		// Maximum connection length between nodes as well as furthest
#define	MAX_NODE_LINK_DIST_SQ		(MAX_NODE_LINK_DIST*MAX_NODE_LINK_DIST)	//   distance allowed to travel to node via local moves

#define	MAX_AIR_NODE_LINK_DIST		120*12	// Maximum connection length between air nodes as well as furthest
#define	MAX_AIR_NODE_LINK_DIST_SQ   (MAX_AIR_NODE_LINK_DIST*MAX_AIR_NODE_LINK_DIST)	//   distance allowed to travel to node via local moves


	
#define	NODE_HEIGHT			8	// how high to lift nodes off the ground after we drop them all (make stair/ramp mapping easier)
#define NODE_CLIMB_OFFSET	8

#define	HULL_TEST_STEP_SIZE 16  // how far the test hull moves on each step

//=========================================================
//	The type of node
//=========================================================
enum NodeType_e
{
	NODE_ANY,			// Used to specify any type of node (for search)
	NODE_DELETED,		// Used in wc_edit mode to remove nodes during runtime     
	NODE_GROUND,     
	NODE_AIR,       
	NODE_CLIMB,  
	NODE_WATER     
};

enum NodeInfoBits_e
{
	bits_NODE_CLIMB_BOTTOM		=	0x00000001,	// Node at bottom of ladder
	bits_NODE_CLIMB_ON			=	0x00000002,	// Node on ladder somewhere
	bits_NODE_CLIMB_OFF_FORWARD =	0x00000004,	// Dismount climb by going forward
	bits_NODE_CLIMB_OFF_LEFT	=	0x00000008,	// Dismount climb by going left
	bits_NODE_CLIMB_OFF_RIGHT	=	0x00000010,	// Dismount climb by going right4

	bits_NODE_CLIB_EXIT			=	bits_NODE_CLIMB_OFF_FORWARD| bits_NODE_CLIMB_OFF_LEFT | bits_NODE_CLIMB_OFF_RIGHT,

	bits_NODE_WC_NEED_REBUILD	=	0x10000000,	// Used to more nodes in WC edit mode
	bits_NODE_WC_CHANGED		=	0x20000000,	// Node changed during WC edit

	bits_NODE_WONT_FIT_HULL		=	0x40000000,	// Used only for debug display
};


//=============================================================================
//	>> CAI_Node
//=============================================================================

class CAI_Node
{
public:

	CAI_Node( int id, const Vector &origin, float yaw );
	
	CAI_Hint*		GetHint()					{ return m_pHint; }
	void			SetHint( CAI_Hint *pHint )	{ m_pHint = pHint; }

	int				NumLinks() const		{ return m_iNumLinks; }
	void			ClearLinks()			{ m_Links.RemoveAll(); m_iNumLinks = 0; }
	CAI_Link *		GetLink( int destNodeId );
	CAI_Link *		GetLinkByIndex( int i )	{ return m_Links[i]; }

	bool 			IsLocked() const			{ return ( m_flNextUseTime > gpGlobals->curtime ); }
	void			Lock( float duration )		{ m_flNextUseTime = gpGlobals->curtime + duration; }
	void			Unlock()					{ m_flNextUseTime = gpGlobals->curtime; }

	int 			GetZone() const			{ return m_zone; }
	void 			SetZone( int zone )		{ m_zone = zone; }
	
	Vector			GetPosition(int hull);		// Hull specific position for a node
	CAI_Link*		HasLink(int nNodeID);				// Return link to nNodeID or NULL

	void			ShuffleLinks();						// Called before GetShuffeledLinks to reorder 
	CAI_Link*		GetShuffeledLink(int nNum);			// Used to get links in different order each time

	int 			GetId() const			{ return m_iID; }
	
	const Vector &	GetOrigin() const		{ return m_vOrigin; }
	float			GetYaw() const			{ return m_flYaw;	}

	NodeType_e		SetType( NodeType_e type ) { return ( m_eNodeType = type ); }
	NodeType_e		GetType() const			{ return m_eNodeType; }

	void			SetNeedsRebuild()		{ m_eNodeInfo |= bits_NODE_WC_NEED_REBUILD; }
	void			ClearNeedsRebuild()		{ m_eNodeInfo &= ~bits_NODE_WC_NEED_REBUILD; }
	bool			NeedsRebuild() const	{ return ( ( m_eNodeInfo & bits_NODE_WC_NEED_REBUILD ) != 0 ); }

	void			AddLink(CAI_Link *newLink);
public:
	int				m_iID;					// ID for this node

	Vector			m_vOrigin;				// location of this node in space
	float			m_flVOffset[NUM_HULLS];			// vertical offset for each hull type, assuming ground node, 0 otherwise
	float			m_flYaw;				// NPC on this node should face this yaw to face the hint, or climb a ladder

	NodeType_e		m_eNodeType;			// The type of node

	int				m_eNodeInfo;			// bits that tell us more about this nodes
public:

	int				m_iNumLinks;			// number of links to this node
	CUtlVector<CAI_Link *> m_Links;		// growable array of links to this node

	int				m_zone;

public:
	
	float			m_flNextUseTime;		// When can I be used again?
	CAI_Hint*		m_pHint;				// hint attached to this node
	int				m_iFirstShuffledLink;				// first link to check

public:
};


extern float	GetFloorZ(const Vector &origin);
extern float	GetFloorDistance(const Vector &origin);

#endif // AI_NODE_H
