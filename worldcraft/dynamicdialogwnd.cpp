// DynamicDialogWnd.cpp : implementation file
//

#include "stdafx.h"
#include "worldcraft.h"
#include "DynamicDialogWnd.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDynamicDialogWnd

CDynamicDialogWnd::CDynamicDialogWnd(CWnd *pParent)
{
	m_pDialog = NULL;
	Create(NULL, "DynamicDialogWnd", WS_BORDER | WS_CAPTION | WS_CHILD, 
		CRect(0, 0, 50, 50), pParent, 1);
	SetWindowPos(&wndTopMost, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE);
}

CDynamicDialogWnd::~CDynamicDialogWnd()
{
	SetDialogClass(0, NULL);
}


BEGIN_MESSAGE_MAP(CDynamicDialogWnd, CWnd)
	//{{AFX_MSG_MAP(CDynamicDialogWnd)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CDynamicDialogWnd message handlers

void CDynamicDialogWnd::SetDialogClass(UINT nID, CDialog *pDialog)
{
	delete m_pDialog;

	if(!pDialog)
		return;

	m_pDialog = pDialog;

	CRect rWindow;
	GetWindowRect(&rWindow);

	SetRedraw(FALSE);

/*
	m_pDialog->Create(nID, this);

	// resize this window
	CRect rDialog;
	m_pDialog->GetWindowRect(&rDialog);
	MoveWindow(rWindow.left, rWindow.top, rDialog.Width(), rDialog.Height());
*/
	MoveWindow(0, 0, 50, 50);

	SetRedraw(TRUE);
	Invalidate();
	UpdateWindow();
}
