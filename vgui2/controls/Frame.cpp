//========= Copyright � 1996-2003, Valve LLC, All rights reserved. ============
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#include <assert.h>
#include <math.h> // for ceil()
#define PROTECTED_THINGS_DISABLE

#include <vgui/Cursor.h>
#include <vgui/MouseCode.h>
#include <KeyValues.h>
#include <vgui/IBorder.h>
#include <vgui/IInput.h>
#include <vgui/ILocalize.h>
#include <vgui/IPanel.h>
#include <vgui/ISurface.h>
#include <vgui/IScheme.h>
#include <vgui/KeyCode.h>

#include <vgui_controls/Controls.h>
#include <vgui_controls/Frame.h>
#include <vgui_controls/Button.h>
#include <vgui_controls/Menu.h>
#include <vgui_controls/MenuButton.h>
#include <vgui_controls/TextImage.h>

// memdbgon must be the last include file in a .cpp file!!!
#include <tier0/memdbgon.h>

using namespace vgui;

static const int SNAP_RANGE = 10; // number of pixels distance before the frame will snap to an edge
static const int CAPTION_TITLE_BORDER = 7;

namespace
{
	//-----------------------------------------------------------------------------
	// Purpose: Invisible panel to handle dragging/resizing frames
	//-----------------------------------------------------------------------------
	class GripPanel : public Panel
	{
	public:
		GripPanel(Frame *dragFrame, const char *name, int xdir, int ydir) : Panel(dragFrame, name)
		{
			_frame = dragFrame;
			_dragging = false;
			_dragMultX = xdir;
			_dragMultY = ydir;
			SetPaintEnabled(false);
			SetPaintBackgroundEnabled(false);
			SetPaintBorderEnabled(false);

			if (xdir == 1 && ydir == 1)
			{
				// bottom-right grip gets an image
				SetPaintEnabled(true);
				SetPaintBackgroundEnabled(true);
			}
		}
		
		// Purpose- handle window resizing
		// Input- dx, dy, the offet of the mouse pointer from where we started dragging
		virtual void moved(int dx, int dy)
		{
			if (!_frame->IsSizeable())
				return;
			
			// Start off with x, y at the coords of where we started to drag
			int newX = _dragOrgPos[0], newY =_dragOrgPos[1];
			// Start off with width and tall equal from window when we started to drag
			int newWide = _dragOrgSize[0], newTall = _dragOrgSize[1];
			
			// get window's minimum size
			int minWide, minTall;
			_frame->GetMinimumSize( minWide, minTall);
			
			// Handle  width resizing
			newWide += (dx * _dragMultX);
			// Handle the position of the corner x position
			if (_dragMultX == -1)
			{
				// only move if we are not at the minimum
				// if we are at min we have to force the proper offset (dx)
				if (newWide < minWide)
				{
					dx=_dragOrgSize[0]-minWide;
				}
				newX += dx;	  // move window to its new position
			}
			
			// Handle height resizing
			newTall += (dy * _dragMultY);
			// Handle position of corner y position
			if (_dragMultY == -1)
			{
				if (newTall < minTall)
				{
					dy=_dragOrgSize[1]-minTall;
				}
				newY += dy;
			}
			
			// set new position
			_frame->SetPos(newX, newY);
			// set the new size			
			// if window is below min size it will automatically pop to min size
			_frame->SetSize(newWide, newTall);
			_frame->InvalidateLayout();
			_frame->Repaint();
		}
		
		void OnCursorMoved(int x, int y)
		{
			if (!_dragging)
				return;

			if (!input()->IsMouseDown(MOUSE_LEFT))
			{
				// for some reason we're marked as dragging when the mouse is released
				// trigger a release
				OnMouseReleased(MOUSE_LEFT);
				return;
			}

			input()->GetCursorPos(x, y);
			moved((x - _dragStart[0]), ( y - _dragStart[1]));
			_frame->Repaint();
		}
		
		void OnMousePressed(MouseCode code)
		{
			if (code == MOUSE_LEFT)
			{ 
				_dragging=true;
				int x,y;
				input()->GetCursorPos(x,y);
				_dragStart[0]=x;
				_dragStart[1]=y;
				_frame->GetPos(_dragOrgPos[0],_dragOrgPos[1]);
				_frame->GetSize(_dragOrgSize[0],_dragOrgSize[1]);
				input()->SetMouseCapture(GetVPanel());
				
				// if a child doesn't have focus, get it for ourselves
				VPANEL focus = input()->GetFocus();
				if (!focus || !ipanel()->HasParent(focus, _frame->GetVPanel()))
				{
					_frame->RequestFocus();
				}
				_frame->Repaint();
			}
		}

		void Paint()
		{
			// draw the grab handle in the bottom right of the frame
			surface()->DrawSetTextFont(_marlettFont);
			surface()->DrawSetTextPos(0, 0);
			
			// thin highlight lines
			surface()->DrawSetTextColor(GetFgColor());
			surface()->DrawUnicodeChar('p'); 
		}

		void PaintBackground()
		{
			// draw the grab handle in the bottom right of the frame
			surface()->DrawSetTextFont(_marlettFont);
			surface()->DrawSetTextPos(0, 0);
			
			// thick shadow lines
			surface()->DrawSetTextColor(GetBgColor());
			surface()->DrawUnicodeChar('o'); 
		}
		
		void OnMouseReleased(MouseCode code)
		{
			_dragging = false;
			input()->SetMouseCapture(NULL);
		}

		void ApplySchemeSettings(IScheme *pScheme)
		{
			Panel::ApplySchemeSettings(pScheme);
			_marlettFont = pScheme->GetFont("Marlett", IsProportional());
			SetFgColor(GetSchemeColor("BorderBright", pScheme));
			SetBgColor(GetSchemeColor("BorderSelection", pScheme));
		}
		
	protected:
		Frame *_frame;
		int  _dragMultX;
		int  _dragMultY;
		bool _dragging;
		int  _dragOrgPos[2];
		int  _dragOrgSize[2];
		int  _dragStart[2];
		HFont _marlettFont;
	};
	
	//-----------------------------------------------------------------------------
	// Purpose: Handles caption grip input for moving dialogs around
	//-----------------------------------------------------------------------------
	class CaptionGripPanel : public GripPanel
	{
	public:
		CaptionGripPanel(Frame* frame, const char *name) : GripPanel(frame, name, 0, 0)
		{
		}
		
		void moved(int dx, int dy)
		{
			if (!_frame->IsMoveable())
				return;
			
			int newX = _dragOrgPos[0] + dx;
			int newY = _dragOrgPos[1] + dy;

			// first check docking to desktop
			int wx, wy, ww, wt;
			surface()->GetWorkspaceBounds(wx, wy, ww, wt);
			getInsideSnapPosition(wx, wy, ww, wt, newX, newY);

			// now lets check all windows and see if we snap to those
			// root panel
			VPANEL root = surface()->GetEmbeddedPanel();
			// cycle through panels
			// look for panels that are visible and are popups that we can dock to
			for (int i = 0; i < ipanel()->GetChildCount(root); ++i)
			{
				VPANEL child = ipanel()->GetChild(root, i);
				tryToDock (child, newX, newY);
			}

			_frame->SetPos(newX, newY);

		}
		
		void tryToDock(VPANEL window, int &newX, int & newY)
		{
			// bail if child is this window	
			if ( window == _frame->GetVPanel())
				return;
			
			int cx, cy, cw, ct;
			if ( (ipanel()->IsVisible(window)) && (ipanel()->IsPopup(window)) )
			{
				// position
				ipanel()->GetAbsPos(window, cx, cy);
				// dimensions
				ipanel()->GetSize(window, cw, ct);
				bool snapped = getOutsideSnapPosition (cx, cy, cw, ct, newX, newY);
				if (snapped)
				{ 
					// if we snapped, we're done with this path
					// dont try to snap to kids
					return;
				}
			}

			// check all children
			for (int i = 0; i < ipanel()->GetChildCount(window); ++i)
			{
				VPANEL child = ipanel()->GetChild(window, i);
				tryToDock(child, newX, newY);
			}

		}

		// Purpose: To calculate the windows new x,y position if it snaps
		//          Will snap to the INSIDE of a window (eg desktop sides
		// Input: boundX boundY, position of candidate window we are seeing if we snap to
		//        boundWide, boundTall, width and height of window we are seeing if we snap to
		// Output: snapToX, snapToY new coords for window, unchanged if we dont snap
		// Returns true if we snapped, false if we did not snap.
		bool getInsideSnapPosition(int boundX, int boundY, int boundWide, int boundTall,
			int &snapToX, int &snapToY)
		{
			
			int wide, tall;
			_frame->GetSize(wide, tall);
			Assert (wide > 0);
			Assert (tall > 0);
			
			bool snapped=false;
			if (abs(snapToX - boundX) < SNAP_RANGE)
			{
				snapToX = boundX;
				snapped=true;
			}
			else if (abs((snapToX + wide) - (boundX + boundWide)) < SNAP_RANGE)
			{
				snapToX = boundX + boundWide - wide;
				snapped=true;
			}

			if (abs(snapToY - boundY) < SNAP_RANGE)
			{
				snapToY = boundY;
				snapped=true;
			}
			else if (abs((snapToY + tall) - (boundY + boundTall)) < SNAP_RANGE)
			{
				snapToY = boundY + boundTall - tall;
				snapped=true;
			}
			return snapped;
			
		}

		// Purpose: To calculate the windows new x,y position if it snaps
		//          Will snap to the OUTSIDE edges of a window (i.e. will stick peers together
		// Input: left, top, position of candidate window we are seeing if we snap to
		//        boundWide, boundTall, width and height of window we are seeing if we snap to
		// Output: snapToX, snapToY new coords for window, unchanged if we dont snap
		// Returns true if we snapped, false if we did not snap.
		bool getOutsideSnapPosition(int left, int top, int boundWide, int boundTall,
			int &snapToX, int &snapToY)
		{
			Assert (boundWide >= 0);
			Assert (boundTall >= 0);
						
			bool snapped=false;
			
			int right=left+boundWide;
			int bottom=top+boundTall;

			int wide, tall;
			_frame->GetSize(wide, tall);
			Assert (wide > 0);
			Assert (tall > 0);

			// we now see if we are going to be able to snap to a window side, and not
			// just snap to the "open air"
			// want to make it so that if any part of the window can dock to the candidate, it will

			// is this window horizontally snappable to the candidate
			bool horizSnappable=( 
				//  top of window is in range
				((snapToY > top) && (snapToY < bottom)) 
				// bottom of window is in range
				|| ((snapToY+tall > top) && (snapToY+tall < bottom)) 
				// window is just plain bigger than the window we wanna dock to
				|| ((snapToY < top) && (snapToY+tall > bottom)) ); 
			
			
			// is this window vertically snappable to the candidate
			bool vertSnappable=	( 
				 //  left of window is in range
				((snapToX > left) && (snapToX < right))
				//  right of window is in range
				|| ((snapToX+wide > left) && (snapToX+wide < right)) 
				// window is just plain bigger than the window we wanna dock to
				|| ((snapToX < left) && (snapToX+wide > right)) ); 
			
			// if neither, might as well bail
			if ( !(horizSnappable || vertSnappable) )
				return false;

			//if we're within the snap threshold then snap
			if ( (snapToX <= (right+SNAP_RANGE)) && 
				(snapToX >= (right-SNAP_RANGE)) ) 
			{  
				if (horizSnappable)
				{
					//disallow "open air" snaps
					snapped=true;
					snapToX = right;  
				}
			}
			else if ((snapToX + wide) >= (left-SNAP_RANGE) &&
				(snapToX + wide) <= (left+SNAP_RANGE)) 
			{
				if (horizSnappable)
				{
					snapped=true;
					snapToX = left-wide;
				}
			}
			
			if ( (snapToY <= (bottom+SNAP_RANGE)) &&
				(snapToY >= (bottom-SNAP_RANGE)) ) 
			{
				if (vertSnappable)
				{
					snapped=true;
					snapToY = bottom;
				}
			}
			else if ((snapToY + tall) <= (top+SNAP_RANGE) &&
				(snapToY + tall) >= (top-SNAP_RANGE)) 
			{
				if (vertSnappable)
				{
					snapped=true;
					snapToY = top-tall;
				}
			}
			return snapped;
		}
	};
	
}

namespace vgui
{
	//-----------------------------------------------------------------------------
	// Purpose: overrides normal button drawing to use different colors & borders
	//-----------------------------------------------------------------------------
	class FrameButton : public Button
	{
	private:
		IBorder *_brightBorder, *_depressedBorder, *_disabledBorder;
		Color _enabledFgColor, _enabledBgColor;
		Color _disabledFgColor, _disabledBgColor;
		bool _disabledLook;
	
	public:
	
		enum { BUTTON_SIDE = 18 }; 
		
		
		FrameButton(Panel *parent, const char *name, const char *text) : Button(parent, name, text)
		{
			SetSize( BUTTON_SIDE, BUTTON_SIDE );
			_brightBorder = NULL;
			_depressedBorder = NULL;
			_disabledBorder = NULL;
			_disabledLook = true;
			SetContentAlignment(Label::a_northwest);
			SetTextInset(2, 1);
		}
		
		virtual void ApplySchemeSettings(IScheme *pScheme)
		{
			Button::ApplySchemeSettings(pScheme);
			
			_enabledBgColor = GetSchemeColor("TitleButtonBgColor", pScheme);
			_enabledFgColor = GetSchemeColor("TitleButtonFgColor", pScheme);
			_disabledBgColor = GetSchemeColor("TitleButtonDisabledBgColor", pScheme);
			_disabledFgColor = GetSchemeColor("TitleButtonDisabledFgColor", pScheme);
			
			_brightBorder = pScheme->GetBorder("TitleButtonBorder");
			_depressedBorder = pScheme->GetBorder("TitleButtonDepressedBorder");
			_disabledBorder = pScheme->GetBorder("TitleButtonDisabledBorder");
			
			SetDisabledLook(_disabledLook);
		}
		
		virtual IBorder *GetBorder(bool depressed, bool armed, bool selected, bool keyfocus)
		{
			if (_disabledLook)
			{
				return _disabledBorder;
			}
			
			if (depressed)
			{
				return _depressedBorder;
			}
			
			return _brightBorder;
		}
		
		virtual void SetDisabledLook(bool state)
		{
			_disabledLook = state;
			if (!_disabledLook)
			{
				SetDefaultColor(_enabledFgColor, _enabledBgColor);
				SetArmedColor(_enabledFgColor, _enabledBgColor);
				SetDepressedColor(_enabledFgColor, _enabledBgColor);
			}
			else
			{
				// setup disabled colors
				SetDefaultColor(_disabledFgColor, _disabledBgColor);
				SetArmedColor(_disabledFgColor, _disabledBgColor);
				SetDepressedColor(_disabledFgColor, _disabledBgColor);
			}
		}

        virtual void PerformLayout()
        {
            Button::PerformLayout();
            Repaint();
        }
		
		// Don't request focus.
		// This will keep items in the listpanel selected.
		virtual void OnMousePressed(MouseCode code)
		{
			if (!IsEnabled())
				return;
			
			if (!IsMouseClickEnabled(code))
				return;
			
			if (IsUseCaptureMouseEnabled())
			{
				{
					SetSelected(true);
					Repaint();
				}
				
				// lock mouse input to going to this button
				input()->SetMouseCapture(GetVPanel());
			}
		}
};


//-----------------------------------------------------------------------------
// Purpose: icon button
//-----------------------------------------------------------------------------
class FrameSystemButton : public MenuButton
{
private:
	IImage *_enabled, *_disabled;
	Color _enCol, _disCol;
	typedef MenuButton BaseClass;
	bool _respond;
	
public:
	FrameSystemButton(Panel *parent, const char *panelName) : MenuButton(parent, panelName, "")
	{
		_disabled = _enabled = NULL;
		_respond = true;
		SetEnabled(false);
		// This menu will open if we use the left or right mouse button
		SetMouseClickEnabled( MOUSE_RIGHT, true );
	}
	
	virtual void ApplySchemeSettings(IScheme *pScheme)
	{
		BaseClass::ApplySchemeSettings(pScheme);

		_enCol = GetSchemeColor("TitleBarBgColor", pScheme);
		_disCol = GetSchemeColor("TitleBarDisabledBgColor", pScheme);
		
		_enabled = scheme()->GetImage(pScheme->GetResourceString("TitleBarIcon"), false);
		_disabled = scheme()->GetImage(pScheme->GetResourceString( "TitleBarDisabledIcon"), false);

		SetTextInset(0, 0);
	
		// get our iconic image
		SetEnabled(IsEnabled());
	}
	
	virtual IBorder *GetBorder(bool depressed, bool armed, bool selected, bool keyfocus)
	{
		return NULL;
	}

	virtual void SetEnabled(bool state)
	{
		Button::SetEnabled(state);
		
		if (IsEnabled())
		{
			if ( _enabled )
			{
				SetImageAtIndex(0, _enabled, 0);
			}
			SetBgColor(_enCol);
			SetDefaultColor(_enCol, _enCol);
			SetArmedColor(_enCol, _enCol);
			SetDepressedColor(_enCol, _enCol);
		}
		else
		{
			if ( _disabled )
			{
				SetImageAtIndex(0, _disabled, 0);
			}
			SetBgColor(_disCol);
			SetDefaultColor(_disCol, _disCol);
			SetArmedColor(_disCol, _disCol);
			SetDepressedColor(_disCol, _disCol);
		}
	}
	
	void SetResponsive(bool state)
	{
		_respond = state;
	}

	virtual void OnMousePressed(MouseCode code)
	{
		// button may look enabled but not be responsive
		if (!_respond)
			return;

		BaseClass::OnMousePressed(code);
	}

	virtual void OnMouseDoublePressed(MouseCode code)
	{
		// button may look enabled but not be responsive
		if (!_respond)
			return;

		// only close if left is double pressed 
		if (code == MOUSE_LEFT)
		{
			// double click on the icon closes the window
			PostMessage(GetParent(), new KeyValues("Close"));
		}
	}

};

} // namespace vgui
//-----------------------------------------------------------------------------
// Purpose: Constructor
//-----------------------------------------------------------------------------
Frame::Frame(Panel *parent, const char *panelName, bool showTaskbarIcon) : EditablePanel(parent, panelName)
{
	// frames start invisible, to avoid having window flicker in on taskbar
	SetVisible(false);
	MakePopup(showTaskbarIcon);

	_title=null;
	_moveable=true;
	_sizeable=true;
	_hasFocus=false;
	_flashWindow=false;
	_drawTitleBar = true; 
	
	SetTitle("#Frame_Untitled", parent ? false : true);
	
	// add ourselves to the build group
	SetBuildGroup(GetBuildGroup());
	
	SetMinimumSize(128,66);
	
	_sysMenu = NULL;

	GetFocusNavGroup().SetFocusTopLevel(true);
	
	// add dragging grips
	_topGrip = new GripPanel(this, NULL, 0, -1);
	_bottomGrip = new GripPanel(this, NULL, 0, 1);
	_leftGrip = new GripPanel(this, NULL, -1, 0);
	_rightGrip = new GripPanel(this, NULL, 1, 0);
	_topLeftGrip = new GripPanel(this, NULL, -1, -1);
	_topRightGrip = new GripPanel(this, NULL, 1, -1);
	_bottomLeftGrip = new GripPanel(this, NULL, -1, 1);
	_bottomRightGrip = new GripPanel(this, NULL, 1, 1);
	_captionGrip = new CaptionGripPanel(this, NULL);
	_captionGrip->SetCursor(dc_arrow);

	_minimizeButton = new FrameButton(this, NULL,"0");
	_minimizeButton->AddActionSignalTarget(this);
	_minimizeButton->SetCommand(new KeyValues("Minimize"));
	
	_maximizeButton = new FrameButton(this, NULL, "1");
	//!! no maximize handler implemented yet, so leave maximize button disabled
	SetMaximizeButtonVisible(false);

	char str[] = { 0x6F, 0 };
	_minimizeToSysTrayButton = new FrameButton(this, NULL, str);
	_minimizeToSysTrayButton->SetCommand("MinimizeToSysTray");
	SetMinimizeToSysTrayButtonVisible(false);
	
	_closeButton = new FrameButton(this, NULL, "r");
	_closeButton->AddActionSignalTarget(this);
	_closeButton->SetCommand(new KeyValues("Close"));
	
	_menuButton = new FrameSystemButton(this, NULL);
	_menuButton->SetMenu(GetSysMenu());
	
	if (!surface()->SupportsFeature(ISurface::FRAME_MINIMIZE_MAXIMIZE))
	{
		SetMinimizeButtonVisible(false);
		SetMaximizeButtonVisible(false);
	}

	if (parent)
	{
		// vgui doesn't support subwindow minimization
		SetMinimizeButtonVisible(false);
		SetMaximizeButtonVisible(false);
	}
	
	SetupResizeCursors();
	
	// calculate the Client area
	int wide, tall;
	GetSize(wide, tall);
}

//-----------------------------------------------------------------------------
// Purpose: Destructor
//-----------------------------------------------------------------------------
Frame::~Frame()
{
	delete _topGrip;
	delete _bottomGrip;
	delete _leftGrip;
	delete _rightGrip;
	delete _topLeftGrip;
	delete _topRightGrip;
	delete _bottomLeftGrip;
	delete _bottomRightGrip;
	delete _captionGrip;
	delete _minimizeButton;
	delete _maximizeButton;
	delete _closeButton;
	delete _menuButton;
	
	delete _title;
}

//-----------------------------------------------------------------------------
// Purpose: Setup the grips on the edges of the panel to resize it.
//-----------------------------------------------------------------------------
void Frame::SetupResizeCursors()
{
	if (IsSizeable())
	{
		_topGrip->SetCursor(dc_sizens);
		_bottomGrip->SetCursor(dc_sizens);
		_leftGrip->SetCursor(dc_sizewe);
		_rightGrip->SetCursor(dc_sizewe);
		_topLeftGrip->SetCursor(dc_sizenwse);
		_topRightGrip->SetCursor(dc_sizenesw);
		_bottomLeftGrip->SetCursor(dc_sizenesw);
		_bottomRightGrip->SetCursor(dc_sizenwse);

		_bottomRightGrip->SetPaintEnabled(true);
		_bottomRightGrip->SetPaintBackgroundEnabled(true);
	}
	else
	{
		// not resizable, so just use the default cursor
		_topGrip->SetCursor(dc_arrow);
		_bottomGrip->SetCursor(dc_arrow);
		_leftGrip->SetCursor(dc_arrow);
		_rightGrip->SetCursor(dc_arrow);
		_topLeftGrip->SetCursor(dc_arrow);
		_topRightGrip->SetCursor(dc_arrow);
		_bottomLeftGrip->SetCursor(dc_arrow);
		_bottomRightGrip->SetCursor(dc_arrow);

		_bottomRightGrip->SetPaintEnabled(false);
		_bottomRightGrip->SetPaintBackgroundEnabled(false);
	}
}

//-----------------------------------------------------------------------------
// Purpose: Bring the frame to the front and requests focus, ensures it's not minimized
//-----------------------------------------------------------------------------
void Frame::Activate()
{
	MoveToFront();
	RequestFocus();
	SetVisible(true);
	SetEnabled(true);
	surface()->SetMinimized(GetVPanel(), false);
}

//-----------------------------------------------------------------------------
// Purpose: activates the dialog 
//			if dialog is not currently visible it starts it minimized and flashing in the taskbar
//-----------------------------------------------------------------------------
void Frame::ActivateMinimized()
{
	if (IsVisible() && !IsMinimized())
	{
		Activate();
	}
	else
	{
		ipanel()->MoveToBack(GetVPanel());
		surface()->SetMinimized(GetVPanel(), true);
		SetVisible(true);
		SetEnabled(true);
		FlashWindow();
	}
}

//-----------------------------------------------------------------------------
// Purpose: returns true if the dialog is currently minimized
//-----------------------------------------------------------------------------
bool Frame::IsMinimized()
{
	return surface()->IsMinimized(GetVPanel());
}

//-----------------------------------------------------------------------------
// Purpose: Center the dialog on the screen
//-----------------------------------------------------------------------------
void Frame::MoveToCenterOfScreen()
{
	int wx, wy, ww, wt;
	surface()->GetWorkspaceBounds(wx, wy, ww, wt);
	SetPos((ww - GetWide()) / 2, (wt - GetTall()) / 2);
}


void Frame::LayoutProportional( FrameButton *bt )
{
	float scale = 1.0;

	if( IsProportional() )
	{	
		int screenW, screenH;
		surface()->GetScreenSize( screenW, screenH );

		int proW,proH;
		surface()->GetProportionalBase( proW, proH );

		scale =	( (float)( screenH ) / (float)( proH ) );
	}

	bt->SetSize( (int)( FrameButton::BUTTON_SIDE * scale ), (int)( FrameButton::BUTTON_SIDE * scale ) );
	bt->SetTextInset( (int)( ceil( 2 * scale ) ), (int) ( ceil(1 * scale ) ) );
}

//-----------------------------------------------------------------------------
// Purpose: Recalculate the position of all items
//-----------------------------------------------------------------------------
void Frame::PerformLayout()
{
	// chain back
	BaseClass::PerformLayout();
	
	// move everything into place
	int wide, tall;
	GetSize(wide, tall);
	
	const int DRAGGER_SIZE = 5;
	const int CORNER_SIZE = 8, CORNER_SIZE2 = CORNER_SIZE * 2;
	const int BOTTOMRIGHTSIZE = 18;
	
	_topGrip->SetBounds(CORNER_SIZE, 0, wide - CORNER_SIZE2, DRAGGER_SIZE);
	_leftGrip->SetBounds(0, CORNER_SIZE, DRAGGER_SIZE, tall - CORNER_SIZE2);
	_topLeftGrip->SetBounds(0, 0, CORNER_SIZE, CORNER_SIZE);
	_topRightGrip->SetBounds(wide - CORNER_SIZE, 0, CORNER_SIZE, CORNER_SIZE);
	_bottomLeftGrip->SetBounds(0, tall - CORNER_SIZE, CORNER_SIZE, CORNER_SIZE);

	// make the bottom-right grip larger
	_bottomGrip->SetBounds(CORNER_SIZE, tall - DRAGGER_SIZE, wide - (CORNER_SIZE + BOTTOMRIGHTSIZE), DRAGGER_SIZE);
	_rightGrip->SetBounds(wide - DRAGGER_SIZE, CORNER_SIZE, DRAGGER_SIZE, tall - (CORNER_SIZE + BOTTOMRIGHTSIZE));

	_bottomRightGrip->SetBounds(wide - BOTTOMRIGHTSIZE, tall - BOTTOMRIGHTSIZE, BOTTOMRIGHTSIZE, BOTTOMRIGHTSIZE);
	
	_captionGrip->SetSize(wide-10,23);
	
	_topGrip->MoveToFront();
	_bottomGrip->MoveToFront();
	_leftGrip->MoveToFront();
	_rightGrip->MoveToFront();
	_topLeftGrip->MoveToFront();
	_topRightGrip->MoveToFront();
	_bottomLeftGrip->MoveToFront();
	_bottomRightGrip->MoveToFront();
	
	_maximizeButton->MoveToFront();
	_menuButton->MoveToFront();
	_minimizeButton->MoveToFront();
	_minimizeToSysTrayButton->MoveToFront();
	
	_menuButton->SetBounds(5+2, 5+3, 18, 18);
	

	float scale = 1;

	if(IsProportional())
	{
		int screenW, screenH;
		surface()->GetScreenSize( screenW, screenH );

		int proW,proH;
		surface()->GetProportionalBase( proW, proH );

		scale =	( (float)( screenH ) / (float)( proH ) );
	}
	
	int offset_start = (int)( 20 * scale );
	int offset= offset_start;

	int top_border_offset = (int) ( ( 5+3 ) * scale );
	int side_border_offset = (int) ( 5 * scale );

	// 	 push the buttons against the east side
	if (_closeButton->IsVisible())
	{
		_closeButton->SetPos((wide-side_border_offset)-offset,top_border_offset);
		offset += offset_start;
		LayoutProportional( _closeButton );

	}
	if (_minimizeToSysTrayButton->IsVisible())
	{
		_minimizeToSysTrayButton->SetPos((wide-side_border_offset)-offset,top_border_offset);
		offset += offset_start;
		LayoutProportional( _minimizeToSysTrayButton );
	}
	if (_maximizeButton->IsVisible())
	{
		_maximizeButton->SetPos((wide-side_border_offset)-offset,top_border_offset);
		offset += offset_start;
		LayoutProportional( _maximizeButton );
	}
	if (_minimizeButton->IsVisible())
	{
		_minimizeButton->SetPos((wide-side_border_offset)-offset,top_border_offset);
		offset += offset_start;
		LayoutProportional( _minimizeButton );
	}


}

//-----------------------------------------------------------------------------
// Purpose: Set the text in the title bar.
//-----------------------------------------------------------------------------
void Frame::SetTitle(const char *title, bool surfaceTitle)
{
	wchar_t unicodeText[128];
	unicodeText[0] = 0;

	if (!_title)
	{
		_title = new TextImage( "" );
	}

	Assert(title);

    // see if the combobox text has changed, and if so, post a message detailing the new text
	const char *newTitle = title;

	// check if the new text is a localized string, if so undo it
	if (*newTitle == '#')
	{
		// try lookup in localization tables
		StringIndex_t unlocalizedTextSymbol = localize()->FindIndex(newTitle + 1);
		if (unlocalizedTextSymbol != INVALID_STRING_INDEX)
		{
			// we have a new text value
			wcsncpy( unicodeText, localize()->GetValueByIndex(unlocalizedTextSymbol), sizeof( unicodeText) / sizeof(wchar_t) );
		}
	}
	else
	{
		localize()->ConvertANSIToUnicode( newTitle, unicodeText, sizeof(unicodeText) );
	}

	_title->SetText(unicodeText);
	
	if (surfaceTitle)
	{
		surface()->SetTitle(GetVPanel(), unicodeText);
	}
	
	Repaint();
}

//-----------------------------------------------------------------------------
// Purpose: Sets the unicode text in the title bar
//-----------------------------------------------------------------------------
void Frame::SetTitle(const wchar_t *title, bool surfaceTitle)
{
	if (!_title)
	{
		_title = new TextImage( "" );
	}
	_title->SetText(title);
	if (surfaceTitle)
	{
		surface()->SetTitle(GetVPanel(), title);
	}
	Repaint();
}

//-----------------------------------------------------------------------------
// Purpose: Set the text in the title bar.
//-----------------------------------------------------------------------------
void Frame::InternalSetTitle(const char *title)
{
	SetTitle(title, true);
}

//-----------------------------------------------------------------------------
// Purpose: Set the movability of the panel
//-----------------------------------------------------------------------------
void Frame::SetMoveable(bool state)
{
	_moveable=state;
}

//-----------------------------------------------------------------------------
// Purpose: Set the resizability of the panel
//-----------------------------------------------------------------------------
void Frame::SetSizeable(bool state)
{
	_sizeable=state;
	
	SetupResizeCursors();
}

//-----------------------------------------------------------------------------
// Purpose: Check the movability of the panel
//-----------------------------------------------------------------------------
bool Frame::IsMoveable()
{
	return _moveable;
}

//-----------------------------------------------------------------------------
// Purpose: Check the resizability of the panel
//-----------------------------------------------------------------------------
bool Frame::IsSizeable()
{
	return _sizeable;
}

//-----------------------------------------------------------------------------
// Purpose: Get the size of the panel inside the frame edges.
//-----------------------------------------------------------------------------
void Frame::GetClientArea(int &x, int &y, int &wide, int &tall)
{
	x = 5;

	GetSize(wide, tall);

	if( _drawTitleBar )
	{
		int captionTall = surface()->GetFontTall(_title->GetFont());

		y = 5+  captionTall+CAPTION_TITLE_BORDER +1;
		tall = (tall - 5) - y;
	}
	
	wide = (wide - 5) - x;
}

// 
//-----------------------------------------------------------------------------
// Purpose: applies user configuration settings
//-----------------------------------------------------------------------------
void Frame::ApplyUserConfigSettings(KeyValues *userConfig)
{
	// calculate defaults
	int wx, wy, ww, wt;
	vgui::surface()->GetWorkspaceBounds(wx, wy, ww, wt);

	int x, y, wide, tall;
	GetBounds(x, y, wide, tall);
	bool bNoSettings = false;
	if (_moveable)
	{
		// check to see if anything is set
		if (!userConfig->FindKey("xpos", false))
		{
			bNoSettings = true;
		}

		// get the user config position
		// default to where we're currently at
		x = userConfig->GetInt("xpos", x);
		y = userConfig->GetInt("ypos", y);
	}
	if (_sizeable)
	{
		wide = userConfig->GetInt("wide", wide);
		tall = userConfig->GetInt("tall", tall);
	}

	// see if the dialog has a place on the screen it wants to start
	if (bNoSettings && GetDefaultScreenPosition(x, y, wide, tall))
	{
		bNoSettings = false;
	}

	// make sure it conforms to the minimum size of the dialog
	int minWide, minTall;
	GetMinimumSize(minWide, minTall);
	if (wide < minWide)
	{
		wide = minWide;
	}
	if (tall < minTall)
	{
		tall = minTall;
	}

	// make sure it's on the screen
	if (x + wide > ww)
	{
		x = wx + ww - wide;
	}
	if (y + tall > wt)
	{
		y = wy + wt - tall;
	}

	if (x < wx)
	{
		x = wx;
	}
	if (y < wy)
	{
		y = wy;
	}

	SetBounds(x, y, wide, tall);

	if (bNoSettings)
	{
		// since nothing was set, default our position to the middle of the screen
		MoveToCenterOfScreen();
	}

	BaseClass::ApplyUserConfigSettings(userConfig);
}

//-----------------------------------------------------------------------------
// Purpose: returns user config settings for this control
//-----------------------------------------------------------------------------
void Frame::GetUserConfigSettings(KeyValues *userConfig)
{
	if (_moveable)
	{
		int x, y;
		GetPos(x, y);
		userConfig->SetInt("xpos", x);
		userConfig->SetInt("ypos", y);
	}
	if (_sizeable)
	{
		int w, t;
		GetSize(w, t);
		userConfig->SetInt("wide", w);
		userConfig->SetInt("tall", t);
	}

	BaseClass::GetUserConfigSettings(userConfig);
}

//-----------------------------------------------------------------------------
// Purpose: gets the default position and size on the screen to appear the first time (defaults to centered)
//-----------------------------------------------------------------------------
bool Frame::GetDefaultScreenPosition(int &x, int &y, int &wide, int &tall)
{
	return false;
}

//-----------------------------------------------------------------------------
// Purpose: draws title bar
//-----------------------------------------------------------------------------
void Frame::PaintBackground()
{
	int wide = GetWide();
	int tall = surface()->GetFontTall(_title->GetFont());

	Color titleColor = _titleBarDisabledBgColor;
	bool titleEnabled = false;
	
	// draw the background of the Client area first
	BaseClass::PaintBackground();
	
	//take the panel with focus and check up tree for this panel
	//if you find it, than some child of you has the focus, so
	//you should be focused
	VPANEL focus = input()->GetFocus();
	
	if (focus && ipanel()->HasParent(focus, GetVPanel()))
	{
		titleColor = _titleBarBgColor;
		titleEnabled = true;
	}
	
	if (_hasFocus != titleEnabled)
	{
		_hasFocus = titleEnabled;
		
		_minimizeButton->SetDisabledLook(!titleEnabled);
		_maximizeButton->SetDisabledLook(!titleEnabled);
		_closeButton->SetDisabledLook(!titleEnabled);
		_minimizeToSysTrayButton->SetDisabledLook(!titleEnabled);
		_menuButton->SetEnabled(titleEnabled);
		
		_minimizeButton->InvalidateLayout();
		_maximizeButton->InvalidateLayout();
		_minimizeToSysTrayButton->InvalidateLayout();
		_closeButton->InvalidateLayout();
		_menuButton->InvalidateLayout();
	}

	if (_hasFocus && _flashWindow)
	{
		// Stop flashing when we get focus
		FlashWindowStop();
	}
	
	IScheme *pScheme = scheme()->GetIScheme( GetScheme() );
	IBorder *border = pScheme->GetBorder( "FrameBorder");
	if (border)
	{
		border->Paint(GetVPanel());
	}

	if( _drawTitleBar )
	{
		int screenW, screenH;
		surface()->GetScreenSize( screenW, screenH );

		int proW,proH;
		surface()->GetProportionalBase( proW, proH );

		float scale =	( (float)( screenH ) / (float)( proH ) );

		
		// caption
		surface()->DrawSetColor(titleColor);
		surface()->DrawFilledRect(5, 5, wide - 5, (int)( 28 * scale)); 
		
		if (_title != NULL)
		{
			if (titleEnabled)
			{
				_title->SetColor(_titleBarFgColor);
			}
			else
			{
				_title->SetColor(_titleBarDisabledFgColor);
			}
			_title->SetPos(28, 9);		
			_title->SetSize(wide - 72, tall);
			_title->Paint();
		}
	}
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void Frame::ApplySchemeSettings(IScheme *pScheme)
{
	// always chain back
	BaseClass::ApplySchemeSettings(pScheme);
	
	_titleBarFgColor = GetSchemeColor("TitleBarFgColor", pScheme);
	_titleBarBgColor = GetSchemeColor("TitleBarBgColor", pScheme);
	_titleBarDisabledFgColor = GetSchemeColor("TitleBarDisabledFgColor", pScheme);
	_titleBarDisabledBgColor = GetSchemeColor("TitleBarDisabledBgColor", pScheme);

	_title->SetFont( pScheme->GetFont( "Default", IsProportional() ) );
	_title->ResizeImageToContent();

	HFont marfont = pScheme->GetFont( "Marlett", IsProportional() );
	_minimizeButton->SetFont(marfont);
	_maximizeButton->SetFont(marfont);
	_minimizeToSysTrayButton->SetFont(marfont);
	_closeButton->SetFont(marfont);


	//	SetBorder(GetScheme()->GetBorder("FrameBorder"));
}

//-----------------------------------------------------------------------------
// Purpose: Apply settings loaded from a resource file
//-----------------------------------------------------------------------------
void Frame::ApplySettings(KeyValues *inResourceData)
{
	// Don't change the frame's visibility, remove that setting from the config data
	inResourceData->SetInt("visible", -1);
	BaseClass::ApplySettings(inResourceData);
	if( !inResourceData->GetInt("settitlebarvisible", 1 ) ) // if "title" is "0" then don't draw the title bar
	{
		SetTitleBarVisible( false );
	}
}


//-----------------------------------------------------------------------------
// Purpose: Apply settings loaded from a resource file
//-----------------------------------------------------------------------------
void Frame::GetSettings(KeyValues *outResourceData)
{
	BaseClass::GetSettings(outResourceData);
	outResourceData->SetInt("settitlebarvisible", _drawTitleBar );
}


//-----------------------------------------------------------------------------
// Purpose: Go invisible when a close message is recieved.
//-----------------------------------------------------------------------------
void Frame::OnClose()
{
	// if we're modal, release that before we hide the window else the wrong window will get focus
	if (input()->GetAppModalSurface() == GetVPanel())
	{
		input()->ReleaseAppModalSurface();
	}
	SetVisible(false);
	BaseClass::OnClose();
}

//-----------------------------------------------------------------------------
// Purpose: Command handling
//-----------------------------------------------------------------------------
void Frame::OnCommand(const char *command)
{
	if (!stricmp(command, "Close"))
	{
		Close();
	}
	else if (!stricmp(command, "Minimize"))
	{
		OnMinimize();
	}
	else if (!stricmp(command, "MinimizeToSysTray"))
	{
		OnMinimizeToSysTray();
	}
	else
	{
		BaseClass::OnCommand(command);
	}
}


//-----------------------------------------------------------------------------
// Purpose: Get the system menu 
//-----------------------------------------------------------------------------
Menu *Frame::GetSysMenu()
{
	if (!_sysMenu)
	{
		_sysMenu = new Menu(this, NULL);
		_sysMenu->SetVisible(false);
		_sysMenu->AddActionSignalTarget(this);

		_sysMenu->AddMenuItem("Minimize", "#SysMenu_Minimize", "Minimize", this);
		_sysMenu->AddMenuItem("Maximize", "#SysMenu_Maximize", "Maximize", this);
		_sysMenu->AddMenuItem("Close", "#SysMenu_Close", "Close", this);

		// check for enabling/disabling menu items
		// this might have to be done at other times as well. 
		Panel *menuItem = _sysMenu->FindChildByName("Minimize");
		if (menuItem)
		{
			menuItem->SetEnabled(_minimizeButton->IsVisible());
		}
		menuItem = _sysMenu->FindChildByName("Maximize");
		if (menuItem)
		{
			menuItem->SetEnabled(_maximizeButton->IsVisible());
		}
		menuItem = _sysMenu->FindChildByName("Close");
		if (menuItem)
		{
			menuItem->SetEnabled(_closeButton->IsVisible());
		}
	}
	
	return _sysMenu;
}

//-----------------------------------------------------------------------------
// Purpose: Set the system menu  
//-----------------------------------------------------------------------------
void Frame::SetSysMenu(Menu *menu)
{
	if (menu == _sysMenu)
		return;
	
	_sysMenu->MarkForDeletion();
	_sysMenu = menu;

	_menuButton->SetMenu(_sysMenu);
}

//-----------------------------------------------------------------------------
// Purpose: Close the window 
//-----------------------------------------------------------------------------
void Frame::Close()
{
	OnClose();
}

//-----------------------------------------------------------------------------
// Purpose: Minimize the window on the taskbar.
//-----------------------------------------------------------------------------
void Frame::OnMinimize()
{
	surface()->SetMinimized(GetVPanel(), true);
}

//-----------------------------------------------------------------------------
// Purpose: Does nothing by default
//-----------------------------------------------------------------------------
void Frame::OnMinimizeToSysTray()
{
}

//-----------------------------------------------------------------------------
// Purpose: Respond to mouse presses
//-----------------------------------------------------------------------------
void Frame::OnMousePressed(MouseCode code)
{
	if (!IsBuildGroupEnabled())
	{
		// if a child doesn't have focus, get it for ourselves
		VPANEL focus = input()->GetFocus();
		if (!focus || !ipanel()->HasParent(focus, GetVPanel()))
		{
			RequestFocus();
		}
	}
	
	BaseClass::OnMousePressed(code);
}

//-----------------------------------------------------------------------------
// Purpose: Toggle visibility of the system menu button
//-----------------------------------------------------------------------------
void Frame::SetMenuButtonVisible(bool state)
{
	_menuButton->SetVisible(state);
}

//-----------------------------------------------------------------------------
// Purpose: Toggle respond of the system menu button
//			it will look enabled or disabled in response to the title bar
//			but may not activate.
//-----------------------------------------------------------------------------
void Frame::SetMenuButtonResponsive(bool state)
{
	_menuButton->SetResponsive(state);
}

//-----------------------------------------------------------------------------
// Purpose: Toggle visibility of the minimize button
//-----------------------------------------------------------------------------
void Frame::SetMinimizeButtonVisible(bool state)
{
	_minimizeButton->SetVisible(state);
}

//-----------------------------------------------------------------------------
// Purpose: Toggle visibility of the maximize button
//-----------------------------------------------------------------------------
void Frame::SetMaximizeButtonVisible(bool state)
{
	_maximizeButton->SetVisible(state);
}

//-----------------------------------------------------------------------------
// Purpose: Toggles visibility of the minimize-to-systray icon (defaults to false)
//-----------------------------------------------------------------------------
void Frame::SetMinimizeToSysTrayButtonVisible(bool state)
{
	_minimizeToSysTrayButton->SetVisible(state);
}

//-----------------------------------------------------------------------------
// Purpose: Toggle visibility of the close button
//-----------------------------------------------------------------------------
void Frame::SetCloseButtonVisible(bool state)
{
	_closeButton->SetVisible(state);
}

//-----------------------------------------------------------------------------
// Purpose: soaks up any remaining messages
//-----------------------------------------------------------------------------
void Frame::OnKeyCodePressed(KeyCode code)
{
	// ESC cancels, unless we're in the engine - in the engine ESC flips between the UI and the game
	if (code == KEY_ESCAPE && surface()->SupportsFeature(ISurface::ESCAPE_KEY))
	{
		PostMessage(this, new KeyValues("Command", "command", "Cancel"));
	}
}

//-----------------------------------------------------------------------------
// Purpose: soaks up any remaining messages
//-----------------------------------------------------------------------------
void Frame::OnKeyCodeReleased(KeyCode code)
{
}

//-----------------------------------------------------------------------------
// Purpose: soaks up any remaining messages
//-----------------------------------------------------------------------------
void Frame::OnKeyFocusTicked()
{
}

//-----------------------------------------------------------------------------
// Purpose: Toggles window flash state on a timer
//-----------------------------------------------------------------------------
void Frame::InternalFlashWindow()
{
	if (_flashWindow)
	{
		// toggle icon flashing
		_nextFlashState = true;
		surface()->FlashWindow(GetVPanel(), _nextFlashState);
		_nextFlashState = !_nextFlashState;
		
		PostMessage(this, new KeyValues("FlashWindow"), 1.8f);
	}
}

//-----------------------------------------------------------------------------
// Purpose: Adds the child to the focus nav group
//-----------------------------------------------------------------------------
void Frame::OnChildAdded(VPANEL child)
{
	BaseClass::OnChildAdded(child);
}

//-----------------------------------------------------------------------------
// Purpose: Flash the window system tray button until the frame gets focus
//-----------------------------------------------------------------------------
void Frame::FlashWindow()
{
	_flashWindow = true;
	_nextFlashState = true;
	
	InternalFlashWindow();
}

//-----------------------------------------------------------------------------
// Purpose: Stops any window flashing
//-----------------------------------------------------------------------------
void Frame::FlashWindowStop()
{
	surface()->FlashWindow(GetVPanel(), false);
	_flashWindow = false;
}


//-----------------------------------------------------------------------------
// Purpose: load the control settings - should be done after all the children are added to the dialog
//-----------------------------------------------------------------------------
void Frame::LoadControlSettings(const char *dialogResourceName, const char *pathID)
{
	BaseClass::LoadControlSettings(dialogResourceName, pathID);
	
	// set the focus on the default control
	Panel *defaultFocus = GetFocusNavGroup().GetDefaultPanel();
	if (defaultFocus)
	{
		defaultFocus->RequestFocus();
	}
}

//-----------------------------------------------------------------------------
// Purpose: Checks for ctrl+shift+b hits to enter build mode
//			Activates any hotkeys / default buttons
//			Swallows any unhandled input
//-----------------------------------------------------------------------------
void Frame::OnKeyCodeTyped(KeyCode code)
{
	bool shift = (input()->IsKeyDown(KEY_LSHIFT) || input()->IsKeyDown(KEY_RSHIFT));
	bool ctrl = (input()->IsKeyDown(KEY_LCONTROL) || input()->IsKeyDown(KEY_RCONTROL));
	bool alt = (input()->IsKeyDown(KEY_LALT) || input()->IsKeyDown(KEY_RALT));
	
	if ( ctrl && shift && alt && code == KEY_B)
	{
		// enable build mode
		ActivateBuildMode();
	}
	else if (ctrl && shift && alt && code == KEY_R)
	{
		// reload the scheme
		VPANEL top = surface()->GetEmbeddedPanel();
		if (top)
		{
			// reload the data file
			scheme()->ReloadSchemes();

			Panel *panel = ipanel()->GetPanel(top, GetModuleName());
			if (panel)
			{
				// make the top-level panel reload it's scheme, it will chain down to all the child panels
				panel->InvalidateLayout(false, true);
			}
		}
	}
	else if (alt && code == KEY_F4)
	{
		// user has hit the close
		PostMessage(this, new KeyValues("Close"));
	}
	else if (code == KEY_ENTER)
	{
		// check for a default button
		Panel *panel = GetFocusNavGroup().GetCurrentDefaultButton();
		if (panel)
		{
			// Activate the button
			PostMessage(panel, new KeyValues("Hotkey"));
		}
	}
	else if (code == KEY_TAB)
	{
	}
	/*	 // don't chain back as Frames are the end of the line for key presses
	else
	{
		BaseClass::OnKeyCodeTyped( code );
	}*/

}

//-----------------------------------------------------------------------------
// Purpose: Checks for ctrl+shift+b hits to enter build mode
//			Activates any hotkeys / default buttons
//			Swallows any unhandled input
//-----------------------------------------------------------------------------
void Frame::OnKeyTyped(wchar_t unichar)
{
	Panel *panel = GetFocusNavGroup().FindPanelByHotkey(unichar);
	if (panel)
	{
		// tell the panel to Activate
		PostMessage(panel, new KeyValues("Hotkey"));
	}
}


void Frame::SetTitleBarVisible( bool state )
{
	_drawTitleBar = state; 
	SetMenuButtonVisible(state);
	SetMinimizeButtonVisible(state);
	SetMaximizeButtonVisible(state);
	SetCloseButtonVisible(state);
}


//-----------------------------------------------------------------------------
// Purpose: Message mapping 
//-----------------------------------------------------------------------------
MessageMapItem_t Frame::m_MessageMap[] =
{
	MAP_MESSAGE( Frame, "Close", Close ),
	MAP_MESSAGE( Frame, "Minimize", OnMinimize ),
	MAP_MESSAGE( Frame, "FlashWindow", InternalFlashWindow ),
	MAP_MESSAGE_CONSTCHARPTR( Frame, "SetTitle", InternalSetTitle, "text" ),	// custom message
};
IMPLEMENT_PANELMAP( Frame, EditablePanel );
