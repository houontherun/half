/*----------------------------------------------------------------------
Copyright (c) 1998 Russell Freeman. All Rights Reserved.
Please see the file "licence.txt" for licencing details.
Email: russf@gipsysoft.com
Web site: http://www.gipsysoft.com

This notice must remain intact.
This file belongs wholly to Russell Freeman, 
You may use this file compiled in your applications.
You may not sell this file in source form.
This source code may not be distributed as part of a library,

This file is provided 'as is' with no expressed or implied warranty.
The author accepts no liability if it causes any damage to your
computer.

Please use and enjoy. Please let me know of any bugs/mods/improvements 
that you have found/implemented and I will fix/incorporate them into this
file.


File:	ApiFailure.cpp
Owner:	russf@gipsysoft.com
Purpose:	API Verify Failure message box, if an API function fails then
					this will display a message box with the filename of the source
					file, the line number, the expression that failed and the result of
					GetLastError(...)
----------------------------------------------------------------------*/
#include "stdafx.h"
#include <WinHelper.h>
#include <DebugHlp.h>
#include <crtdbg.h> 
#include <signal.h> 

BOOL _cdecl ApiFailure( LPCSTR pcszFilename, int nLine, LPCSTR pcszExpression )
{
	const DWORD dwLastError = ::GetLastError();
	LPCTSTR lpMsgBuf;
	(void)::FormatMessage( FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS, NULL, dwLastError, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), (LPTSTR) &lpMsgBuf, 0, NULL );

	char szExeName[ MAX_PATH ];
  if( !GetModuleFileName( NULL, szExeName, countof( szExeName ) ) )
		strcpy( szExeName, "<No Program Name>" );


	char szMessage[ 1024 ];
  _snprintf( szMessage, countof( szMessage )
						, "API VERIFY Failure!"
							"\nProgram: %s"
							"\n"
							"\nFile %s"
							"\nLine %d"
							"\n"
							"\nExpression %s"
							"\n"
							"\nLast Error %d"
							"\n           %s"
							"\n\nPress Retry to debug the application"
						, szExeName
						, pcszFilename
						, nLine
						, pcszExpression
						, dwLastError
						, lpMsgBuf
						);

	(void)LocalFree( (LPVOID)lpMsgBuf );
	HWND hwndParent = ::GetActiveWindow();
	hwndParent = ::GetLastActivePopup( hwndParent );
  int nCode = ::MessageBoxA( hwndParent, szMessage, "Debug Helper", MB_TASKMODAL | MB_ICONHAND | MB_ABORTRETRYIGNORE | MB_SETFOREGROUND );

  if( nCode == IDABORT )
  {
		exit( nCode );
  }

  if( nCode == IDRETRY )
		return 1;

	return FALSE;
}