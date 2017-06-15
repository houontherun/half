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
#if !defined( INETGRAPHPANEL_H )
#define INETGRAPHPANEL_H
#ifdef _WIN32
#pragma once
#endif

#include <vgui/VGUI.h>

namespace vgui
{
	class Panel;
}

class INetGraphPanel
{
public:
	virtual void			Create( vgui::VPANEL parent ) = 0;
	virtual void			Destroy( void ) = 0;
};

extern INetGraphPanel *netgraphpanel;
extern INetGraphPanel *vprofgraphpanel;
#endif // INETGRAPHPANEL_H