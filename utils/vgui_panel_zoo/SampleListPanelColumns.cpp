//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================
#include "DemoPage.h"

#include <VGUI_IVGui.h>
#include <VGUI_Controls.h>
#include <VGUI_KeyValues.h>
#include <VGUI_ListPanel.h>


using namespace vgui;


class SampleListPanelColumns: public DemoPage
{
	public:
		SampleListPanelColumns(Panel *parent, const char *name);
		~SampleListPanelColumns();
	
	private:
		ListPanel *m_pListPanel;
		
};

//-----------------------------------------------------------------------------
// Purpose: Constructor
//-----------------------------------------------------------------------------
SampleListPanelColumns::SampleListPanelColumns(Panel *parent, const char *name) : DemoPage(parent, name)
{
	// Create a list panel.
	m_pListPanel = new ListPanel(this, "AListPanel");

	// Add a column header
	m_pListPanel->AddColumnHeader(0, "Muppet", "Muppet", 150, true, 20, 200, true);  

	// Add another column header
	m_pListPanel->AddColumnHeader(1, "Description", "Description", 150, true, 20, 200, true);  

	// Set its position.
	m_pListPanel->SetPos(90, 25);
	m_pListPanel->SetSize(400, 150);
	
	// Add rows of data to the table
	KeyValues *data = new KeyValues ("item");
	data->SetString("Muppet", "Kermit");
	data->SetString("Description", "The frog");
	m_pListPanel->AddItem(data); 

	data->SetString("Muppet", "Miss Piggy");
	data->SetString("Description", "The diva");
	m_pListPanel->AddItem(data);

	data->SetString("Muppet", "Scooter");
	data->SetString("Description", "The man");
	m_pListPanel->AddItem(data);

	data->SetString("Muppet", "Statler");
	data->SetString("Description", "Old guy");
	m_pListPanel->AddItem(data);

	data->SetString("Muppet", "Waldorf");
	data->SetString("Description", "Old guy");
	m_pListPanel->AddItem(data);

	data->SetString("Muppet", "Gonzo");
	data->SetString("Description", "The unknown");
	m_pListPanel->AddItem(data);

	data->SetString("Muppet", "Scooter");
	data->SetString("Description", "The man");
	m_pListPanel->AddItem(data);

	data->SetString("Muppet", "Fozzie");
	data->SetString("Description", "The bear");
	m_pListPanel->AddItem(data);

	data->SetString("Muppet", "Betty Lou");
	data->SetString("Description", "[none]");
	m_pListPanel->AddItem(data);
}

//-----------------------------------------------------------------------------
// Purpose: Destructor
//-----------------------------------------------------------------------------
SampleListPanelColumns::~SampleListPanelColumns()
{
}




Panel* SampleListPanelColumns_Create(Panel *parent)
{
	return new SampleListPanelColumns(parent, "List Panel - columns");
}


