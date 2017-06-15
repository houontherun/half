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

#ifndef SCROLLBARSLIDER_H
#define SCROLLBARSLIDER_H

#ifdef _WIN32
#pragma once
#endif

#include <vgui/VGUI.h>
#include <vgui_controls/Panel.h>

namespace vgui
{

enum MouseCode;
class IBorder;

//-----------------------------------------------------------------------------
// Purpose: ScrollBarSlider bar, as used in ScrollBar's
//-----------------------------------------------------------------------------
class ScrollBarSlider : public Panel
{
public:
	ScrollBarSlider(Panel *parent, const char *panelName, bool vertical);

	// Set the ScrollBarSlider value of the nob.
	virtual void SetValue(int value); 
	virtual int  GetValue();

	// Check whether the scroll bar is vertical or not
	virtual bool IsVertical();

	// Set max and min range of lines to display
    virtual void SetRange(int min, int max);	
	
	virtual void GetRange(int &min, int &max);

	// Set number of rows that can be displayed in window
	virtual void SetRangeWindow(int rangeWindow); 

	// Get number of rows that can be displayed in window
	virtual int GetRangeWindow(); 

	// Set the size of the ScrollBarSlider nob
	virtual void SetSize(int wide, int tall);

	// Get current ScrollBarSlider bounds
	virtual void GetNobPos(int &min, int &max);	

	virtual bool HasFullRange();
	virtual void SetButtonOffset(int buttonOffset);
	virtual void OnCursorMoved(int x, int y);
	virtual void OnMousePressed(MouseCode code);
	virtual void OnMouseDoublePressed(MouseCode code);
	virtual void OnMouseReleased(MouseCode code);

protected:
	virtual void Paint();
	virtual void PaintBackground();
	virtual void PerformLayout();
	virtual void ApplySchemeSettings(IScheme *pScheme);

private:
	virtual void RecomputeNobPosFromValue();
	virtual void RecomputeValueFromNobPos();
	virtual void SendScrollBarSliderMovedMessage();

	bool _vertical;
	bool _dragging;
	int _nobPos[2];
	int _nobDragStartPos[2];
	int _dragStartPos[2];
	int _range[2];
	int _value;		// the position of the ScrollBarSlider, in coordinates as specified by SetRange/SetRangeWindow
	int _rangeWindow;
	int _buttonOffset;
	IBorder *_ScrollBarSliderBorder;

    typedef Panel BaseClass;
};

} // namespace vgui

#endif // SCROLLBARSLIDER_H
