//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: Holds information relevant to saving the document, such as the
//			rules for which objects to save.
//
// $NoKeywords: $
//=============================================================================

#include "MapClass.h"
#include "SaveInfo.h"


//-----------------------------------------------------------------------------
// Purpose: Returns true if the object should be saved, false if not. Normal
//			serialization always returns true. Exporting VMF files with the
//			"Visible objects only" option enabled will not save hidden objects.
// Input  : pObject - Object to check.
//-----------------------------------------------------------------------------
bool CSaveInfo::ShouldSaveObject(CMapClass *pObject)
{
	//
	// Currently the only thing that enables visible objects only serialization
	// is the Export dialog. Normal VMF saves just save everything.
	//
	if (m_bVisiblesOnly && !pObject->IsVisible())
	{
		return(false);
	}

	return(true);
}

