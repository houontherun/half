//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: Defines the interface to the Undo system.
//
// $NoKeywords: $
//=============================================================================

#ifndef HISTORY_H
#define HISTORY_H
#pragma once


#include "MapClass.h"	// For CMapObjectList


class CMapClass;
class CMapDoc;
class CHistory;


class CTrackEntry
{
	public:

		enum TrackType_t
		{
			ttNone = -1,
			ttCopy,
			ttDelete,
			ttCreate,
		};

		CTrackEntry();
		CTrackEntry(TrackType_t eType, ...);
		~CTrackEntry();

		void Undo(CHistory *Opposite);
		void DispatchUndoNotify(void);

		inline int GetSize(void) { return(m_nDataSize); }

		bool m_bAutoDestruct;
	
	protected:

		size_t m_nDataSize;

		TrackType_t m_eType;				// What type of event this entry can undo.

		//
		// Based on the event type, one of these structs will be filled out:
		//
		union
		{
			struct
			{
				CMapClass *pCurrent;		// Pointer to the object as it currently exists in the world.
				CMapClass *pKeptObject;		// Pointer to a copy of the object at the time it was kept.
			} m_Copy;

			struct
			{
				CMapClass *pDeleted;		// Pointer to the object that was deleted from the world.
				CMapClass *pKeptParent;		// Pointer to the object's parent at the time of deletion.
			} m_Delete;

			struct
			{
				CMapClass *pCreated;		// Pointer to the object that was created and added to the world.
			} m_Create;
		};

		bool m_bUndone;						// Set to true after this entry is undone.
};


class CHistoryTrack
{
public:
	CHistoryTrack(CHistory *pParent, CMapObjectList *pSelection);
	~CHistoryTrack();

	void Keep(CMapClass *pObject);
	void KeepForDestruction(CMapClass *pObject);
	void KeepNew(CMapClass *pObject);

	void Undo();

	void SetName(LPCTSTR pszName) { if(pszName) strcpy(szName, pszName); }

private:

	BOOL CheckObjectFlag(CMapClass *pObject, int iFlag);

	CArray<CTrackEntry, CTrackEntry&> Data;
	int nData;
	CHistory *Parent;
	DWORD dwID;	// id of this tracker..
	char szName[128];
	CMapObjectList Selected;
	bool m_bAutoDestruct;
	size_t uDataSize;	// approx

friend class CHistory;
};


class CHistory
{
public:
	CHistory();
	~CHistory();

	static void SetHistory(CHistory *pHistory);

	void SetOpposite(BOOL bUndo, CHistory*);
	inline void SetDocument(CMapDoc *pDoc);
	inline CMapDoc *GetDocument(void);

	// mark undo position:
	void MarkUndoPosition(CMapObjectList* pSelection = NULL, LPCTSTR pszName = NULL, BOOL = FALSE);

	//
	// Keep this object so we can undo changes to it:
	//
	void Keep(CMapClass *pObject);
	void Keep(CMapObjectList *pList);

	//
	// Store this pointer for destruction if it cycles off the undo stack:
	//
	void KeepForDestruction(CMapClass *pObject);

	//
	// Store this object for destruction if 'undone':
	//
	void KeepNew(CMapClass *pObject, bool bKeepChildren = true);
	void KeepNew(CMapObjectList *pList, bool bKeepChildren = true);

	void Undo(CMapObjectList *pNewSelection);

	BOOL IsUndoable();	// anything to undo?

	// returns current name
	LPCTSTR GetCurTrackName() { return CurTrack ? CurTrack->szName : ""; }
	
	// total override:
	void SetActive(BOOL bActive);
	BOOL IsActive() { return m_bActive; }

	// temporary shutdown/resume:
	inline void Pause() { bPaused = TRUE; }
	inline void Resume() { if(bPaused == TRUE) bPaused = FALSE; }
	inline BOOL IsPaused() { return bPaused || !IsActive(); }

private:

	CHistoryTrack *CurTrack;
	CTypedPtrList<CPtrList, CHistoryTrack*> Tracks;

	CMapDoc *m_pDoc;			// Associated document.

	// opposite tracker:
	CHistory *Opposite;
	BOOL bUndo;	// is this the undo tracker?

	BOOL bPaused;
	size_t uDataSize;
	BOOL m_bActive;	// veto control

friend class CHistoryTrack;
};


//-----------------------------------------------------------------------------
// Purpose: Sets the document that this undo history belongs to.
//-----------------------------------------------------------------------------
void CHistory::SetDocument(CMapDoc *pDoc)
{
	m_pDoc = pDoc;
}


//-----------------------------------------------------------------------------
// Purpose: Returns the document that this undo history belongs to.
//-----------------------------------------------------------------------------
CMapDoc *CHistory::GetDocument(void)
{
	return(m_pDoc);
}


CHistory *GetHistory();

#endif // HISTORY_H
