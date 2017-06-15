//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================
#include "DemoPage.h"

#include <VGUI_IVGui.h>

#include <VGUI_TextImage.h>


using namespace vgui;

//-----------------------------------------------------------------------------
// A TextImage is an Image that handles drawing of a text string
// They are not panels.
//-----------------------------------------------------------------------------
class TextImageDemo: public DemoPage
{
	public:
		TextImageDemo(Panel *parent, const char *name);
		~TextImageDemo();

		void Paint();
		
	private:
		TextImage *m_pTextImage;				
};

//-----------------------------------------------------------------------------
// Purpose: Constructor
//-----------------------------------------------------------------------------
TextImageDemo::TextImageDemo(Panel *parent, const char *name) : DemoPage(parent, name)
{

	// Create a TextImage object that says "Text Image Text"
	m_pTextImage = new TextImage("Text Image Text", GetScheme());

	// Set the position
	m_pTextImage->SetPos(100, 100);

}

//-----------------------------------------------------------------------------
// Purpose: Destructor
//-----------------------------------------------------------------------------
TextImageDemo::~TextImageDemo()
{
}

//-----------------------------------------------------------------------------
// Purpose: Paint the image on screen. TextImages are not panels, you must
//  call this method explicitly for them.
//-----------------------------------------------------------------------------
void TextImageDemo::Paint()
{
   m_pTextImage->Paint();
}


Panel* TextImageDemo_Create(Panel *parent)
{
	return new TextImageDemo(parent, "TextImageDemo");
}

