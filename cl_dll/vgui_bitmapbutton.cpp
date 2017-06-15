//======== (C) Copyright 1999, 2000 Valve, L.L.C. All rights reserved. ========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//
// Purpose: This is a panel which is rendered image on top of an entity
//
// $Revision: $
// $NoKeywords: $
//=============================================================================
#include "cbase.h"
#pragma warning (disable: 4514)

#include "vgui_bitmapimage.h"
#include "vgui_BitmapButton.h"
#include <KeyValues.h>


//-----------------------------------------------------------------------------
// Constructor
//-----------------------------------------------------------------------------
CBitmapButton::CBitmapButton( vgui::Panel *pParent, const char *pName, const char *pText ) : 
	BaseClass( pParent, pName, pText )
{
	SetPaintBackgroundEnabled( false );
	for ( int i = 0; i < BUTTON_STATE_COUNT; ++i )
	{
		m_bImageLoaded[i] = false;
	}
}

CBitmapButton::~CBitmapButton()
{
}


//-----------------------------------------------------------------------------
// initialization
//-----------------------------------------------------------------------------
bool CBitmapButton::Init( KeyValues* pInitData )
{
	// Unimplemented
	Assert( 0 );
	return true;
}


//-----------------------------------------------------------------------------
// initialization from build-mode dialog style .res files
//-----------------------------------------------------------------------------
void CBitmapButton::ApplySettings(KeyValues *pInitData)
{
	BaseClass::ApplySettings(pInitData);

	COMPILE_TIME_ASSERT( BUTTON_STATE_COUNT == 4 );
	const char *pSectionName[BUTTON_STATE_COUNT] = 
	{
		"enabledImage",
		"mouseOverImage",
		"pressedImage",
		"disabledImage"
	};

	for ( int i = 0; i < BUTTON_STATE_COUNT; ++i )
	{
		m_bImageLoaded[i] = InitializeImage(pInitData, pSectionName[i], this, &m_pImage[i] );
	}
}


//-----------------------------------------------------------------------------
// Sets the image
//-----------------------------------------------------------------------------
void CBitmapButton::SetImage( ButtonImageType_t type, const char *pMaterialName, color32 color )
{
	m_bImageLoaded[type] = m_pImage[type].Init( GetVPanel(), pMaterialName );
	if (m_bImageLoaded[type])
	{
		Color vcol( color.r, color.g, color.b, color.a );
		m_pImage[type].SetColor( vcol );
	}
}

bool CBitmapButton::IsImageLoaded( ButtonImageType_t type ) const
{
	return m_bImageLoaded[type];
}


//-----------------------------------------------------------------------------
// Draws the puppy
//-----------------------------------------------------------------------------
void CBitmapButton::Paint( void )
{
	// Determine the image to use based on the state
	int nCurrentImage = BUTTON_ENABLED;
	if (IsArmed())
	{
		if (IsDepressed())
		{
			nCurrentImage = BUTTON_PRESSED;
		}
		else
		{
			nCurrentImage = BUTTON_ENABLED_MOUSE_OVER;
		}
	}
	else if (!IsEnabled())
	{
		nCurrentImage = BUTTON_DISABLED;
	}

	if (m_bImageLoaded[nCurrentImage])
	{
		m_pImage[nCurrentImage].DoPaint( GetVPanel() );
	}

	BaseClass::Paint();
}


