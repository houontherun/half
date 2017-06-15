//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#include "stdafx.h"
#include "EntityHelpDlg.h"
#include "GameData.h"
#include "RichEditCtrlEx.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


static CEntityHelpDlg *g_pHelpDlg = NULL;


BEGIN_MESSAGE_MAP(CEntityHelpDlg, CDialog)
	//{{AFX_MSG_MAP(CEntityHelpDlg)
	ON_WM_DESTROY()
	ON_WM_CLOSE()
	ON_WM_SIZE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CEntityHelpDlg::ShowEntityHelpDialog(void)
{
	if (g_pHelpDlg == NULL)
	{
		g_pHelpDlg = new CEntityHelpDlg;
		g_pHelpDlg->Create(IDD_ENTITY_HELP);
	}

	if (g_pHelpDlg != NULL)
	{
		g_pHelpDlg->ShowWindow(SW_SHOW);
	}
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CEntityHelpDlg::SetEditGameClass(GDclass *pClass)
{
	if (g_pHelpDlg != NULL)
	{
		g_pHelpDlg->UpdateClass(pClass);
	}
}


//-----------------------------------------------------------------------------
// Purpose: Constructor.
//-----------------------------------------------------------------------------
CEntityHelpDlg::CEntityHelpDlg(CWnd *pwndParent)
	: CDialog(CEntityHelpDlg::IDD, pwndParent)
{
	m_pHelpText = NULL;
}


//-----------------------------------------------------------------------------
// Purpose: Destructor.
//-----------------------------------------------------------------------------
CEntityHelpDlg::~CEntityHelpDlg(void)
{
	g_pHelpDlg = NULL;
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pDX - 
//-----------------------------------------------------------------------------
void CEntityHelpDlg::DoDataExchange(CDataExchange *pDX)
{
	CDialog::DoDataExchange(pDX);

	//{{AFX_DATA_MAP(CEntityHelpDlg)
	//}}AFX_DATA_MAP
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pszText - 
// Output : 
//-----------------------------------------------------------------------------
int CEntityHelpDlg::GetTextWidth(const char *pszText, CDC *pDC)
{
	if (pszText != NULL)
	{
		bool bRelease = false;

		if (pDC == NULL)
		{
			bRelease = true;
			pDC = m_pHelpText->GetDC();
		}

		CGdiObject *pOldFont = pDC->SelectStockObject(DEFAULT_GUI_FONT);
		CSize Size = pDC->GetTabbedTextExtent(pszText, strlen(pszText), 0, NULL);
		pDC->SelectObject(pOldFont);

		if (bRelease)
		{
			m_pHelpText->ReleaseDC(pDC);
		}

		return(Size.cx);
	}

	return(0);
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pClass - 
// Output : 
//-----------------------------------------------------------------------------
int CEntityHelpDlg::GetMaxVariableWidth(GDclass *pClass)
{
	CDC *pDC = m_pHelpText->GetDC();

	int nWidthMax = 0;

	int nCount = m_pClass->GetVariableCount();
	for (int i = 0; i < nCount; i++)
	{
		GDinputvariable *pVar = m_pClass->GetVariableAt(i);
		int nWidth = GetTextWidth(pVar->GetName(), pDC);

		if (nWidth > nWidthMax)
		{
			nWidthMax = nWidth;
		}
	}

	m_pHelpText->ReleaseDC(pDC);

	return(nWidthMax);
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CEntityHelpDlg::OnClose(void)
{
	DestroyWindow();
}


//-----------------------------------------------------------------------------
// Purpose: Called when our window is being destroyed.
//-----------------------------------------------------------------------------
void CEntityHelpDlg::OnDestroy(void)
{
	delete this;
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
BOOL CEntityHelpDlg::OnInitDialog(void)
{
	CDialog::OnInitDialog();
	m_pHelpText = new CRichEditCtrlEx;
	m_pHelpText->SubclassDlgItem(IDC_HELP_TEXT, this);
	m_pHelpText->enable();
	return(TRUE);
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pClass - 
//-----------------------------------------------------------------------------
void CEntityHelpDlg::UpdateClass(GDclass *pClass)
{
	m_pClass = pClass;
	UpdateHelp();
	m_pHelpText->LineScroll(-64000, -64000);
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CEntityHelpDlg::UpdateHelp(void)
{
	if (m_pClass != NULL)
	{
		m_pHelpText->SetWindowText("");

		CRTFBuilder b;

		b << size(24);
		b << bold(true);
		b << color(1);
		b << m_pClass->GetName();
		b << "\n\n";
		b << write(*m_pHelpText);

		b << size(22);
		b << bold(false);
		b << m_pClass->GetDescription();
		b << "\n\n";
		b << write(*m_pHelpText);

		//
		// Keys section.
		//
		int nCount = m_pClass->GetVariableCount();
		if (nCount > 0)
		{
			//
			// Keys header.
			//
			b << size(24);
			b << bold(true);
			b << color(1);
			b << "KEYS";
			b << "\n\n";
			b << write(*m_pHelpText);

			//
			// Keys.
			//
			b << size(20);
			b << bold(false);

			for (int i = 0; i < nCount; i++)
			{
				GDinputvariable *pVar = m_pClass->GetVariableAt(i);

				b << bold(true);
				b << pVar->GetLongName();
				b << bold(false);
				b << " ";

				b << italic(true);
				b << pVar->GetName();
				b << italic(false);

				b << " <";
				b << pVar->GetTypeText();
				b << "> ";

				b << pVar->GetDescription();
				b << "\n\n";
				b << write(*m_pHelpText);
			}
		}

		//
		// Inputs section.
		//
		POSITION pos;
		CClassInput *pInput = m_pClass->GetFirstInput(pos);
		if (pInput != NULL)
		{
			//
			// Inputs header.
			//
			b << "\n";
			b << size(24);
			b << bold(true);
			b << color(1);
			b << "INPUTS";
			b << "\n\n";
			b << write(*m_pHelpText);

			//
			// Inputs.
			//
			b << size(20);

			while (pInput != NULL)
			{
				b << bold(true);
				b << pInput->GetName();
				b << bold(false);
				b << " ";

				if (pInput->GetType() != iotVoid)
				{
					b << "<";
					b << pInput->GetTypeText();
					b << "> ";
				}

				b << pInput->GetDescription();
				b << "\n\n";
				b << write(*m_pHelpText);

				pInput = m_pClass->GetNextInput(pos);
			}
		}

		//
		// Outputs section.
		//
		CClassOutput *pOutput = m_pClass->GetFirstOutput(pos);
		if (pOutput != NULL)
		{
			//
			// Outputs header.
			//
			b << "\n";
			b << size(24);
			b << bold(true);
			b << color(1);
			b << "OUTPUTS";
			b << "\n\n";
			b << write(*m_pHelpText);

			//
			// Outputs.
			//
			b << size(20);

			while (pOutput != NULL)
			{
				b << bold(true);
				b << pOutput->GetName();
				b << bold(false);
				b << " ";

				if (pOutput->GetType() != iotVoid)
				{
					b << "<";
					b << pOutput->GetTypeText();
					b << "> ";
				}

				b << pOutput->GetDescription();
				b << "\n\n";
				b << write(*m_pHelpText);

				pOutput = m_pClass->GetNextOutput(pos);
			}
		}
	}
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : nType - 
//			cx - 
//			cy - 
// Output : afx_msg void
//-----------------------------------------------------------------------------
void CEntityHelpDlg::OnSize( UINT nType, int cx, int cy )
{
	CDialog::OnSize(nType, cx, cy);

	if (m_pHelpText != NULL)
	{
		m_pHelpText->SetWindowPos(NULL, 0, 0, cx - 22, cy - 22, SWP_NOMOVE | SWP_NOZORDER);
	}
}

