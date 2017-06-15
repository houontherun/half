//====== Copyright � 1996-2003, Valve Corporation, All rights reserved. =======
//
// Purpose: 
//
//=============================================================================
#define PROTECTED_THINGS_DISABLE
#undef PROTECT_FILEIO_FUNCTIONS
#undef fopen
#include <windows.h>
#include "basetypes.h"

#include "utlvector.h"
#include "utlsymbol.h"
#include "utldict.h"
#include "utlbuffer.h"

#include "bugreporter/bugreporter.h"
#include "trktool.h"
#include "filesystem_tools.h"
#include "keyvalues.h"

#define SCR_TYPE 1

#define TRACKER_SETTINGS	"resource/bugreporter.res"
#define TRACKER_LOGIN		"cfg/bugreporter_login.res"

#define DEFAULT_DBMS		"dbsone"
#define DEFAULT_PROJECT		"hl2/tf2"
#define DEFAULT_USERNAME	""
#define DEFAULT_PASSWORD	DEFAULT_USERNAME

class CBug
{
public:
	CBug()
	{
		Clear();
	}

	void Clear()
	{
		Q_memset( title, 0, sizeof( title ) );
		Q_memset( desc, 0, sizeof( desc ) );
		Q_memset( submitter, 0, sizeof( submitter ) );
		Q_memset( owner, 0, sizeof( owner ) );
		Q_memset( severity, 0, sizeof( severity ) );
		Q_memset( priority, 0, sizeof( priority ) );
		Q_memset( area, 0, sizeof( area ) );
		Q_memset( reporttype, 0, sizeof( reporttype ) );
		Q_memset( level, 0, sizeof( level ) );
		Q_memset( build, 0, sizeof( build ) );
		Q_memset( position, 0, sizeof( position ) );
		Q_memset( orientation, 0, sizeof( orientation ) );
		Q_memset( screenshot_unc, 0, sizeof( screenshot_unc ) );
		Q_memset( savegame_unc, 0, sizeof( savegame_unc ) );
		Q_memset( bsp_unc, 0, sizeof( bsp_unc ) );
		Q_memset( vmf_unc, 0, sizeof( vmf_unc ) );
	}

	char			title[ 256 ];
	char			desc[ 8192 ];
	char			owner[ 256 ];
	char			submitter[ 256 ];
	char			severity[ 256 ];
	char			priority[ 256 ];
	char			area[ 256 ];
	char			reporttype[ 256 ];
	char			level[ 256 ];
	char			build[ 256 ];
	char			position[ 256 ];
	char			orientation[ 256 ];
	char			screenshot_unc[ 256 ];
	char			savegame_unc[ 256 ];
	char			bsp_unc[ 256 ];
	char			vmf_unc[ 256 ];
};

class CBugReporter : public IBugReporter
{
public:

	CBugReporter();
	virtual ~CBugReporter();

	// Initialize and login with default username/password for this computer (from resource/bugreporter.res)
	virtual bool		Init();
	virtual void		Shutdown();

	virtual char const	*GetUserName();
	virtual char const	*GetUserName_Display();

	virtual int			GetNameCount();
	virtual char const	*GetName( int index );

	virtual int			GetDisplayNameCount();
	virtual char const  *GetDisplayName( int index );

	virtual char const	*GetDisplayNameForUserName( char const *username );
	virtual char const  *GetUserNameForDisplayName( char const *display );

	virtual int			GetSeverityCount();
	virtual char const	*GetSeverity( int index );

	virtual int			GetPriorityCount();
	virtual char const	*GetPriority( int index );

	virtual int			GetAreaCount();
	virtual char const	*GetArea( int index );

	virtual int			GetReportTypeCount();
	virtual char const	*GetReportType( int index );

// Submission API
	virtual void		StartNewBugReport();
	virtual void		CancelNewBugReport();
	virtual bool		CommitBugReport( int& bugSubmissionId );

	virtual void		SetTitle( char const *title );
	virtual void		SetDescription( char const *description );

	// NULL for current user
	virtual void		SetSubmitter( char const *username = 0 );
	virtual void		SetOwner( char const *username );
	virtual void		SetSeverity( char const *severity );
	virtual void		SetPriority( char const *priority );
	virtual void		SetArea( char const *area );
	virtual void		SetReportType( char const *reporttype );

	virtual void		SetLevel( char const *levelnamne );
	virtual void		SetPosition( char const *position );
	virtual void		SetOrientation( char const *pitch_yaw_roll );
	virtual void		SetBuildNumber( char const *build_num );

	virtual void		SetScreenShot( char const *screenshot_unc_address );
	virtual void		SetSaveGame( char const *savegame_unc_address );

	virtual void		SetBSPName( char const *bsp_unc_address );
	virtual void		SetVMFName( char const *vmf_unc_address );

private:

	void				ReportError(TRK_UINT rc, char const *func, char const *msg );
	TRK_UINT			Login(TRK_HANDLE* pTrkHandle);
	bool				PopulateLists();

	bool				PopulateChoiceList( char const *listname, CUtlVector< CUtlSymbol >& list );

	CUtlSymbolTable				m_BugStrings;

	CUtlVector< CUtlSymbol >	m_Severity;
	CUtlVector< CUtlSymbol >	m_Names;
	CUtlVector< CUtlSymbol >	m_SortedDisplayNames;
	CUtlDict< CUtlSymbol, int >		m_InternalNameMapping;
	CUtlVector< CUtlSymbol >	m_Priority;
	CUtlVector< CUtlSymbol >	m_Area;
	CUtlVector< CUtlSymbol >	m_ReportType;

	TRK_HANDLE					trkHandle;
	TRK_RECORD_HANDLE			trkRecHandle;

	CUtlSymbol					m_UserName;

	CBug				*m_pBug;
};

CBugReporter::CBugReporter()
{
	m_pBug = NULL;

	trkHandle		= (TRK_HANDLE)0;
	trkRecHandle	= (TRK_RECORD_HANDLE)0;
}

CBugReporter::~CBugReporter()
{
	m_BugStrings.RemoveAll();
	m_Severity.Purge();
	m_Names.Purge();
	m_SortedDisplayNames.Purge();
	m_InternalNameMapping.Purge();
	m_Priority.Purge();
	m_Area.Purge();
	m_ReportType.Purge();

	delete m_pBug;
}

void CBugReporter::ReportError(TRK_UINT rc, char const *func, char const *msg )
{
    if ( rc != TRK_SUCCESS )
	{
		switch (rc)
		{
		case TRK_E_ITEM_NOT_FOUND:
		    Msg( "%s %s was not found!\n", func,  msg );
			break;
		case TRK_E_INVALID_FIELD:
			Msg( "%s %s Invalid field!\n", func,  msg );
			break;
		default:
			Msg( "%s returned %i!\n", func,  rc );
			break;
		}
    }
}

TRK_UINT CBugReporter::Login(TRK_HANDLE* pTrkHandle)
{
	char dbms[50] = DEFAULT_DBMS;
	char proj[50] = DEFAULT_PROJECT;

	char username[ 50 ];
	char password[ 50 ];

	GetPrivateProfileStringA( 
		"login", 
		"userid1",
		DEFAULT_USERNAME, // default
		username,
		sizeof( username ),
		"PVCSTRK.ini" );

	Q_strncpy( password, username, sizeof( password ) );

	KeyValues *kv = new KeyValues( "tracker_login" );
	Assert( kv );
	if ( kv )
	{
		if ( kv->LoadFromFile( g_pFileSystem, TRACKER_SETTINGS ) )
		{
			Q_strncpy( dbms, kv->GetString( "database_server", DEFAULT_DBMS ), sizeof( dbms ) );
			Q_strncpy( proj, kv->GetString( "project_name", DEFAULT_PROJECT ), sizeof( proj ) );
		}

		kv->Clear();

		// Load optional login info
		if ( g_pFileSystem->FileExists( TRACKER_LOGIN, "GAME" ) )
		{
			if ( kv->LoadFromFile( g_pFileSystem, TRACKER_LOGIN ) )
			{
				Q_strncpy( username, kv->GetString( "username", username ), sizeof( username ) );
				Q_strncpy( password, kv->GetString( "password", password ), sizeof( password ) );
			}
		}

		kv->deleteThis();
	}


	m_UserName = m_BugStrings.AddString( username );

	TRK_UINT rc = TrkProjectLogin(*pTrkHandle,
		username,
		password,
		proj,
		NULL,
		NULL,
		NULL,
		NULL,
		TRK_USE_INI_FILE_DBMS_LOGIN);

	if (rc != TRK_SUCCESS)
	{
		rc = TrkProjectLogin(*pTrkHandle,
			username,
			"",
			proj,
			NULL,
			NULL,
			NULL,
			NULL,
			TRK_USE_INI_FILE_DBMS_LOGIN);
		if (rc != TRK_SUCCESS)
		{
			Msg("Bug reporter failed: Your tracker password must be your user name or blank.\n");
			return rc;
		}
	}

	TrkGetLoginDBMSName(*pTrkHandle, sizeof(dbms), dbms );
	TrkGetLoginProjectName(*pTrkHandle, sizeof(proj), proj );
	
	Msg( "Project:  %s\n", proj );
	Msg( "Server:  %s\n", dbms );

	return rc;
}

//-----------------------------------------------------------------------------
// Purpose: Initialize and login with default username/password for this computer (from resource/bugreporter.res)
// Output : Returns true on success, false on failure.
//-----------------------------------------------------------------------------
bool CBugReporter::Init()
{
	FileSystem_Init( true );
	//filesystem = (IFileSystem *)(FileSystem_GetFactory()( FILESYSTEM_INTERFACE_VERSION, NULL ));
	//if ( !filesystem )
	//{
		//AssertMsg( 0, "Failed to create/get IFileSystem" );
		//return false;
	//}

	TRK_UINT			rc;
		rc = TrkHandleAlloc( TRK_VERSION_ID, &trkHandle);
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkHandleAlloc", "Failed to Allocate Tracker Handle!");
		return false;
	}

	// Login to default project out of INI file.
	rc = Login( &trkHandle );
	if (rc != TRK_SUCCESS)
	{
		return false;
	}

	rc = TrkRecordHandleAlloc(trkHandle, &trkRecHandle);
	if (rc != TRK_SUCCESS)
	{
		ReportError(rc, "TrkRecordHandleAlloc", 
			"Failed to Allocate Tracker Record Handle!");
		return false;
	}

	PopulateLists();

	return true;
}

void CBugReporter::Shutdown()
{
	TRK_UINT			rc;
	
	if ( trkRecHandle )
	{
		rc = TrkRecordHandleFree(&trkRecHandle);
		if (rc != TRK_SUCCESS)
		{
			ReportError(rc, "TrkRecordHandleFree", "Failed to Free Tracker Record Handle!");
		}
	}

	if ( trkHandle )
	{
		rc = TrkProjectLogout(trkHandle);		
		if (rc != TRK_SUCCESS)
		{
			ReportError(rc, "TrkProjectLogout", "Failed to Logout of Project!");
		}
		else
		{
			rc = TrkHandleFree(&trkHandle);     
			if (rc != TRK_SUCCESS)
			{
				ReportError(rc, "TrkHandleFree", "Failed to Free Tracker Handle!");
			}
		}
	}
}

char const *CBugReporter::GetUserName()
{
	return m_BugStrings.String( m_UserName );
}

char const *CBugReporter::GetUserName_Display()
{
	return GetDisplayNameForUserName( GetUserName() );
}

int CBugReporter::GetNameCount()
{
	return m_Names.Count();
}

char const *CBugReporter::GetName( int index )
{
	if ( index < 0 || index >= m_Names.Count() )
		return "<<Invalid>>";

	return m_BugStrings.String( m_Names[ index ] );
}

int CBugReporter::GetDisplayNameCount()
{
	return m_SortedDisplayNames.Count();
}

char const *CBugReporter::GetDisplayName( int index )
{
	if ( index < 0 || index >= (int)m_SortedDisplayNames.Count() )
		return "<<Invalid>>";

	return m_BugStrings.String( m_SortedDisplayNames[ index ] ); 
}

char const *CBugReporter::GetDisplayNameForUserName( char const *username )
{
	int c = GetDisplayNameCount();
	for ( int i = 0; i < c ; i++ )
	{
		CUtlSymbol sym = m_InternalNameMapping[ i ];
		char const *testname = m_BugStrings.String( sym );
		if ( !Q_stricmp( testname, username ) )
		{
			return m_InternalNameMapping.GetElementName( i );
		}
	}

	return "<<Invalid>>";
}

char const *CBugReporter::GetUserNameForDisplayName( char const *display )
{
	int idx = m_InternalNameMapping.Find( display );
	if ( idx == m_InternalNameMapping.InvalidIndex() )
		return "<<Invalid>>";

	CUtlSymbol sym;
	sym = m_InternalNameMapping[ idx ];
	return m_BugStrings.String( sym );
}

int CBugReporter::GetSeverityCount()
{
	return m_Severity.Count() ;
}

char const *CBugReporter::GetSeverity( int index )
{
	if ( index < 0 || index >= m_Severity.Count() )
		return "<<Invalid>>";

	return m_BugStrings.String( m_Severity[ index ] );
}

int CBugReporter::GetPriorityCount()
{
	return m_Priority.Count();
}

char const *CBugReporter::GetPriority( int index )
{
	if ( index < 0 || index >= m_Priority.Count() )
		return "<<Invalid>>";

	return m_BugStrings.String( m_Priority[ index ] );
}

int CBugReporter::GetAreaCount()
{
	return m_Area.Count();
}

char const *CBugReporter::GetArea( int index )
{
	if ( index < 0 || index >= m_Area.Count() )
		return "<<Invalid>>";

	return m_BugStrings.String( m_Area[ index ] );
}

int CBugReporter::GetReportTypeCount()
{
	return m_ReportType.Count();
}

char const *CBugReporter::GetReportType( int index )
{
	if ( index < 0 || index >= m_ReportType.Count() )
		return "<<Invalid>>";

	return m_BugStrings.String( m_ReportType[ index ] );
}

void CBugReporter::StartNewBugReport()
{
	if ( !m_pBug )
	{
		m_pBug = new CBug();
	}
	else
	{
		m_pBug->Clear();
	}
}

void CBugReporter::CancelNewBugReport()
{
	if ( !m_pBug )
		return;

	m_pBug->Clear();
}

bool CBugReporter::CommitBugReport( int& bugSubmissionId )
{
	bugSubmissionId = -1;

	if ( !m_pBug )
		return false;

	TRK_UINT rc = 0;
	rc = TrkNewRecordBegin( trkRecHandle, SCR_TYPE );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkNewRecordBegin", 
			"Failed to TrkNewRecordBegin!");
		return false;
	}

	// Populate fields
	rc = TrkSetStringFieldValue( trkRecHandle,
		"Title",
		m_pBug->title );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkSetStringFieldValue", 
			"Failed to add title!");
		return false;
	}
	rc = TrkSetStringFieldValue( trkRecHandle,
		"Submitter",
		m_pBug->submitter );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkSetStringFieldValue", 
			"Failed to set submitter!");
		return false;
	}
	rc = TrkSetStringFieldValue( trkRecHandle,
		"Owner",
		m_pBug->owner );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkSetStringFieldValue", 
			"Failed to set owner!");
		return false;
	}
	rc = TrkSetStringFieldValue( trkRecHandle,
		"Severity",
		m_pBug->severity );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkSetStringFieldValue", 
			"Failed to set severity!");
		//return false;
	}
	rc = TrkSetStringFieldValue( trkRecHandle,
		"Report Type",
		m_pBug->reporttype );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkSetStringFieldValue", 
			"Failed to set report type!");
		//return false;
	}
	rc = TrkSetStringFieldValue( trkRecHandle,
		"Priority",
		m_pBug->priority );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkSetStringFieldValue", 
			"Failed to set priority!");
		//return false;
	}
	rc = TrkSetStringFieldValue( trkRecHandle,
		"Area",
		m_pBug->area );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkSetStringFieldValue", 
			"Failed to set area!");
		//return false;
	}

	CUtlBuffer buf( 0, 0, true );

	buf.Printf( "level:  %s\nbuild:  %s\nposition:  setpos %s\norientation:  setang %s\n",
		m_pBug->level,
		m_pBug->build,
		m_pBug->position,
		m_pBug->orientation );

	if ( m_pBug->screenshot_unc[ 0 ] )
	{
		buf.Printf( "screenshot:  %s\n", m_pBug->screenshot_unc );
	}
	if ( m_pBug->savegame_unc[ 0 ] )
	{
		buf.Printf( "savegame:  %s\n", m_pBug->savegame_unc );
	}
	if ( m_pBug->bsp_unc[ 0 ] )
	{
		buf.Printf( "bsp:  %s\n", m_pBug->bsp_unc );
	}
	if ( m_pBug->vmf_unc[ 0 ] )
	{
		buf.Printf( "vmf:  %s\n", m_pBug->vmf_unc );
	}

	buf.Printf( "\n\n%s\n", m_pBug->desc );
	buf.PutChar( 0 );

	rc = TrkSetDescriptionData( trkRecHandle,
		buf.TellPut(),
		(const char * )buf.Base(),
		0 );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkSetDescriptionData", 
			"Failed to set description data!");
		return false;
	}

	TRK_TRANSACTION_ID id;
	rc = TrkNewRecordCommit( trkRecHandle, &id );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkNewRecordCommit", 
			"Failed to TrkNewRecordCommit!");
		return false;
	}

	TRK_UINT bugId;
	rc = TrkGetNumericFieldValue( trkRecHandle, "Id", &bugId );
	if ( rc != TRK_SUCCESS )
	{
		ReportError(rc, "TrkGetNumericFieldValue", 
			"Failed to TrkGetNumericFieldValue for bug Id #!");
	}
	else
	{
		bugSubmissionId = (int)bugId;
	}

	m_pBug->Clear();

	return true;
}

void CBugReporter::SetTitle( char const *title )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->title, title, sizeof( m_pBug->title ) );
}

void CBugReporter::SetDescription( char const *description )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->desc, description, sizeof( m_pBug->desc ) );
}

void CBugReporter::SetSubmitter( char const *username /*= 0*/ )
{
	if ( !username )
	{
		username = GetUserName();
	}

	Assert( m_pBug );
	Q_strncpy( m_pBug->submitter, username, sizeof( m_pBug->submitter ) );
}

void CBugReporter::SetOwner( char const *username )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->owner, username, sizeof( m_pBug->owner ) );
}

void CBugReporter::SetSeverity( char const *severity )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->severity, severity, sizeof( m_pBug->severity ) );
}

void CBugReporter::SetPriority( char const *priority )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->priority, priority, sizeof( m_pBug->priority ) );
}

void CBugReporter::SetArea( char const *area )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->area, area, sizeof( m_pBug->area ) );
}

void CBugReporter::SetReportType( char const *reporttype )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->reporttype, reporttype, sizeof( m_pBug->reporttype ) );
}

void CBugReporter::SetLevel( char const *levelnamne )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->level, levelnamne, sizeof( m_pBug->level ) );
}

void CBugReporter::SetPosition( char const *position )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->position, position, sizeof( m_pBug->position ) );
}

void CBugReporter::SetOrientation( char const *pitch_yaw_roll )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->orientation, pitch_yaw_roll, sizeof( m_pBug->orientation ) );
}

void CBugReporter::SetBuildNumber( char const *build_num )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->build, build_num, sizeof( m_pBug->build ) );
}

void CBugReporter::SetScreenShot( char const *screenshot_unc_address )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->screenshot_unc, screenshot_unc_address, sizeof( m_pBug->screenshot_unc ) );
}

void CBugReporter::SetSaveGame( char const *savegame_unc_address )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->savegame_unc, savegame_unc_address, sizeof( m_pBug->savegame_unc ) );
}

void CBugReporter::SetBSPName( char const *bsp_unc_address )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->bsp_unc, bsp_unc_address, sizeof( m_pBug->bsp_unc ) );
}

void CBugReporter::SetVMFName( char const *vmf_unc_address )
{
	Assert( m_pBug );
	Q_strncpy( m_pBug->vmf_unc, vmf_unc_address, sizeof( m_pBug->vmf_unc ) );
}

bool CBugReporter::PopulateChoiceList( char const *listname, CUtlVector< CUtlSymbol >& list )
{
	TRK_UINT rc;

	rc = TrkInitChoiceList( trkHandle, listname, SCR_TYPE );
	if ( TRK_SUCCESS != rc )
	{
		ReportError( rc, "TrkInitChoiceList", listname );
		return false;
	}
	else
	{
		char sz[ 256 ];

		while ( TrkGetNextChoice( trkHandle, sizeof( sz ), sz ) != TRK_E_END_OF_LIST )
		{
			CUtlSymbol sym = m_BugStrings.AddString( sz );
			list.AddToTail( sym );
		}
	}

	return true;
}

// owner, not required <<Unassigned>>
// area <<None>>

bool CBugReporter::PopulateLists()
{
	CUtlSymbol unassigned = m_BugStrings.AddString( "<<Unassigned>>" );
	CUtlSymbol none = m_BugStrings.AddString( "<<None>>" );

	m_Area.AddToTail( none );
	m_Names.AddToTail( unassigned );
	m_InternalNameMapping.Insert( "<<Unassigned>>", unassigned );
	m_SortedDisplayNames.AddToTail( unassigned );

	PopulateChoiceList( "Severity", m_Severity );
	PopulateChoiceList( "Report Type", m_ReportType );
	PopulateChoiceList( "Area", m_Area );
	PopulateChoiceList( "Priority", m_Priority );

	// Need to gather  names, too
	TRK_UINT rc;

	rc = TrkInitUserList( trkHandle );
	if ( TRK_SUCCESS != rc )
	{
		ReportError( rc, "TrkInitUserList", "Couldn't get userlist" );
		return false;
	}
	else
	{
		char sz[ 256 ];

		while ( TrkGetNextUser( trkHandle, sizeof( sz ), sz ) != TRK_E_END_OF_LIST )
		{
			// Now lookup display name for user
			char displayname[ 256 ];

			rc = TrkGetUserFullName( trkHandle, sz, sizeof( displayname ), displayname );
			if ( TRK_SUCCESS == rc )
			{
				// Fill in lookup table
				CUtlSymbol internal_name_sym = m_BugStrings.AddString( sz );
				CUtlSymbol display_name_sym = m_BugStrings.AddString( displayname );
				
				m_Names.AddToTail( internal_name_sym );
				
				m_InternalNameMapping.Insert( displayname, internal_name_sym );

				m_SortedDisplayNames.AddToTail( display_name_sym );
			}
		}

		// Now sort display names
		int c = m_SortedDisplayNames.Count();
		for ( int i = 1 ; i < c; i++ )
		{
			for ( int j = i + 1; j < c; j++ )
			{
				char const *p1 = m_BugStrings.String( m_SortedDisplayNames[ i ] );
				char const *p2 = m_BugStrings.String( m_SortedDisplayNames[ j ] );

				int cmp = Q_stricmp( p1, p2 );
				if ( cmp > 0 )
				{
					CUtlSymbol t = m_SortedDisplayNames[ i ];
					m_SortedDisplayNames[ i ] =  m_SortedDisplayNames[ j ];
					m_SortedDisplayNames[ j ] = t;
				}
			}
		}
	}

	return true;
}

EXPOSE_SINGLE_INTERFACE( CBugReporter, IBugReporter, INTERFACEVERSION_BUGREPORTER );