//========= Copyright � 1996-2002, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#include "stdafx.h"
#include "MapHelper.h"


//-----------------------------------------------------------------------------
// Purpose: Returns the appropriate object to the selection code.
// Input  : dwFlags - selectPicky or selectNormal
// Output : Returns a pointer to the object that should be selected, based on
//			the selection mode.
//-----------------------------------------------------------------------------
CMapClass *CMapHelper::PrepareSelection(SelectMode_t eSelectMode)
{
	//
	// If we have a parent that is not the world, select our parent.
	//
	if (Parent && !Parent->IsWorldObject())
	{
		return Parent->PrepareSelection(eSelectMode);
	}

	//
	// We should never have a helper as a child of the world!
	//
	ASSERT(false);
	return NULL;
}

