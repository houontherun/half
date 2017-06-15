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
// $NoKeywords: $
//=============================================================================
#include "cbase.h"
#include "itextmessage.h"
#include <vgui_controls/Panel.h>
#include <vgui/IVgui.h>
#include <vgui/ILocalize.h>
#include "VguiMatSurface/IMatSystemSurface.h"
#include <vgui_controls/Controls.h>
#include <vgui/ISurface.h>
#include "hud.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"

// Simultaneous message limit
#define MAX_TEXTMESSAGE_CHARS 2048

//-----------------------------------------------------------------------------
// Purpose: For rendering the Titles.txt characters to the screen from the HUD
//-----------------------------------------------------------------------------
class CTextMessagePanel : public vgui::Panel
{
	typedef vgui::Panel BaseClass;
public:
	enum
	{
		TYPE_UNKNOWN = 0,
		TYPE_POSITION,
		TYPE_CHARACTER,
		TYPE_FONT,
	};

	typedef struct message_s
	{
		int		type;
		struct	message_s *next;

		// Could make a union
		int			x, y;

		int			r, g, b, a;
		char		ch;

		vgui::HFont	font;
	} message_t;

						CTextMessagePanel( vgui::VPANEL parent );
	virtual				~CTextMessagePanel( void );

	virtual void		SetPosition( int x, int y );

	virtual void		AddChar( int r, int g, int b, int a, char ch );
	virtual void		GetTextExtents( int *wide, int *tall, const char *string );

	virtual void		SetFont( vgui::HFont hCustomFont );
	virtual void		SetDefaultFont( void );

	virtual void		OnTick( void );

	virtual void		Paint();

	virtual bool		ShouldDraw( void );

	// Get character data for textmessage text
	virtual int			GetFontInfo( FONTABC *pABCs, vgui::HFont hFont );


private:
	message_t			*AllocMessage( void );
	void				Reset( void );

	vgui::HFont			m_hFont;
	vgui::HFont			m_hDefaultFont;
	message_t			m_Messages[ MAX_TEXTMESSAGE_CHARS ];
	message_t			*m_pActive;
	message_t			*m_pFree;
};

//-----------------------------------------------------------------------------
// Purpose: Constructor
// Input  : *parent - 
//-----------------------------------------------------------------------------
CTextMessagePanel::CTextMessagePanel( vgui::VPANEL parent )
: BaseClass( NULL, "CTextMessagePanel" )
{
	SetParent( parent );
	SetSize( ScreenWidth(), ScreenHeight() );
	SetPos( 0, 0 );
	SetVisible( false );
	SetCursor( null );
	SetKeyBoardInputEnabled( false );
	SetMouseInputEnabled( false );

	m_hFont = g_hFontTrebuchet24;
	m_hDefaultFont = m_hFont;

	SetFgColor( Color( 0, 0, 0, 255 ) );
	SetPaintBackgroundEnabled( false );

	// Clear memory out
	Reset();

	vgui::ivgui()->AddTickSignal( GetVPanel(), 100 );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CTextMessagePanel::~CTextMessagePanel( void )
{
}

//-----------------------------------------------------------------------------
// Purpose: Get font sizes
// Input  : *pWidth - 
// Output : int
//-----------------------------------------------------------------------------
int CTextMessagePanel::GetFontInfo( FONTABC *pABCs, vgui::HFont hFont )
{
	int i;

	if ( !hFont )
	{
		hFont = m_hFont;
	}

	if ( !hFont )
		return 0;

	if ( pABCs )
	{
		for ( i =0; i < 256; i++ )
		{
			int a, b, c;
			vgui::surface()->GetCharABCwide( hFont, (char)i, a, b, c );
			pABCs[i].abcA = a;
			pABCs[i].abcB = b;
			pABCs[i].abcC = c;
			pABCs[i].total = a+b+c;
		}
	}

	return vgui::surface()->GetFontTall( hFont );
}

//-----------------------------------------------------------------------------
// Purpose: Clear all messages out of active list, etc.
//-----------------------------------------------------------------------------
void CTextMessagePanel::Reset( void )
{
	m_pActive = NULL;
	int i;
	for( i = 0; i < MAX_TEXTMESSAGE_CHARS-1; i++ )
	{
		m_Messages[ i ].next = &m_Messages[ i + 1 ];
	}
	m_Messages[ i ].next = NULL;
	m_pFree = &m_Messages[ 0 ];
	SetVisible( false );
}

//-----------------------------------------------------------------------------
// Purpose: Grab next free message, if any
// Output : CTextMessagePanel::message_t
//-----------------------------------------------------------------------------
CTextMessagePanel::message_t *CTextMessagePanel::AllocMessage( void )
{
	CTextMessagePanel::message_t *msg;

	if ( !m_pFree )
		return NULL;

	msg = m_pFree;
	m_pFree = m_pFree->next;

	msg->next = m_pActive;
	m_pActive = msg;

	msg->type = TYPE_UNKNOWN;
	msg->x = 0;
	msg->y = 0;
	msg->ch = 0;
	msg->r = 0;
	msg->g = 0;
	msg->b = 0;
	msg->a = 0;
	SetVisible( true );
	return msg;
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : x - 
//			y - 
//-----------------------------------------------------------------------------
void CTextMessagePanel::SetPosition( int x, int y )
{
	CTextMessagePanel::message_t *msg = AllocMessage();
	if ( !msg )
		return;

	msg->type = TYPE_POSITION;

	// Used fields
	msg->x = x;
	msg->y = y;
}

//-----------------------------------------------------------------------------
// Purpose: Adds a character to the active list, if possible
// Input  : x - 
//			y - 
//			r - 
//			g - 
//			b - 
//			a - 
//			ch - 
// Output : int
//-----------------------------------------------------------------------------
void CTextMessagePanel::AddChar( int r, int g, int b, int a, char ch )
{
	CTextMessagePanel::message_t *msg = AllocMessage();
	if ( !msg )
		return;

	msg->type = TYPE_CHARACTER;

	// Used fields
	msg->r = r;
	msg->g = g;
	msg->b = b;
	msg->a = a;
	msg->ch = ch;
}

//-----------------------------------------------------------------------------
// Purpose: Determine width and height of specified string
// Input  : *wide - 
//			*tall - 
//			*string - 
//-----------------------------------------------------------------------------
void CTextMessagePanel::GetTextExtents( int *wide, int *tall, const char *string )
{
	*wide = g_pMatSystemSurface->DrawTextLen( m_hFont, (char *)string );
	*tall = vgui::surface()->GetFontTall( m_hFont );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CTextMessagePanel::SetFont( vgui::HFont hCustomFont )
{
	m_hFont = hCustomFont;

	CTextMessagePanel::message_t *msg = AllocMessage();
	if ( !msg )
		return;

	msg->type = TYPE_FONT;

	// Used fields
	msg->font = m_hFont;
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CTextMessagePanel::SetDefaultFont( void )
{
	SetFont( m_hDefaultFont );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CTextMessagePanel::OnTick( void )
{
	SetVisible( ShouldDraw() );
}

//-----------------------------------------------------------------------------
// Purpose: 
// Output : Returns true on success, false on failure.
//-----------------------------------------------------------------------------
bool CTextMessagePanel::ShouldDraw( void )
{
	if ( !m_pActive )
		return false;

	return true;
}

//-----------------------------------------------------------------------------
// Purpose: Draw current text items
//-----------------------------------------------------------------------------
void CTextMessagePanel::Paint() 
{
	CTextMessagePanel::message_t *msg = m_pActive;
	
	// Reverse
	CTextMessagePanel::message_t *newlist = NULL, *next;
	while ( msg )
	{
		next = msg->next;
		msg->next = newlist;
		newlist = msg;
		msg = next;
	}

	m_pActive = newlist;
	msg = newlist;
	int xpos = 0, ypos = 0;

	vgui::surface()->DrawSetTextFont( m_hFont );

	while ( msg )
	{
		switch ( msg->type )
		{
		default:
		case TYPE_UNKNOWN:
			Assert( 0 );
			break;
		case TYPE_POSITION:
			xpos = msg->x;
			ypos = msg->y;
			break;
		case TYPE_FONT:
			m_hFont = msg->font;
			vgui::surface()->DrawSetTextFont( m_hFont );
			break;
		case TYPE_CHARACTER:
			if ( m_hFont )
			{
				int a, b, c;
				vgui::surface()->GetCharABCwide( m_hFont, msg->ch, a, b, c );

				if ( msg->ch > 32 )
				{
					vgui::surface()->DrawSetTextColor( msg->r,  msg->g,  msg->b,  msg->a );
					vgui::surface()->DrawSetTextPos( xpos, ypos );
					
					//
					wchar_t theChar[2];
					// ConvertANSIToUnicode() is for strings not individual chars, so pass it a wchar array
					vgui::localize()->ConvertANSIToUnicode( &msg->ch, theChar, sizeof( theChar ) );
					vgui::surface()->DrawPrintText( theChar, 1 );
				}
				xpos += a + b + c;
			}
			break;
		}
		msg = msg->next;
	}

	Reset();
}

class CTextMessage : public ITextMessage 
{
private:
	CTextMessagePanel *textMessagePanel;
public:
	CTextMessage( void )
	{
		textMessagePanel = NULL;
	}

	void Create( vgui::VPANEL parent )
	{
		textMessagePanel = new CTextMessagePanel( parent );
	}

	void Destroy( void )
	{
		if ( textMessagePanel )
		{
			textMessagePanel->SetParent( (vgui::Panel *)NULL );
			delete textMessagePanel;
		}
	}

	void SetPosition( int x, int y )
	{
		if ( !textMessagePanel )
			return;

		textMessagePanel->SetPosition( x, y );
	}

	void AddChar( int r, int g, int b, int a, char ch )
	{
		if ( !textMessagePanel )
			return;

		textMessagePanel->AddChar( r, g, b, a, ch );
	}

	void GetLength( int *wide, int *tall, const char *string )
	{
		if ( !textMessagePanel )
		{
			*wide = *tall = 0;
			return;
		}

		textMessagePanel->GetTextExtents( wide, tall, string );
	}

	int GetFontInfo( FONTABC *pABCs, vgui::HFont hFont )
	{
		return textMessagePanel ? textMessagePanel->GetFontInfo( pABCs, hFont ) : 0;
	}

	void SetFont( vgui::HFont hCustomFont )
	{
		if ( !textMessagePanel )
			return;

		textMessagePanel->SetFont( hCustomFont );
	}

	void SetDefaultFont( void )
	{
		if ( !textMessagePanel )
			return;

		textMessagePanel->SetDefaultFont();
	}
};

static CTextMessage g_TextMessage;
ITextMessage *textmessage = &g_TextMessage;
