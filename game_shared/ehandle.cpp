//========= Copyright � 1996-2003, Valve LLC, All rights reserved. ============
//
// Purpose: This module implements functions to support ehandles.
//
//=============================================================================

#include "cbase.h"


#if defined( GAME_DLL )
	
	#include "entitylist.h"


	void DebugCheckEHandleAccess( void *pEnt )
	{
		extern bool g_bDisableEhandleAccess;

		if ( g_bDisableEhandleAccess )
		{
			Msg( "Access of EHANDLE/CHandle for class %s:%p in destructor!\n",
				STRING(((CBaseEntity*)pEnt)->m_iClassname ), pEnt );
		}
	}

#else
	
#endif


