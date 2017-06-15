//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#include "stdafx.h"
#include "Worldcraft.h"
#include "ObjectBar.h"
#include "ControlBarIDs.h"
#include "Prefabs.h"
#include "Prefab3D.h"
#include "StockSolids.h"
#include "mainfrm.h"
#include "MapSolid.h"
#include "MapWorld.h"
#include "GameData.h"
#include "MapDoc.h"
#include "GlobalFunctions.h"
#include "ArchDlg.h"
#include "ToolManager.h"
#include "Vector.h"


extern CMapClass *CreateArch(BoundBox *pBox, float fStartAngle, int iSides, float fArc,
					   int iWallWidth, int iAddHeight, BOOL bPreview);


static int _iNewObjIndex = 0;
static char _szNewObjName[128];

struct SolidTypeInfo_t
{
	LPCTSTR pszName;
	UINT nFaces;	
	UINT nFacesMin;
	UINT nFacesMax;
	bool bEnableFaceControl;
};


SolidTypeInfo_t SolidTypes[] =
{
	{"block", 0, 6, 6, false},
	{"wedge", 0, 5, 5, false},
	{"cylinder", 8, 3, 32, true},
	{"spike", 4, 3, 32, true},
	{"sphere", 8, 3, 32, true},
	{"arch", 8, 3, 128, true},
};


BEGIN_MESSAGE_MAP(CObjectBar, CWorldcraftBar)
	ON_UPDATE_COMMAND_UI(IDC_CREATELIST, UpdateControl)
	ON_UPDATE_COMMAND_UI(IDC_CATEGORYLIST, UpdateControl)
	ON_UPDATE_COMMAND_UI(IDC_FACES, UpdateFaceControl)
	ON_UPDATE_COMMAND_UI(IDC_FACESSPIN, UpdateFaceControl)
	ON_UPDATE_COMMAND_UI(ID_TOOLS_CREATEPREFAB, UpdateControl)
	ON_UPDATE_COMMAND_UI(ID_CREATEOBJECT, UpdateControl)
	ON_CBN_SELCHANGE(IDC_CREATELIST, OnCreatelistSelchange)
	ON_CBN_SELCHANGE(IDC_CATEGORYLIST, OnChangeCategory)
END_MESSAGE_MAP()


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CObjectBar::CObjectBar()
	: CWorldcraftBar()
{
	for(int i = 0; i < MAX_PREV_SEL; i++)
	{
		m_PrevSel[i].dwGameID = 0;
	}

	m_dwPrevGameID = -1;
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pDX - 
//-----------------------------------------------------------------------------
void CObjectBar::DoDataExchange(CDataExchange *pDX)
{
	CWorldcraftBar::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(COP_Entity)
	DDX_Control(pDX, IDC_CREATELIST, m_CreateList);
	//}}AFX_DATA_MAP
}


//-----------------------------------------------------------------------------
// Purpose: Returns the bounds of the current 3D prefab object.
// Input  : *pBox - 
// Output : Returns TRUE on success, FALSE on failure.
//-----------------------------------------------------------------------------
BOOL CObjectBar::GetPrefabBounds(BoundBox *pBox)
{
	if (ListType != listPrefabs)
	{
		return FALSE;
	}

	CPrefab3D *pPrefab = (CPrefab3D *)CPrefab::FindID(m_CreateList.GetItemData(_iNewObjIndex));
	if (pPrefab != NULL)
	{
		if (pPrefab->GetType() != pt3D)
		{
			return(FALSE);
		}

		if (!pPrefab->IsLoaded())
		{
			pPrefab->Load();
		}

		if (!pPrefab->IsLoaded())
		{
			return(FALSE);
		}

		CMapWorld *pWorld = pPrefab->GetWorld();

		Vector mins;
		Vector maxs;
		pWorld->GetRender2DBox(mins, maxs);
		pBox->SetBounds(mins, maxs);

		return(TRUE);
	}

	return(FALSE);
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pBox - 
//			pAxes - 
// Output : 
//-----------------------------------------------------------------------------
CMapClass *CObjectBar::CreateInBox(BoundBox *pBox, Axes2 *pAxes)
{
	// primitives:
	if(ListType == listPrimitives)
	{
		int nFaces;
		char szBuf[128];
		m_Faces.GetWindowText(szBuf, 128);
		nFaces = atoi(szBuf);

		//
		// The index into the solid types array is stored in the item data.
		//
		int nSolidIndex = m_CreateList.GetItemData(_iNewObjIndex);

		int nFacesMin = SolidTypes[nSolidIndex].nFacesMin;
		int nFacesMax = SolidTypes[nSolidIndex].nFacesMax;

		//
		// Insure that the face count is within legal range (if applicable).
		//
		if ((SolidTypes[nSolidIndex].bEnableFaceControl) && (nFaces < nFacesMin || nFaces > nFacesMax))
		{
			CString str;
			str.Format("The face count for a %s must be in the range of %d to %d.",
				SolidTypes[nSolidIndex].pszName, nFacesMin, nFacesMax);
			AfxMessageBox(str);
			return NULL;
		}

		if(nSolidIndex < 5)
		{
			StockSolid *pStock;

			switch(nSolidIndex)
			{
			case 0:
				pStock = new StockBlock;
				break;
			case 1:
				pStock = new StockWedge;
				break;
			case 2:
				pStock = new StockCylinder;
				pStock->SetFieldData(StockCylinder::fieldSideCount, nFaces);
				break;
			case 3:
				pStock = new StockSpike;
				pStock->SetFieldData(StockSpike::fieldSideCount, nFaces);
				break;
			case 4:
				pStock = new StockSphere;
				pStock->SetFieldData(StockSphere::fieldSideCount, nFaces);
				break;
			}

			// create a solid
			CMapSolid *pSolid = new CMapSolid;
			pStock->SetFromBox(pBox);
			pStock->CreateMapSolid(pSolid);
			delete pStock;	// done with you! done!

			// return new solid
			return pSolid;
		}
		else
		{
			// arch
			CArchDlg dlg(pBox->bmins, pBox->bmaxs);
			Vector sizebounds;
			pBox->GetBoundsSize(sizebounds);
			dlg.m_iSides = nFaces;
			dlg.SetMaxWallWidth(min((int)sizebounds[pAxes->axHorz], (int)sizebounds[pAxes->axVert]));
			if(dlg.DoModal() != IDOK)
				return NULL;

			// save values for next use of arch
			dlg.SaveValues();

			CMapClass *pArch = CreateArch(pBox, dlg.m_fAngle, 
				dlg.m_iSides, dlg.m_fArc, dlg.m_iWallWidth, 
				dlg.m_iAddHeight, FALSE);
			return pArch;
		}
	}
	else
	{
		CPrefab *pPrefab = CPrefab::FindID(m_CreateList.GetItemData(_iNewObjIndex));
		if (pPrefab != NULL)
		{
			return(pPrefab->CreateInBox(pBox));
		}
	}

	return NULL;
}


//-----------------------------------------------------------------------------
// Purpose: Returns the classname of the default entity for the entity creation tool.
//-----------------------------------------------------------------------------
LPCTSTR CObjectBar::GetDefaultEntityClass(void)
{
	return _szNewObjName;
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CMapClass *CObjectBar::BuildPrefabObjectAtPoint( Vector const &HitPos )
{
	//
	// find prefab
	//
	CPrefab3D *pPrefab = ( CPrefab3D* )CPrefab::FindID( m_CreateList.GetItemData( _iNewObjIndex ) );
	if( !pPrefab )
		return NULL;

	//
	// create prefab bounding box -- centered at hit pos
	//
	return pPrefab->CreateAtPointAroundOrigin( HitPos );
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
bool CObjectBar::IsEntityToolCreatingPrefab( void )
{
	if( ( m_iLastTool == TOOL_ENTITY ) && ( m_CategoryList.GetCurSel() != 0 ) )
		return true;

	return false;
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
bool CObjectBar::IsEntityToolCreatingEntity( void )
{
	if( ( m_iLastTool == TOOL_ENTITY ) && ( m_CategoryList.GetCurSel() == 0 ) )
		return true;

	return false;
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CObjectBar::OnChangeCategory()
{
	switch( ListType )
	{
	case listPrimitives:
		{
			iBlockSel = -1;
			LoadBlockItems();
			break;
		}
	case listPrefabs:
		{
			if( ( m_iLastTool == TOOL_POINTER ) || ( m_iLastTool == TOOL_BLOCK ) )
			{
				iBlockSel = -1;
				LoadBlockItems();
			}
			else if( m_iLastTool == TOOL_ENTITY )
			{
				iMarkerSel = -1;
				LoadEntityItems();
			}
			break;
		}
	case listMarkers:
		{
			iMarkerSel = -1;
			LoadEntityItems();
			break;
		}
	default:
		break;
	}
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pParentWnd - 
// Output : Returns TRUE on success, FALSE on failure.
//-----------------------------------------------------------------------------
BOOL CObjectBar::Create(CWnd *pParentWnd)
{
	if (!CWorldcraftBar::Create(pParentWnd, IDD_OBJECTBAR, CBRS_RIGHT, IDCB_OBJECTBAR))
	{
		return FALSE;
	}

	SetWindowText("New Objects");

	// set up controls
	m_CreateList.SubclassDlgItem(IDC_CREATELIST, this);
	m_CategoryList.SubclassDlgItem(IDC_CATEGORYLIST, this);
	m_Faces.SubclassDlgItem(IDC_FACES, this);
	m_FacesSpin.SubclassDlgItem(IDC_FACESSPIN, this);
	m_FacesSpin.SetBuddy(&m_Faces);

	iBlockSel = -1;
	iMarkerSel = -1;
	m_iLastTool = -1;

	LoadBlockCategories();

	// outta here
	return TRUE;
}


//-----------------------------------------------------------------------------
// Purpose: Load the category list with the list of primitives and object libraries.
//-----------------------------------------------------------------------------
void CObjectBar::LoadBlockCategories( void )
{
	m_CategoryList.SetRedraw(FALSE);

	// first item is the primitive list
	m_CategoryList.ResetContent();
	m_CategoryList.AddString("Primitives");

	// the next items are the prefab categories (libraries)
	LoadPrefabCategories();

	// redraw category list
	m_CategoryList.SetRedraw(TRUE);
	m_CategoryList.Invalidate();

	// set initial state
	m_CategoryList.SetCurSel( 0 );
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CObjectBar::LoadEntityCategories( void )
{
	m_CategoryList.SetRedraw( FALSE );

	// first item is the primitive list
	m_CategoryList.ResetContent();
	m_CategoryList.AddString( "Entities" );

	// the next items are the prefab categories (libraries)
	LoadPrefabCategories();

	// redraw category list
	m_CategoryList.SetRedraw( TRUE );
	m_CategoryList.Invalidate();

	// set initial state
	m_CategoryList.SetCurSel( 0 );
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CObjectBar::LoadPrefabCategories( void )
{
	//
	// if a long list -- don't update every time
	//
	m_CategoryList.SetRedraw( FALSE );

	//
	// add all prefab object libraries to the category list
	//
	POSITION p = ENUM_START;
	CPrefabLibrary *pLibrary = CPrefabLibrary::EnumLibraries( p );
	while( pLibrary )
	{
		int iIndex = m_CategoryList.AddString( pLibrary->GetName() );
		m_CategoryList.SetItemData( iIndex, pLibrary->GetID() );
		pLibrary = CPrefabLibrary::EnumLibraries( p );
	}

	m_CategoryList.SetRedraw(TRUE);
	m_CategoryList.Invalidate();
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CObjectBar::LoadBlockItems( void )
{
	//
	// verify the block categories are loaded
	//
	if( m_CategoryList.GetCurSel() == CB_ERR )
	{
		LoadBlockCategories();
	}

	// clear the item list
	m_CreateList.ResetContent();

	//
	// load primitive items
	//
	if( m_CategoryList.GetCurSel() == 0 )
	{
		// don't refresh the list until we are done (potentially many items)
		m_CreateList.SetRedraw( FALSE );

		for( int i = 0; i < sizeof( SolidTypes ) / sizeof( SolidTypes[0] ); i++)
		{
			int nIndex = m_CreateList.AddString( SolidTypes[i].pszName );
			m_CreateList.SetItemData( nIndex, i );
		}
		
		// set list type (primitives)
		ListType = listPrimitives;

		m_CreateList.SetRedraw( TRUE );
		m_CreateList.Invalidate();

	}
	else
	{
		LoadPrefabItems();
	}
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CObjectBar::LoadEntityItems( void )
{
	extern GameData *pGD;

	//
	// verify the block categories are loaded
	//
	if( m_CategoryList.GetCurSel() == CB_ERR )
	{
		LoadEntityCategories();
	}

	// clear the item list
	m_CreateList.ResetContent();

	//
	// load entity items
	//
	if( m_CategoryList.GetCurSel() == 0 )
	{
		// don't refresh the list until we are done (potentially many items)
		m_CreateList.SetRedraw( FALSE );

		if( pGD != NULL )
		{
			POSITION p = pGD->Classes.GetHeadPosition();
			while( p )
			{
				GDclass *pc = pGD->Classes.GetNext( p );
				if( !pc->IsBaseClass() && !pc->IsSolidClass() )
				{
					m_CreateList.AddString( pc->GetName() );
				}
			}
		}

		// set list type (markers)???
		ListType = listMarkers;

		m_CreateList.SetRedraw( TRUE );
		m_CreateList.Invalidate();
	}
	else
	{
		LoadPrefabItems();
	}
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CObjectBar::LoadPrefabItems( void )
{
	// don't refresh the list until we are done (potentially many items)
	m_CreateList.SetRedraw( FALSE );

	// get the active library and add the prefabs from it
	CPrefabLibrary *pLibrary = CPrefabLibrary::FindID( m_CategoryList.GetItemData(m_CategoryList.GetCurSel() ) );
	
	POSITION p = ENUM_START;
	CPrefab *pPrefab = pLibrary->EnumPrefabs( p );
	while( pPrefab )
	{
		int iIndex = m_CreateList.AddString( pPrefab->GetName() );
		m_CreateList.SetItemData( iIndex, pPrefab->GetID() );
		pPrefab = pLibrary->EnumPrefabs( p );
	}

	// set list type (prefabs)
	ListType = listPrefabs;

	m_CreateList.SetRedraw( TRUE );
	m_CreateList.Invalidate();
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CObjectBar::DoHideControls()
{
	// hide controls based on which mode is selected...
	if(ListType == listPrimitives)
	{
		GetDlgItem(ID_INSERTPREFAB_ORIGINAL)->ShowWindow(SW_HIDE);
		m_Faces.ShowWindow(SW_SHOW);
		m_FacesSpin.ShowWindow(SW_SHOW);
		GetDlgItem(IDC_FACESPROMPT)->ShowWindow(SW_SHOW);
	}
	else if(ListType == listPrefabs)
	{
		m_Faces.ShowWindow(SW_HIDE);
		m_FacesSpin.ShowWindow(SW_HIDE);
		GetDlgItem(IDC_FACESPROMPT)->ShowWindow(SW_HIDE);
		GetDlgItem(ID_INSERTPREFAB_ORIGINAL)->ShowWindow(SW_SHOW);
	}
	else if(ListType == listMarkers)
	{
		m_Faces.ShowWindow(SW_HIDE);
		m_FacesSpin.ShowWindow(SW_HIDE);
		GetDlgItem(IDC_FACESPROMPT)->ShowWindow(SW_HIDE);
		GetDlgItem(ID_INSERTPREFAB_ORIGINAL)->ShowWindow(SW_HIDE);
	}
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *pCmdUI - 
//-----------------------------------------------------------------------------
void CObjectBar::UpdateControl(CCmdUI *pCmdUI)
{
	switch (pCmdUI->m_nID)
	{
		case ID_INSERTPREFAB_ORIGINAL:
		{
			pCmdUI->Enable(ListType == listPrefabs);
			break;
		}

		default:
		{
			pCmdUI->Enable(CMapDoc::GetActiveMapDoc() ? TRUE : FALSE);
			break;
		}
	}
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *pWnd - 
//			bModifyWnd - 
// Output : Returns TRUE on success, FALSE on failure.
//-----------------------------------------------------------------------------
BOOL CObjectBar::EnableFaceControl(CWnd *pWnd, BOOL bModifyWnd)
{
	BOOL bEnable = CMapDoc::GetActiveMapDoc() ? TRUE : FALSE;

	if(bEnable)
	{
		bEnable = FALSE;

		//
		// Enable the control only if we are dealing with an object the
		// that has adjustable faces.
		//
		if (ListType == listPrimitives)
		{
			int nSolidIndex = m_CreateList.GetItemData(iBlockSel);
			if (SolidTypes[nSolidIndex].bEnableFaceControl)
			{
				bEnable = TRUE;
			}
		}
	}

	if(bModifyWnd)
		pWnd->EnableWindow(bEnable);

	return bEnable;
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *pCmdUI - 
//-----------------------------------------------------------------------------
void CObjectBar::UpdateFaceControl(CCmdUI *pCmdUI)
{
	pCmdUI->Enable(EnableFaceControl(GetDlgItem(pCmdUI->m_nID), FALSE));
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CObjectBar::OnCreatelistSelchange()
{
	//
	// get the current selection
	//
	int iSel = m_CreateList.GetCurSel();
	if( iSel == LB_ERR )
		return;

	_iNewObjIndex = iSel;
	char szBuf[128];

	switch(ListType)
	{
	case listPrimitives:
		{
			//
			// Save current value from the faces edit control. The next time this primitive is
			// selected the value will be restored.
			//
			if (iBlockSel != -1)
			{
				int nSolidIndex = m_CreateList.GetItemData(iBlockSel);
				m_Faces.GetWindowText(szBuf, 128);
				SolidTypes[nSolidIndex].nFaces = atoi(szBuf);
			}
			iBlockSel = _iNewObjIndex;
			break;
		}
	case listPrefabs:
		{
			if( ( m_iLastTool == TOOL_POINTER ) || ( m_iLastTool == TOOL_BLOCK ) )
			{
				iBlockSel = _iNewObjIndex;
			}
			else if( m_iLastTool == TOOL_ENTITY )
			{
				iMarkerSel = _iNewObjIndex;
			}
			break;
		}
	case listMarkers:
		{
			iMarkerSel = _iNewObjIndex;
			m_CreateList.GetLBText(iMarkerSel, _szNewObjName);
			break;
		}
	}

	if(ListType != listPrimitives)
		return;

	EnableFaceControl(&m_Faces, TRUE);
	EnableFaceControl(&m_FacesSpin, TRUE);

	int nSolidIndex = m_CreateList.GetItemData(iSel);

	m_FacesSpin.SetRange(SolidTypes[nSolidIndex].nFacesMin, SolidTypes[nSolidIndex].nFacesMax);
	m_FacesSpin.SetPos(SolidTypes[nSolidIndex].nFaces);
	
	itoa(SolidTypes[nSolidIndex].nFaces, szBuf, 10);
	m_Faces.SetWindowText(szBuf);
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : dwGameID - 
//			piNewIndex - 
// Output : 
//-----------------------------------------------------------------------------
int CObjectBar::GetPrevSelIndex(DWORD dwGameID, int *piNewIndex)
{
	for(int i = 0; i < MAX_PREV_SEL; i++)
	{
		if(m_PrevSel[i].dwGameID == 0 && piNewIndex)
			*piNewIndex = i;

		if(m_PrevSel[i].dwGameID == dwGameID)
			return i;
	}

	return -1;
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pMsg - 
// Output : Returns TRUE on success, FALSE on failure.
//-----------------------------------------------------------------------------
BOOL CObjectBar::PreTranslateMessage(MSG* pMsg) 
{
	//
	// See if the message is a keydown and the current focus window is the 
	//  ComboBox in the ObjectBar!
	//
	/*static BOOL bRecurse = FALSE;

	if (pMsg->message == WM_KEYDOWN && !bRecurse)
	{
		if (GetFocus() == &m_CreateList)
		{
			//AfxMessageBox("Ok");
			bRecurse = TRUE;
			m_CreateList.SendMessage(WM_CHAR, pMsg->wParam, pMsg->lParam);
			bRecurse = FALSE;
			return TRUE;
		}
	}
	*/
	return CWorldcraftBar::PreTranslateMessage(pMsg);
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : iTool - 
//-----------------------------------------------------------------------------
void CObjectBar::UpdateListForTool( int iTool )
{
	//
	// initialize for new "game config"
	//
	int iPrevSel;
	if( m_dwPrevGameID != g_pGameConfig->dwID )
	{
		//
		// save current game id and save
		//
		m_dwPrevGameID = g_pGameConfig->dwID;
		GetPrevSelIndex( g_pGameConfig->dwID, &iPrevSel );
		m_PrevSel[iPrevSel].dwGameID = g_pGameConfig->dwID;

		m_PrevSel[iPrevSel].block.strCategory = "Primitives";
		m_PrevSel[iPrevSel].block.strItem = "block";

		m_PrevSel[iPrevSel].entity.strCategory = "Entities";
		m_PrevSel[iPrevSel].entity.strItem = g_pGameConfig->szDefaultPoint;
	}
	
	// get game id previously selected data index
	iPrevSel = GetPrevSelIndex( m_dwPrevGameID );
	if( iPrevSel == -1 )
		return;

	//
	// save last known selection state for previous tool
	//
	switch( m_iLastTool )
	{
	case TOOL_POINTER:
	case TOOL_BLOCK:
		{
			int iCategory = m_CategoryList.GetCurSel();
			if( iCategory != -1 )
			{
				m_CategoryList.GetLBText( iCategory, m_PrevSel[iPrevSel].block.strCategory );
				if( ( iBlockSel != -1 ) && ( iBlockSel < m_CreateList.GetCount() ) )
				{
					m_CreateList.GetLBText( iBlockSel, m_PrevSel[iPrevSel].block.strItem );
				}
				else
				{
					m_PrevSel[iPrevSel].block.strItem = "";
				}
			}
			else
			{
				m_PrevSel[iPrevSel].block.strCategory = "";
				m_PrevSel[iPrevSel].block.strItem = "";
			}

			break;
		}
	case TOOL_ENTITY:
		{
			int iCategory = m_CategoryList.GetCurSel();
			if( iCategory != -1 )
			{
				m_CategoryList.GetLBText( iCategory, m_PrevSel[iPrevSel].entity.strCategory );
				if( ( iMarkerSel != -1 ) && ( iMarkerSel < m_CreateList.GetCount() ) )
				{
					m_CreateList.GetLBText( iMarkerSel, m_PrevSel[iPrevSel].entity.strItem );
				}
				else
				{
					m_PrevSel[iPrevSel].entity.strItem = "";
				}
			}
			else
			{
				m_PrevSel[iPrevSel].entity.strCategory = "";
				m_PrevSel[iPrevSel].entity.strItem = "";
			}

			break;
		}
	default:
		{
			break;
		}
	}

	// save tool for next pass
	m_iLastTool = iTool;

	//
	// update new for new tool
	//
	if( iTool == TOOL_BLOCK || iTool == TOOL_POINTER )
	{
		//
		// load block categories and items
		//
		LoadBlockCategories();
		m_CategoryList.SelectString( -1, m_PrevSel[iPrevSel].block.strCategory );
		LoadBlockItems();		
		iBlockSel = m_CreateList.SelectString( -1, m_PrevSel[iPrevSel].block.strItem );

		// update the selection list
		OnCreatelistSelchange();
		
		// hide/show appropriate controls
		DoHideControls();

		//
		// enable/disable face controls
		//
		EnableFaceControl( &m_Faces, TRUE );
		EnableFaceControl( &m_FacesSpin, TRUE );
	}
	else if( iTool == TOOL_ENTITY )
	{
		//
		// load entity categories and items
		//
		LoadEntityCategories();
		m_CategoryList.SelectString( -1, m_PrevSel[iPrevSel].entity.strCategory );
		LoadEntityItems();
		iMarkerSel = m_CreateList.SelectString( -1, m_PrevSel[iPrevSel].entity.strItem );

		// update the selection list
		OnCreatelistSelchange();
		
		// hide/show appropriate controls
		DoHideControls();

		//
		// enable/disable face controls
		//
		EnableFaceControl( &m_Faces, TRUE );
		EnableFaceControl( &m_FacesSpin, TRUE );
	}
	else
	{
		m_CategoryList.ResetContent();
		m_CreateList.ResetContent();
		OnCreatelistSelchange();
		DoHideControls();
	}
}
