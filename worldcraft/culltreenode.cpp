//========= Copyright � 1996-2002, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#include "stdafx.h"
#include "CullTreeNode.h"


// dvs: decide how this code should be organized
bool BoxesIntersect(Vector const &mins1, Vector const &maxs1, Vector const &mins2, Vector const &maxs2);


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CCullTreeNode::CCullTreeNode(void)
{
	m_nChildCount = 0;
	m_nObjectCount = 0;
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CCullTreeNode::~CCullTreeNode(void)
{
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pChild - 
//-----------------------------------------------------------------------------
void CCullTreeNode::AddCullTreeChild(CCullTreeNode *pChild)
{
	m_Children.SetAtGrow(m_nChildCount, pChild);
	m_nChildCount++;
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pChild - 
//-----------------------------------------------------------------------------
void CCullTreeNode::RemoveCullTreeChild(CCullTreeNode *pChild)
{
	m_nChildCount--;
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pObject - 
//-----------------------------------------------------------------------------
void CCullTreeNode::AddCullTreeObject(CMapClass *pObject)
{
	//
	// First make sure the object isn't already in this node.
	//
	int nObjectCount = GetObjectCount();
	for (int nObject = 0; nObject < nObjectCount; nObject++)
	{
		CMapClass *pCurrent = GetCullTreeObject(nObject);
		
		//
		// If it's already here, bail out.
		//
		if (pCurrent == pObject)
		{
			return;
		}
	}

	//
	// Add the object.
	//
	m_Objects.SetAtGrow(m_nObjectCount, pObject);
	m_nObjectCount++;
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pObject - 
//-----------------------------------------------------------------------------
void CCullTreeNode::AddCullTreeObjectRecurse(CMapClass *pObject)
{
	//
	// If the object intersects this node, add it to this node and recurse,
	// testing each of our children in the same fashion.
	//
	Vector ObjMins;
	Vector ObjMaxs;
	pObject->GetCullBox(ObjMins, ObjMaxs);
	if (BoxesIntersect(ObjMins, ObjMaxs, bmins, bmaxs))
	{
		int nChildCount = GetChildCount();
		if (nChildCount != 0)
		{
			// dvs: we should split when appropriate!
			// otherwise the tree becomes less optimal over time.
			for (int nChild = 0; nChild < nChildCount; nChild++)
			{
				CCullTreeNode *pChild = GetCullTreeChild(nChild);
				pChild->AddCullTreeObjectRecurse(pObject);
			}
		}
		else
		{
			AddCullTreeObject(pObject);
		}
	}
}


//-----------------------------------------------------------------------------
// Purpose: Removes all objects from this node.
//-----------------------------------------------------------------------------
void CCullTreeNode::RemoveAllCullTreeObjects(void)
{
	m_nObjectCount = 0;
	m_Objects.RemoveAll();
}


//-----------------------------------------------------------------------------
// Purpose: Removes all objects from this branch of the tree recursively.
//-----------------------------------------------------------------------------
void CCullTreeNode::RemoveAllCullTreeObjectsRecurse(void)
{
	RemoveAllCullTreeObjects();

	int nChildCount = GetChildCount();
	for (int nChild = 0; nChild < nChildCount; nChild++)
	{
		CCullTreeNode *pChild = GetCullTreeChild(nChild);
		pChild->RemoveAllCullTreeObjectsRecurse();
	}
}


//-----------------------------------------------------------------------------
// Purpose: Removes all instances of a given object from this node.
// Input  : pObject - 
//-----------------------------------------------------------------------------
void CCullTreeNode::RemoveCullTreeObject(CMapClass *pObject)
{
	//
	// Remove any occurrences of pObject from the array, packing as we go.
	//
	int nCopyDown = 0;
	int nObjectCount = GetObjectCount();
	for (int i = 0; i < nObjectCount; i++)
	{
		CMapClass *pCurrent = m_Objects.GetAt(i);
		if (pCurrent == pObject)
		{
			nCopyDown++;
		}
		else if (nCopyDown != 0)
		{
			m_Objects.SetAt(i - nCopyDown, pCurrent);
		}
	}

	m_nObjectCount -= nCopyDown;
}


//-----------------------------------------------------------------------------
// Purpose: Removes all instances of a given object from this node.
// Input  : pObject - 
//-----------------------------------------------------------------------------
void CCullTreeNode::RemoveCullTreeObjectRecurse(CMapClass *pObject)
{
	RemoveCullTreeObject(pObject);

	int nChildCount = GetChildCount();
	for (int nChild = 0; nChild < nChildCount; nChild++)
	{
		CCullTreeNode *pChild = GetCullTreeChild(nChild);
		pChild->RemoveCullTreeObjectRecurse(pObject);
	}	
}


//-----------------------------------------------------------------------------
// Purpose: Removes all instances of a given object from this node.
// Input  : pObject - 
//-----------------------------------------------------------------------------
CCullTreeNode *CCullTreeNode::FindCullTreeObjectRecurse(CMapClass *pObject)
{
	int nObjectCount = GetObjectCount();
	for (int i = 0; i < nObjectCount; i++)
	{
		CMapClass *pCurrent = m_Objects.GetAt(i);
		if (pCurrent == pObject)
		{
			return(this);
		}
	}

	int nChildCount = GetChildCount();
	for (int nChild = 0; nChild < nChildCount; nChild++)
	{
		CCullTreeNode *pChild = GetCullTreeChild(nChild);
		CCullTreeNode *pFound = pChild->FindCullTreeObjectRecurse(pObject);
		if (pFound != NULL)
		{
			return(pFound);
		}
	}

	return(NULL);
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pObject - 
//-----------------------------------------------------------------------------
void CCullTreeNode::UpdateCullTreeObject(CMapClass *pObject)
{
	Vector mins;
	Vector maxs;
	pObject->GetCullBox(mins, maxs);

	if (!BoxesIntersect(mins, maxs, bmins, bmaxs))
	{
		RemoveCullTreeObject(pObject);
	}
	else
	{
		AddCullTreeObject(pObject);
	}
}


//-----------------------------------------------------------------------------
// Purpose: Updates the culling tree due to a change in the bounding box of a
//			given object within the tree. The object is added to any leaf nodes
//			that it now intersects, and is removed from any leaf nodes that it
//			no longer intersects.
// Input  : pObject - The object whose bounding box has changed.
//-----------------------------------------------------------------------------
void CCullTreeNode::UpdateCullTreeObjectRecurse(CMapClass *pObject)
{
	int nChildCount = GetChildCount();
	if (nChildCount != 0)
	{
		for (int nChild = 0; nChild < nChildCount; nChild++)
		{
			CCullTreeNode *pChild = GetCullTreeChild(nChild);
			pChild->UpdateCullTreeObjectRecurse(pObject);
		}
	}
	else
	{
		UpdateCullTreeObject(pObject);
	}
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : pObject - The object whose bounding box has changed.
//-----------------------------------------------------------------------------
void CCullTreeNode::UpdateAllCullTreeObjectsRecurse(void)
{
	int nChildCount = GetChildCount();
	if (nChildCount != 0)
	{
		for (int nChild = 0; nChild < nChildCount; nChild++)
		{
			CCullTreeNode *pChild = GetCullTreeChild(nChild);
			pChild->UpdateAllCullTreeObjectsRecurse();
		}
	}
	else
	{
		int nObjectCount = GetObjectCount();
		for (int nObject = 0; nObject < nObjectCount; nObject++)
		{
			CMapClass *pObject = GetCullTreeObject(nObject);

			Vector mins;
			Vector maxs;
			pObject->GetCullBox(mins, maxs);
			if (!BoxesIntersect(mins, maxs, bmins, bmaxs))
			{
				RemoveCullTreeObject(pObject);
			}
		}
	}
}
