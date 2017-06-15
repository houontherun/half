// NewDocType.cpp : implementation file
//

#include "stdafx.h"
#include "worldcraft.h"
#include "NewDocType.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CNewDocType dialog


CNewDocType::CNewDocType(CWnd* pParent /*=NULL*/)
	: CDialog(CNewDocType::IDD, pParent)
{
	//{{AFX_DATA_INIT(CNewDocType)
	m_iNewType = -1;
	//}}AFX_DATA_INIT
}


void CNewDocType::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CNewDocType)
	DDX_Radio(pDX, IDC_NEWTYPE, m_iNewType);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CNewDocType, CDialog)
	//{{AFX_MSG_MAP(CNewDocType)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CNewDocType message handlers
