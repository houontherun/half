# Microsoft Developer Studio Project File - Name="client" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=client - Win32 Debug CounterStrike
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "client.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "client.mak" CFG="client - Win32 Debug CounterStrike"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "client - Win32 Release TF2" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "client - Win32 Debug TF2" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "client - Win32 Debug HL2" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "client - Win32 Release HL2" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "client - Win32 Release HL1" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "client - Win32 Debug HL1" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "client - Win32 Debug CounterStrike" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "client - Win32 Release CounterStrike" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/Src/client", QWJBAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "cl_dll___Win32_TF2_Release"
# PROP BASE Intermediate_Dir "cl_dll___Win32_TF2_Release"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "cl_dll___Win32_TF2_Release"
# PROP Intermediate_Dir "cl_dll___Win32_TF2_Release"
# PROP Ignore_Export_Lib 1
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Zi /O2 /I "." /I ".." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I ".\tf2_hud\elements" /I "./../dlls/tf2_dll" /I ".\..\common\MaterialSystem" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "VECTOR" /D "CLIENT_DLL" /YX /FD /c
# ADD CPP /nologo /G6 /W4 /GR /Zi /O2 /Ob2 /I ".\tf2_hud" /I "." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../statemachine" /I "../game_shared/tf2" /D "TF2_CLIENT_DLL" /D "NDEBUG" /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /D "PROTECTED_THINGS_ENABLE" /FR /Yu"cbase.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /subsystem:windows /dll /map /machine:I386 /out:".\Release\client.dll"
# ADD LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"LIBCD" /nodefaultlib:"LIBCMT" /out:".\cl_dll___Win32_TF2_Release\client.dll" /libpath:"..\lib\public"
# SUBTRACT LINK32 /profile /incremental:yes
# Begin Custom Build - Copying to tf2\bin
TargetDir=.\cl_dll___Win32_TF2_Release
InputPath=.\cl_dll___Win32_TF2_Release\client.dll
SOURCE="$(InputPath)"

".\..\..\tf2\bin\client.dll" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	if exist .\..\..\tf2\bin\client.dll attrib -r .\..\..\tf2\bin\client.dll 
	copy $(TargetDir)\client.dll .\..\..\tf2\bin 
	if exist $(TargetDir)\client.map copy $(TargetDir)\client.map .\..\..\tf2\bin\client.map 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "cl_dll___Win32_TF2_Debug"
# PROP BASE Intermediate_Dir "cl_dll___Win32_TF2_Debug"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "cl_dll___Win32_TF2_Debug"
# PROP Intermediate_Dir "cl_dll___Win32_TF2_Debug"
# PROP Ignore_Export_Lib 1
# PROP Target_Dir ""
# ADD BASE CPP /nologo /G5 /W3 /Gm /ZI /Od /I "." /I ".." /I "..\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I ".\tf2_hud\elements" /I "./../dlls/tf2_dll" /I ".\..\common\MaterialSystem" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "VECTOR" /D "CLIENT_DLL" /FR /YX /FD /c
# ADD CPP /nologo /G6 /W4 /Gm /GR /ZI /Od /I ".\tf2_hud" /I "." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../statemachine" /I "../game_shared/tf2" /D "TF2_CLIENT_DLL" /D "_DEBUG" /D fopen=dont_use_fopen /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /D "PROTECTED_THINGS_ENABLE" /FR /Yu"cbase.h" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /subsystem:windows /dll /map /debug /machine:I386 /out:".\Debug\client.dll"
# ADD LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"LIBC" /nodefaultlib:"LIBCMTD" /nodefaultlib:"LIBCMT" /out:".\cl_dll___Win32_TF2_Debug\client.dll" /libpath:"..\lib\public"
# SUBTRACT LINK32 /pdb:none
# Begin Custom Build - Copying to tf2\bin
TargetDir=.\cl_dll___Win32_TF2_Debug
InputPath=.\cl_dll___Win32_TF2_Debug\client.dll
SOURCE="$(InputPath)"

".\..\..\tf2\bin\client.dll" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	if exist .\..\..\tf2\bin\client.dll attrib -r .\..\..\tf2\bin\client.dll 
	copy $(TargetDir)\client.dll .\..\..\tf2\bin 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "cl_dll___Win32_HL2_Debug"
# PROP BASE Intermediate_Dir "cl_dll___Win32_HL2_Debug"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "cl_dll___Win32_HL2_Debug"
# PROP Intermediate_Dir "cl_dll___Win32_HL2_Debug"
# PROP Ignore_Export_Lib 1
# PROP Target_Dir ""
# ADD BASE CPP /nologo /G5 /W3 /Gm /ZI /Od /I "." /I ".." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "./../dlls/tf2_dll" /I ".\..\common\MaterialSystem" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "VECTOR" /D "CLIENT_DLL" /FR /YX /FD /c
# ADD CPP /nologo /G6 /W4 /Gm /GR /ZI /Od /I ".\hl2_dll" /I ".\hl2_hud" /I ".\hl2_hud\elements" /I "." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../game_shared/hl2" /D "HL2_CLIENT_DLL" /D "_DEBUG" /D fopen=dont_use_fopen /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /D "PROTECTED_THINGS_ENABLE" /FR /Yu"cbase.h" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /subsystem:windows /dll /map /debug /machine:I386 /out:".\Debug\client.dll"
# ADD LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"LIBCMTD" /nodefaultlib:"LIBC" /nodefaultlib:"LIBCMT" /out:".\cl_dll___Win32_HL2_Debug\client.dll" /libpath:"..\lib\public"
# SUBTRACT LINK32 /pdb:none
# Begin Custom Build - Copying to hl2\bin
TargetDir=.\cl_dll___Win32_HL2_Debug
InputPath=.\cl_dll___Win32_HL2_Debug\client.dll
SOURCE="$(InputPath)"

".\..\..\hl2\bin\client.dll" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	if exist .\..\..\hl2\bin\client.dll attrib -r .\..\..\hl2\bin\client.dll 
	copy $(TargetDir)\client.dll .\..\..\hl2\bin 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "cl_dll___Win32_HL2_Release"
# PROP BASE Intermediate_Dir "cl_dll___Win32_HL2_Release"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "cl_dll___Win32_HL2_Release"
# PROP Intermediate_Dir "cl_dll___Win32_HL2_Release"
# PROP Ignore_Export_Lib 1
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Zi /O2 /I "." /I ".." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "./../dlls/tf2_dll" /I ".\..\common\MaterialSystem" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "VECTOR" /D "CLIENT_DLL" /YX /FD /c
# ADD CPP /nologo /G6 /W4 /GR /Zi /O2 /Ob2 /I ".\hl2_dll" /I ".\hl2_hud" /I ".\hl2_hud\elements" /I "." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../game_shared/hl2" /D "HL2_CLIENT_DLL" /D "NDEBUG" /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /D "PROTECTED_THINGS_ENABLE" /FR /Yu"cbase.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /subsystem:windows /dll /map /machine:I386 /out:".\Release\client.dll"
# ADD LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"libcd.lib" /nodefaultlib:"LIBCD" /nodefaultlib:"LIBCMT" /out:".\cl_dll___Win32_HL2_Release\client.dll" /libpath:"..\lib\public"
# SUBTRACT LINK32 /pdb:none
# Begin Custom Build - Copying to hl2\bin
TargetDir=.\cl_dll___Win32_HL2_Release
InputPath=.\cl_dll___Win32_HL2_Release\client.dll
SOURCE="$(InputPath)"

".\..\..\hl2\bin\client.dll" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	if exist .\..\..\hl2\bin\client.dll attrib -r .\..\..\hl2\bin\client.dll 
	copy $(TargetDir)\client.dll .\..\..\hl2\bin 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "cl_dll___Win32_HL1_Release"
# PROP BASE Intermediate_Dir "cl_dll___Win32_HL1_Release"
# PROP BASE Ignore_Export_Lib 1
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "cl_dll___Win32_HL1_Release"
# PROP Intermediate_Dir "cl_dll___Win32_HL1_Release"
# PROP Ignore_Export_Lib 1
# PROP Target_Dir ""
# ADD BASE CPP /nologo /G6 /W4 /GR /Zi /O2 /Ob2 /I ".\hl2_dll" /I ".\hl2_hud" /I ".\hl2_hud\elements" /I "." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../game_shared/hl2" /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "HL1_CLIENT_DLL" /D "NDEBUG" /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /FR /Yu"cbase.h" /FD /c
# ADD CPP /nologo /G6 /W4 /GR /Zi /O2 /Ob2 /I ".\hl1_hud" /I ".\hl2_dll" /I ".\hl2_hud" /I ".\hl2_hud\elements" /I "." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../game_shared/hl1" /I "../game_shared/hl2" /D "HL1_CLIENT_DLL" /D "NDEBUG" /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /D "PROTECTED_THINGS_ENABLE" /Yu"cbase.h" /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"libcd.lib" /nodefaultlib:"LIBCD" /nodefaultlib:"LIBCMT" /out:".\cl_dll___Win32_HL1_Release\client.dll" /libpath:"..\lib\public"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"libcd.lib" /nodefaultlib:"LIBCD" /nodefaultlib:"LIBCMT" /out:".\cl_dll___Win32_HL1_Release\client.dll" /libpath:"..\lib\public"
# SUBTRACT LINK32 /pdb:none
# Begin Custom Build - Copying to hl1\bin
TargetDir=.\cl_dll___Win32_HL1_Release
InputPath=.\cl_dll___Win32_HL1_Release\client.dll
SOURCE="$(InputPath)"

".\..\..\hl1\bin\client.dll" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	if exist .\..\..\hl1\bin\client.dll attrib -r .\..\..\hl1\bin\client.dll 
	copy $(TargetDir)\client.dll .\..\..\hl1\bin 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "cl_dll___Win32_HL1_Debug"
# PROP BASE Intermediate_Dir "cl_dll___Win32_HL1_Debug"
# PROP BASE Ignore_Export_Lib 1
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "cl_dll___Win32_HL1_Debug"
# PROP Intermediate_Dir "cl_dll___Win32_HL1_Debug"
# PROP Ignore_Export_Lib 1
# PROP Target_Dir ""
# ADD BASE CPP /nologo /G6 /W4 /Gm /GR /ZI /Od /I ".\hl2_dll" /I ".\hl2_hud" /I ".\hl2_hud\elements" /I "." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../game_shared/hl2" /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "HL1_CLIENT_DLL" /D "_DEBUG" /D fopen=dont_use_fopen /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /FR /Yu"cbase.h" /FD /c
# ADD CPP /nologo /G6 /W4 /Gm /GR /ZI /Od /I ".\hl1_hud" /I ".\hl2_dll" /I ".\hl2_hud" /I ".\hl2_hud\elements" /I "." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../game_shared/hl1" /I "../game_shared/hl2" /D "HL1_CLIENT_DLL" /D "_DEBUG" /D fopen=dont_use_fopen /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /D "PROTECTED_THINGS_ENABLE" /FR /Yu"cbase.h" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"LIBCMTD" /nodefaultlib:"LIBC" /nodefaultlib:"LIBCMT" /out:".\cl_dll___Win32_HL1_Debug\client.dll" /libpath:"..\lib\public"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"LIBCMTD" /nodefaultlib:"LIBC" /nodefaultlib:"LIBCMT" /out:".\cl_dll___Win32_HL1_Debug\client.dll" /libpath:"..\lib\public"
# SUBTRACT LINK32 /pdb:none
# Begin Custom Build - Copying to hl1\bin
TargetDir=.\cl_dll___Win32_HL1_Debug
InputPath=.\cl_dll___Win32_HL1_Debug\client.dll
SOURCE="$(InputPath)"

".\..\..\hl1\bin\client.dll" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	if exist .\..\..\hl1\bin\client.dll attrib -r .\..\..\hl1\bin\client.dll 
	copy $(TargetDir)\client.dll .\..\..\hl1\bin 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "client___Win32_Debug_CounterStrike0"
# PROP BASE Intermediate_Dir "client___Win32_Debug_CounterStrike0"
# PROP BASE Ignore_Export_Lib 1
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug_CounterStrike"
# PROP Intermediate_Dir "Debug_CounterStrike"
# PROP Ignore_Export_Lib 1
# PROP Target_Dir ""
# ADD BASE CPP /nologo /G6 /W4 /Gm /GR /ZI /Od /I ".\hl1_hud" /I ".\hl2_dll" /I ".\hl2_hud" /I ".\hl2_hud\elements" /I "." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../game_shared/hl1" /I "../game_shared/hl2" /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "HL1_CLIENT_DLL" /D "_DEBUG" /D fopen=dont_use_fopen /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /FR /Yu"cbase.h" /FD /c
# ADD CPP /nologo /G6 /W4 /Gm /GR /ZI /Od /I "." /I ".\cstrike" /I ".\cstrike\vgui" /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../game_shared/cstrike" /D "_DEBUG" /D fopen=dont_use_fopen /D "CSTRIKE_DLL" /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /D "PROTECTED_THINGS_ENABLE" /FR /Yu"cbase.h" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"LIBCMTD" /nodefaultlib:"LIBC" /nodefaultlib:"LIBCMT" /out:".\cl_dll___Win32_HL1_Debug\client.dll" /libpath:"..\lib\public"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"LIBCMTD" /nodefaultlib:"LIBC" /nodefaultlib:"LIBCMT" /libpath:"..\lib\public"
# SUBTRACT LINK32 /pdb:none
# Begin Custom Build - Copying to cstrike\bin
TargetDir=.\Debug_CounterStrike
InputPath=.\Debug_CounterStrike\client.dll
SOURCE="$(InputPath)"

".\..\..\cstrike\bin\client.dll" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	if exist .\..\..\cstrike\bin\client.dll attrib -r .\..\..\cstrike\bin\client.dll 
	copy $(TargetDir)\client.dll .\..\..\cstrike\bin 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "client___Win32_Release_CounterStrike"
# PROP BASE Intermediate_Dir "client___Win32_Release_CounterStrike"
# PROP BASE Ignore_Export_Lib 1
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release_CounterStrike"
# PROP Intermediate_Dir "Release_CounterStrike"
# PROP Ignore_Export_Lib 1
# PROP Target_Dir ""
# ADD BASE CPP /nologo /G6 /W4 /GR /Zi /O2 /Ob2 /I ".\hl1_hud" /I ".\hl2_dll" /I ".\hl2_hud" /I ".\hl2_hud\elements" /I "." /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../game_shared/hl1" /I "../game_shared/hl2" /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "HL1_CLIENT_DLL" /D "NDEBUG" /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /Yu"cbase.h" /FD /c
# SUBTRACT BASE CPP /Fr
# ADD CPP /nologo /G6 /W4 /GR /Zi /O2 /Ob2 /I "." /I ".\cstrike" /I ".\cstrike\vgui" /I ".\..\Public" /I ".\..\vgui2\include" /I ".\..\vgui2\controls" /I "../game_shared" /I "../game_shared/cstrike" /D "NDEBUG" /D "CSTRIKE_DLL" /D "NO_STRING_T" /D "_MBCS" /D "CLIENT_DLL" /D "_WINDOWS" /D "VECTOR" /D strncpy=use_Q_strncpy_instead /D _snprintf=use_Q_snprintf_instead /D "_WIN32" /D "PROTECTED_THINGS_ENABLE" /Yu"cbase.h" /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"libcd.lib" /nodefaultlib:"LIBCD" /nodefaultlib:"LIBCMT" /out:".\cl_dll___Win32_HL1_Release\client.dll" /libpath:"..\lib\public"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 user32.lib winmm.lib /nologo /base:"0x24000000" /subsystem:windows /dll /map /debug /machine:I386 /nodefaultlib:"libcd.lib" /nodefaultlib:"LIBCD" /nodefaultlib:"LIBCMT" /nodefaultlib:"libcmtd.lib" /libpath:"..\lib\public"
# SUBTRACT LINK32 /pdb:none
# Begin Custom Build - Copying to cstrike\bin
TargetDir=.\Release_CounterStrike
InputPath=.\Release_CounterStrike\client.dll
SOURCE="$(InputPath)"

".\..\..\cstrike\bin\client.dll" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	if exist .\..\..\cstrike\bin\client.dll attrib -r .\..\..\cstrike\bin\client.dll 
	copy $(TargetDir)\client.dll .\..\..\cstrike\bin 
	
# End Custom Build

!ENDIF 

# Begin Target

# Name "client - Win32 Release TF2"
# Name "client - Win32 Debug TF2"
# Name "client - Win32 Debug HL2"
# Name "client - Win32 Release HL2"
# Name "client - Win32 Release HL1"
# Name "client - Win32 Debug HL1"
# Name "client - Win32 Debug CounterStrike"
# Name "client - Win32 Release CounterStrike"
# Begin Group "Source Files"

# PROP Default_Filter ""
# Begin Group "Precompiled Header"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\stdafx.cpp
# ADD CPP /Yc"cbase.h"
# End Source File
# End Group
# Begin Group "TF2 DLL"

# PROP Default_Filter ""
# Begin Group "TF2 Classes"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_commando.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_commando.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_defender.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_defender.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_escort.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_escort.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_infiltrator.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_infiltrator.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_medic.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_medic.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_pyro.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_pyro.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_recon.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_recon.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_sapper.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_sapper.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_sniper.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_sniper.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_support.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_class_support.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_playerclass.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_playerclass.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tfclassdata_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# End Group
# Begin Group "TF2 Movement"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\game_shared\tf_gamemovement.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_chooser.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_chooser.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_commando.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_commando.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_defender.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_defender.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_escort.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_escort.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_infiltrator.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_infiltrator.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_medic.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_medic.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_pyro.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_pyro.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_recon.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_recon.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_sapper.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_sapper.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_sniper.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_sniper.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_support.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamemovement_support.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# End Group
# Begin Source File

SOURCE=..\game_shared\tf2\baseobject_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\baseobject_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\basetfcombatweapon_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\basetfcombatweapon_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\basetfplayer_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\basetfplayer_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\basetfvehicle.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\basetfvehicle.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_basecombatcharacter_tf2.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_basefourwheelvehicle.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_basefourwheelvehicle.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_baseobject.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_baseobject.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_basetfplayer.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_basetfplayer.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_controlzone.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_controlzone.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_demo_entities.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_demo_entities.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_effect_shootingstar.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_effect_shootingstar.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_entity_burn_effect.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_entity_burn_effect.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_env_meteor.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_env_meteor.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_func_construction_yard.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_func_resource.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_func_resource.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_gasoline_blob.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_gasoline_blob.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_grenade_antipersonnel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_grenade_limpetmine.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_grenade_objectsapper.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_grenade_rocket.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_harpoon.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_hint_events.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_hint_events.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_info_act.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_info_act.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_info_customtech.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_maker_bughole.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\dlls\tf2_dll\c_obj_armor_upgrade.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_barbed_wire.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_barbed_wire.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_base_manned_gun.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_base_manned_gun.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_buff_station.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_bunker.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_dragonsteeth.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_empgenerator.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_explosives.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_manned_missilelauncher.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_manned_shield.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_mapdefined.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_mapdefined.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_mcv_selection_panel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_mortar.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_powerpack.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_rallyflag.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_resourcepump.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_resourcepump.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_respawn_station.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_respawn_station.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_resupply.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_sandbag_bunker.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_selfheal.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_sentrygun.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_shieldwall.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_tower.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_tunnel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_obj_vehicleboost.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_objectsentrygun.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_assist.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_assist.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_buildsentrygun.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_buildsentrygun.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_buildshieldwall.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_buildshieldwall.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_heal.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_heal.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_killmortarguy.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_killmortarguy.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_mortar_attack.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_mortar_attack.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_player.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_player.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_repair.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_repair.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_resourcepump.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_resourcepump.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_respawnstation.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_respawnstation.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_order_resupply.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_ragdoll_shadow.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_resource_chunk.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_shield.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_shield.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_shield_flat.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf2rootpanel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf2rootpanel.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_basecombatweapon.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_basecombatweapon.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_basehint.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_basehint.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_flare.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_hintmanager.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_hintmanager.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_hints.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tf_hints.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tfplayerlocaldata.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tfplayerresource.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tfplayerresource.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tfteam.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_tfteam.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_vehicle_battering_ram.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_vehicle_flatbed.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_vehicle_mortar.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_vehicle_motorcycle.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_vehicle_siege_tower.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_vehicle_tank.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_vehicle_tank.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_vehicle_teleport_station.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_vehicle_teleport_station.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_vehicle_wagon.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_walker_base.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_walker_base.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_walker_ministrider.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_walker_ministrider.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_walker_strider.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_walker_strider.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_weapon__stubs_tf2.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_weapon_builder.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_weapon_builder.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\c_weapon_twohandedcontainer.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\clientmode_commander.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\clientmode_commander.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\clientmode_tfbase.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\clientmode_tfbase.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\clientmode_tfnormal.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\clientmode_tfnormal.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\CommanderOverlay.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\CommanderOverlay.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\commanderoverlaypanel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\commanderoverlaypanel.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\env_laserdesignation.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\env_laserdesignation.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\env_meteor_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\env_meteor_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\env_objecteffects.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\env_objecteffects.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\fx_tf2_blood.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\fx_tf2_buildeffects.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\fx_tf2_impacts.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\fx_tf2_tracers.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\gasoline_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\grenade_base_empable.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\grenade_base_empable.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\grenade_emp.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\grenade_emp.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\ground_line.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\ground_line.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hintitembase.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hintitembase.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hintitemobjectbase.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hintitemobjectbase.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hintitemorderbase.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hintitemorderbase.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_ammo.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_ammo.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_commander_statuspanel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_commander_statuspanel.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_damageindicator.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_deathnotice.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_emp.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_health.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_minimap.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_minimap.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_numeric.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_numeric.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_orders.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_orders.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_resources.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_target_id.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_targetreticle.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_targetreticle.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_technologytreedoc.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_technologytreedoc.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_timer.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_timer.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_vehicle_role.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_vehicle_role.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\hud_weaponselection.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\InfiltratorCamoMaterialProxy.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\itfhintitem.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\iusesmortarpanel.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\mapdata.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\mapdata.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\maxplayers.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\minimap_players.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\minimap_resourcezone.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\minimap_trace.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\minimap_trace.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\ObjectBuildAlphaProxy.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\ObjectControlPanel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\ObjectControlPanel.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\overlay_orders.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\panel_effects.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\PanelEffect.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\paneleffect.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\plasmaprojectile.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\plasmaprojectile.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\plasmaprojectile_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\plasmaprojectile_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playerandobjectenumerator.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playerandobjectenumerator.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlay.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlay.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlayclass.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlayclass.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlayhealth.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlayhealth.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlayname.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlayname.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlayselected.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlayselected.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlaysquad.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\playeroverlaysquad.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\proxy_shield.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\proxy_sunroof.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\ProxyTFPlayer.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\resourcezoneoverlay.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\RespawnWaveVGuiScreen.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\TeamMaterialProxy.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\techtree.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\techtree.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\techtree_parse.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\tf_clientmode.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf_gamemovement.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamerules.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_gamerules.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_hints.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\tf_in_main.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf_movedata.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_obj_base_manned_gun.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_obj_base_manned_gun.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_obj_basedrivergun_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_obj_basedrivergun_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_obj_baseupgrade_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_obj_baseupgrade_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_obj_driver_machinegun_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_obj_driver_machinegun_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_obj_manned_plasmagun.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_obj_manned_plasmagun_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\tf_prediction.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf_reconvars.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf_reconvars.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_shareddefs.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf_shareddefs.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_shield_mobile_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf_shieldshared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1
# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1
# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1
# SUBTRACT BASE CPP /YX /Yc /Yu
# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1
# SUBTRACT BASE CPP /YX /Yc /Yu
# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1
# SUBTRACT BASE CPP /YX /Yc /Yu
# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1
# SUBTRACT BASE CPP /YX /Yc /Yu
# SUBTRACT CPP /YX /Yc /Yu

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf_shieldshared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf_tacticalmap.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1
# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1
# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1
# SUBTRACT BASE CPP /YX /Yc /Yu
# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1
# SUBTRACT BASE CPP /YX /Yc /Yu
# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1
# SUBTRACT BASE CPP /YX /Yc /Yu
# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1
# SUBTRACT BASE CPP /YX /Yc /Yu
# SUBTRACT CPP /YX /Yc /Yu

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\tf_usermessages.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf_vehicleshared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\TFClassData_Shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\ThermalMaterialProxy.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\vehicle_mortar_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\vgui_BitmapPanel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\vgui_EntityImagePanel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\vgui_EntityPanel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\vgui_healthbar.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\vgui_ImageHealthPanel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\vgui_rootpanel_tf2.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\vgui_rotation_slider.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\vgui_rotation_slider.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\tf2_hud\VGuiScreenVehicleBay.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_arcwelder.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_basecombatobject.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_basecombatobject.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_basegrenade.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_basegrenade.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_burstrifle.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_grenade.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_grenade_emp.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_laserrifle.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_plasma_grenade_launcher.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_plasmarifle.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_shotgun.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_usedwithshieldbase.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combat_usedwithshieldbase.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combatshield.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_combatshield.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_drainbeam.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_drainbeam.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_flame_thrower.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_flame_thrower.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_gas_can.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_gas_can.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_grenade_rocket.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_grenade_rocket.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_harpoon.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_limpetmine.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_minigun.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_obj_rallyflag.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_objectselection.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_repairgun.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_repairgun.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_rocketlauncher.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_rocketlauncher.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_shield.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_shield.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_shieldgrenade.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_twohandedcontainer.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_twohandedcontainer.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# End Group
# Begin Group "HL2 DLL"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\game_shared\hl2\basehlcombatweapon_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_antlion_dust.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_ar2_explosion.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_assassin_smoke.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_barnacle.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_barney.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_basehelicopter.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_basehelicopter.h
# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_basehlcombatweapon.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_basehlcombatweapon.h
# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_basehlplayer.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_basehlplayer.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_combineguard.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_corpse.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_corpse.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_energy_wave.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_extinguisher.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\C_Func_Monitor.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_hl2_playerlocaldata.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_hl2_playerlocaldata.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_npc_combinegunship.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_npc_hydra.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_npc_manhack.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_particle_storm.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_particle_storm.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_plasma_beam_node.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\C_Point_Camera.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\C_Point_Camera.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_rotorwash.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_spotlight_end.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_strider.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_te_concussiveexplosion.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_te_flare.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_vehicle_crane.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_dll\c_vehicle_jeep.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\C_WaterLODControl.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_weapon__stubs_hl2.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_weapon_gravitygun.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\c_weapon_sticklauncher.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\clientmode_hlnormal.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\clientmode_hlnormal.h
# End Source File
# Begin Source File

SOURCE=.\death.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\energy_wave_effect.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\energy_wave_effect.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\fx_antlion.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\fx_bugbait.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_dll\fx_hl2_impacts.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\fx_hl2_tracers.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hl2_clientmode.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl2\hl2_gamerules.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl2\hl2_gamerules.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl2_shareddefs.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl2\hl2_usermessages.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl_gamemovement.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hl_in_main.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hl_prediction.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hud_ammo.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hud_battery.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hud_blood.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_dll\hud_damageindicator.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hud_flashlight.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# SUBTRACT CPP /YX /Yc /Yu

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hud_health.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hud_quickinfo.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hud_suitpower.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hud_suitpower.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hud_weaponselection.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\hud_zoom.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\ShieldProxy.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\vgui_rootpanel_hl2.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl2_hud\WaterLODMaterialProxy.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# End Group
# Begin Group "HL1 DLL"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\game_shared\hl1\hl1_basecombatweapon_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl1\hl1_basecombatweapon_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl1\hl1_c_beamfollow.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl1\hl1_c_player.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl1\hl1_c_player.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl1\hl1_c_rpg_rocket.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl1\hl1_c_stickybolt.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl1\hl1_c_weapon__stubs.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl1\hl1_clientmode.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl1\hl1_fx_gibs.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hl1\hl1_fx_impacts.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl1\hl1_gamemovement.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl1\hl1_gamemovement.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl1\hl1_gamerules.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl1\hl1_player_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\hl1\hl1_usermessages.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# End Group
# Begin Group "Temporary Entities"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\c_basetempentity.cpp
# End Source File
# Begin Source File

SOURCE=.\c_effects.cpp
# End Source File
# Begin Source File

SOURCE=.\c_impact_effects.cpp
# End Source File
# Begin Source File

SOURCE=.\c_movie_explosion.cpp
# End Source File
# Begin Source File

SOURCE=.\c_particle_fire.cpp
# End Source File
# Begin Source File

SOURCE=.\c_particle_smokegrenade.cpp
# End Source File
# Begin Source File

SOURCE=.\c_prop_vehicle.cpp
# End Source File
# Begin Source File

SOURCE=.\c_recipientfilter.cpp
# End Source File
# Begin Source File

SOURCE=.\c_smoke_trail.cpp
# End Source File
# Begin Source File

SOURCE=.\c_SmokeStack.cpp
# End Source File
# Begin Source File

SOURCE=.\c_splash.cpp
# End Source File
# Begin Source File

SOURCE=.\c_steamjet.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_armorricochet.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_basebeam.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_beamentpoint.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_beaments.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_beamlaser.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_beampoints.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_beamring.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_beamringpoint.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_beamspline.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_bloodsprite.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_bloodstream.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_breakmodel.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_bspdecal.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_bubbles.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_bubbletrail.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_decal.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_dynamiclight.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_effect_dispatch.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_energysplash.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_explosion.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_fizz.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_fogripple.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_footprint.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_glassshatter.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_glowsprite.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_impact.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_killplayerattachments.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_largefunnel.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_legacytempents.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_muzzleflash.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_particlesystem.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_playerdecal.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_showline.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_smoke.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_sparks.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_sprite.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_spritespray.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_textmessage.cpp
# End Source File
# Begin Source File

SOURCE=.\c_te_worlddecal.cpp
# End Source File
# Begin Source File

SOURCE=.\C_TestTraceline.cpp
# End Source File
# Begin Source File

SOURCE=.\c_tracer.cpp
# End Source File
# Begin Source File

SOURCE=.\fx.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_discreetline.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_envelope.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_line.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_sparks.cpp
# End Source File
# Begin Source File

SOURCE=.\ParticleSphereRenderer.cpp
# End Source File
# Begin Source File

SOURCE=.\smoke_fog_overlay.cpp
# End Source File
# End Group
# Begin Group "CounterStrike DLL"

# PROP Default_Filter ""
# Begin Group "vgui"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\cstrike\VGUI\buymenu.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\buymenu.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\buymouseoverhtmlbutton.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\buymouseoverpanelbutton.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\buysubmenu.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\buysubmenu.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\counterstrikeviewport.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\counterstrikeviewport.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\counterstrikeviewport_interface.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\cstrikeclassmenu.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\cstrikeclassmenu.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\cstrikeclientscoreboard.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\cstrikeclientscoreboard.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\cstrikespectatorgui.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\cstrikespectatorgui.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\cstriketeammenu.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\cstriketeammenu.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\icstrikeviewport.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\VGUI\icstrikeviewportmsgs.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# End Group
# Begin Source File

SOURCE=.\cstrike\c_cs_player.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\c_cs_player.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\c_cs_team.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\c_cs_team.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\c_csrootpanel.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\c_csrootpanel.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\clientmode_csnormal.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\clientmode_csnormal.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\cs_gamemovement.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\cs_gamerules.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\cs_gamerules.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\cs_hud_ammo.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\cs_hud_damageindicator.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\cs_hud_health.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\cs_hud_weaponselection.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\cs_in_main.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\cs_player_shared.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\cs_playeranimstate.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\cs_playeranimstate.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\cs_prediction.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\cs_shareddefs.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\cs_usermessages.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\cs_weapon_parse.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\cs_weapon_parse.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\fx_cs_impacts.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\hud_account.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\hud_armor.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\hud_c4.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\hud_progressbar.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\hud_roundtimer.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\hud_shopping_cart.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\mouseoverpanelbutton.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\cstrike\vgui_rootpanel_cs.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_ak47.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_aug.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_awp.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_basecsgrenade.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_basecsgrenade.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_c4.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_c4.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_csbase.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_csbase.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_csbasegun.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_csbasegun.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_deagle.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_famas.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_fiveseven.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_flashbang.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_g3sg1.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_galil.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_glock.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_hegrenade.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_knife.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_knife.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_m249.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_m3.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_m4a1.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_mac10.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_mp5navy.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_p228.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_p90.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_scout.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_sg550.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_sg552.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_ump45.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\cstrike\weapon_usp.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# End Group
# Begin Source File

SOURCE=..\game_shared\activitylist.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\activitylist.h
# End Source File
# Begin Source File

SOURCE=.\AlphaMaterialProxy.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\ammodef.cpp
# End Source File
# Begin Source File

SOURCE=.\AnimatedEntityTextureProxy.cpp
# End Source File
# Begin Source File

SOURCE=.\AnimatedTextureProxy.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\animation.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\animation.h
# End Source File
# Begin Source File

SOURCE=.\BaseAnimatedTextureProxy.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\basecombatcharacter_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\basecombatweapon_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\basecombatweapon_shared.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\baseentity_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\baseentity_shared.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\basegrenade_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\basegrenade_shared.h
# End Source File
# Begin Source File

SOURCE=.\BaseModViewport.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\BaseModViewport.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\baseparticleentity.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\baseparticleentity.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\baseplayer_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\baseplayer_shared.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\baseviewmodel_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\baseviewmodel_shared.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\beam_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\beam_shared.h
# End Source File
# Begin Source File

SOURCE=.\beamdraw.cpp
# End Source File
# Begin Source File

SOURCE=..\Public\bitbuf.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\game_shared\bone_setup.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\c_AI_BaseHumanoid.cpp
# End Source File
# Begin Source File

SOURCE=.\c_AI_BaseNPC.cpp
# End Source File
# Begin Source File

SOURCE=.\c_baseanimating.cpp
# End Source File
# Begin Source File

SOURCE=.\c_baseanimatingoverlay.cpp
# End Source File
# Begin Source File

SOURCE=.\c_basecombatcharacter.cpp
# End Source File
# Begin Source File

SOURCE=.\c_basecombatweapon.cpp
# End Source File
# Begin Source File

SOURCE=.\c_basedoor.cpp
# End Source File
# Begin Source File

SOURCE=.\c_baseentity.cpp
# End Source File
# Begin Source File

SOURCE=.\c_baseflex.cpp
# End Source File
# Begin Source File

SOURCE=.\c_basenetworkable.cpp
# End Source File
# Begin Source File

SOURCE=.\c_baseplayer.cpp
# End Source File
# Begin Source File

SOURCE=.\c_baseviewmodel.cpp
# End Source File
# Begin Source File

SOURCE=.\c_breakableprop.cpp
# End Source File
# Begin Source File

SOURCE=.\c_breakableprop.h
# End Source File
# Begin Source File

SOURCE=.\c_clientstats.cpp
# End Source File
# Begin Source File

SOURCE=.\c_dynamiclight.cpp
# End Source File
# Begin Source File

SOURCE=.\c_env_screenoverlay.cpp
# End Source File
# Begin Source File

SOURCE=.\c_fire_smoke.cpp
# End Source File
# Begin Source File

SOURCE=.\c_func_areaportalwindow.cpp
# End Source File
# Begin Source File

SOURCE=.\c_func_breakablesurf.cpp
# End Source File
# Begin Source File

SOURCE=.\c_func_conveyor.cpp
# End Source File
# Begin Source File

SOURCE=.\c_func_dust.cpp
# End Source File
# Begin Source File

SOURCE=.\c_func_lod.cpp
# End Source File
# Begin Source File

SOURCE=.\c_func_occluder.cpp
# End Source File
# Begin Source File

SOURCE=.\c_func_smokevolume.cpp
# End Source File
# Begin Source File

SOURCE=.\c_gib.cpp
# End Source File
# Begin Source File

SOURCE=.\c_hairball.cpp
# End Source File
# Begin Source File

SOURCE=.\c_lightglow.cpp
# End Source File
# Begin Source File

SOURCE=.\c_physbox.cpp
# End Source File
# Begin Source File

SOURCE=.\c_physicsprop.cpp
# End Source File
# Begin Source File

SOURCE=.\c_physicsprop.h
# End Source File
# Begin Source File

SOURCE=.\c_plasma.cpp
# End Source File
# Begin Source File

SOURCE=.\c_playerresource.cpp
# End Source File
# Begin Source File

SOURCE=.\c_props.cpp
# End Source File
# Begin Source File

SOURCE=.\c_rope.cpp
# End Source File
# Begin Source File

SOURCE=.\c_shadowcontrol.cpp
# End Source File
# Begin Source File

SOURCE=.\c_soundscape.cpp
# End Source File
# Begin Source File

SOURCE=.\c_sprite.cpp
# End Source File
# Begin Source File

SOURCE=.\c_sun.cpp
# End Source File
# Begin Source File

SOURCE=.\c_sun.h
# End Source File
# Begin Source File

SOURCE=.\c_team.cpp
# End Source File
# Begin Source File

SOURCE=.\c_terrainmodmgr.cpp
# End Source File
# Begin Source File

SOURCE=.\c_test_proxytoggle.cpp
# End Source File
# Begin Source File

SOURCE=.\c_user_message_register.cpp
# End Source File
# Begin Source File

SOURCE=.\c_user_message_register.h
# End Source File
# Begin Source File

SOURCE=.\c_vguiscreen.cpp
# End Source File
# Begin Source File

SOURCE=.\c_vguiscreen.h
# End Source File
# Begin Source File

SOURCE=.\c_world.cpp
# End Source File
# Begin Source File

SOURCE=.\CamoMaterialProxy.cpp
# End Source File
# Begin Source File

SOURCE=.\cdll_client_int.cpp
# End Source File
# Begin Source File

SOURCE=.\cdll_util.cpp
# End Source File
# Begin Source File

SOURCE=..\public\characterset.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\public\checksum_crc.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\Public\checksum_crc.h
# End Source File
# Begin Source File

SOURCE=.\classmap.cpp
# End Source File
# Begin Source File

SOURCE=.\..\public\client_class.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\client_thinklist.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientEffectPrecacheSystem.cpp
# End Source File
# Begin Source File

SOURCE=.\cliententitylist.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientLeafSystem.cpp
# End Source File
# Begin Source File

SOURCE=.\clientmode_shared.cpp
# End Source File
# Begin Source File

SOURCE=.\ClientShadowMgr.cpp
# End Source File
# Begin Source File

SOURCE=.\clientsideeffects.cpp
# End Source File
# Begin Source File

SOURCE=.\clientsideeffects_test.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\collisionproperty.cpp
# End Source File
# Begin Source File

SOURCE=..\Public\CollisionUtils.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\..\public\convar.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\Public\crtmemdebug.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\game_shared\decals.cpp
# End Source File
# Begin Source File

SOURCE=.\DetailObjectSystem.cpp
# End Source File
# Begin Source File

SOURCE=..\public\dt_recv.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\DummyProxy.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\effect_dispatch_data.cpp
# End Source File
# Begin Source File

SOURCE=.\EffectsClient.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\ehandle.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\entitylist_base.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\env_wind_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\env_wind_shared.h
# End Source File
# Begin Source File

SOURCE=..\public\filesystem_helpers.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\FunctionProxy.cpp
# End Source File
# Begin Source File

SOURCE=.\FunctionProxy.h
# End Source File
# Begin Source File

SOURCE=.\fx_blood.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_cube.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_explosion.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_explosion.h
# End Source File
# Begin Source File

SOURCE=.\fx_fleck.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_impact.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_quad.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_shelleject.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_staticline.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_tracer.cpp
# End Source File
# Begin Source File

SOURCE=.\fx_water.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\gamemovement.cpp
# ADD CPP /Yu
# End Source File
# Begin Source File

SOURCE=..\game_shared\gamerules.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\gamerules.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\gamestringpool.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\gamestringpool.h
# End Source File
# Begin Source File

SOURCE=.\gametrace_client.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\gamevars_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\gamevars_shared.h
# End Source File
# Begin Source File

SOURCE=.\geiger.cpp
# End Source File
# Begin Source File

SOURCE=.\glow_overlay.cpp
# End Source File
# Begin Source File

SOURCE=.\glow_overlay.h
# End Source File
# Begin Source File

SOURCE=.\history_resource.cpp
# End Source File
# Begin Source File

SOURCE=.\hud.cpp
# End Source File
# Begin Source File

SOURCE=.\hud_animationinfo.cpp
# End Source File
# Begin Source File

SOURCE=.\hud_chat.cpp
# End Source File
# Begin Source File

SOURCE=.\hud_closecaption.cpp
# End Source File
# Begin Source File

SOURCE=.\hud_closecaption.h
# End Source File
# Begin Source File

SOURCE=.\hud_crosshair.cpp
# End Source File
# Begin Source File

SOURCE=.\hud_crosshair.h
# End Source File
# Begin Source File

SOURCE=.\hud_element_helper.cpp
# End Source File
# Begin Source File

SOURCE=.\hud_msg.cpp
# End Source File
# Begin Source File

SOURCE=.\hud_numericdisplay.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hud_numericdisplay.h

!IF  "$(CFG)" == "client - Win32 Release TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\hud_pdump.cpp
# End Source File
# Begin Source File

SOURCE=.\hud_pdump.h
# End Source File
# Begin Source File

SOURCE=.\hud_redraw.cpp
# End Source File
# Begin Source File

SOURCE=.\hud_vehicle.cpp
# End Source File
# Begin Source File

SOURCE=.\hud_vehicle.h
# End Source File
# Begin Source File

SOURCE=.\hud_weapon.cpp
# End Source File
# Begin Source File

SOURCE=.\IClientShadowMgr.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\igamesystem.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\igamesystem.h
# End Source File
# Begin Source File

SOURCE=..\Public\ImageLoader.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\in_camera.cpp
# End Source File
# Begin Source File

SOURCE=.\in_joystick.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\in_main.cpp
# End Source File
# Begin Source File

SOURCE=.\in_mouse.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\initializer.cpp
# End Source File
# Begin Source File

SOURCE=.\..\public\interface.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\game_shared\interval.cpp
# End Source File
# Begin Source File

SOURCE=.\LampBeamProxy.cpp
# End Source File
# Begin Source File

SOURCE=.\LampHaloProxy.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\mapdata_shared.h
# End Source File
# Begin Source File

SOURCE=.\mat_stub.cpp
# End Source File
# Begin Source File

SOURCE=..\Public\Mathlib.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\MathProxy.cpp
# End Source File
# Begin Source File

SOURCE=.\matrixproxy.cpp
# End Source File
# Begin Source File

SOURCE=..\Public\measure_section.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\Public\mem_fgets.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\public\tier0\memoverride.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\Public\MemPool.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\menu.cpp
# End Source File
# Begin Source File

SOURCE=.\message.cpp
# End Source File
# Begin Source File

SOURCE=.\movehelper_client.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\movevars_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\multiplay_gamerules.cpp
# End Source File
# Begin Source File

SOURCE=..\public\networkvar.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\panelmetaclassmgr.cpp
# End Source File
# Begin Source File

SOURCE=.\panelmetaclassmgr.h
# End Source File
# Begin Source File

SOURCE=.\parsemsg.cpp
# End Source File
# Begin Source File

SOURCE=.\particle_collision.cpp
# End Source File
# Begin Source File

SOURCE=.\particle_collision.h
# End Source File
# Begin Source File

SOURCE=.\particle_proxies.cpp
# End Source File
# Begin Source File

SOURCE=.\particle_simple3D.cpp
# End Source File
# Begin Source File

SOURCE=.\particlemgr.cpp
# End Source File
# Begin Source File

SOURCE=.\particles_ez.cpp
# End Source File
# Begin Source File

SOURCE=.\particles_simple.cpp
# End Source File
# Begin Source File

SOURCE=.\physics.cpp
# End Source File
# Begin Source File

SOURCE=.\physics_main_client.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\physics_main_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\physics_saverestore.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\physics_saverestore.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\physics_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\precache_register.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\precache_register.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\predictableid.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\predictableid.h
# End Source File
# Begin Source File

SOURCE=.\prediction.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\predictioncopy.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\predictioncopy.h
# End Source File
# Begin Source File

SOURCE=.\proxyentity.cpp
# End Source File
# Begin Source File

SOURCE=.\proxyentity.h
# End Source File
# Begin Source File

SOURCE=.\ProxyHealth.cpp
# End Source File
# Begin Source File

SOURCE=.\proxyplayer.cpp
# End Source File
# Begin Source File

SOURCE=.\proxypupil.cpp
# End Source File
# Begin Source File

SOURCE=.\ragdoll.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\ragdoll_shared.cpp
# End Source File
# Begin Source File

SOURCE=.\RagdollExplosionEnumerator.h
# End Source File
# Begin Source File

SOURCE=.\recvproxy.cpp
# End Source File
# Begin Source File

SOURCE=.\recvproxy.h
# End Source File
# Begin Source File

SOURCE=.\rendertexture.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\game_shared\rope_helpers.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\Public\rope_physics.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\game_shared\saverestore.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\saverestore.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\saverestore_bitstring.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\saverestore_utlsymbol.h
# End Source File
# Begin Source File

SOURCE=..\public\sentence.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\game_shared\sharedInterface.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\sheetsimulator.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\simple_keys.cpp
# End Source File
# Begin Source File

SOURCE=..\Public\simple_physics.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\game_shared\singleplay_gamerules.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\singleplay_gamerules.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\SoundEmitterSystem.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\SoundEmitterSystemBase.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\SoundEmitterSystemBase.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\soundenvelope.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\soundenvelope.h
# End Source File
# Begin Source File

SOURCE=.\splinepatch.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\sprite.cpp
# End Source File
# Begin Source File

SOURCE=.\spritemodel.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\SpriteTrail.cpp
# End Source File
# Begin Source File

SOURCE=..\public\stringpool.cpp
# End Source File
# Begin Source File

SOURCE=..\public\stringregistry.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\Public\StringRegistry.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\takedamageinfo.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\takedamageinfo.h
# End Source File
# Begin Source File

SOURCE=.\TeamBitmapImage.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP BASE Exclude_From_Build 1
# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\game_shared\test_ehandle.cpp
# End Source File
# Begin Source File

SOURCE=.\text_message.cpp
# End Source File
# Begin Source File

SOURCE=.\TextureScrollMaterialProxy.cpp
# End Source File
# Begin Source File

SOURCE=..\Public\TGALoader.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\TimeMaterialProxy.cpp
# End Source File
# Begin Source File

SOURCE=.\toggletextureproxy.cpp
# End Source File
# Begin Source File

SOURCE=.\train.cpp
# End Source File
# Begin Source File

SOURCE=..\public\UserCmd.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\usermessages.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\usermessages.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\util_shared.cpp
# End Source File
# Begin Source File

SOURCE=..\Public\UtlBuffer.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\Public\utldict.h
# End Source File
# Begin Source File

SOURCE=..\Public\utlsymbol.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\..\public\vallocator.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=.\vgui_BasePanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_bitmapbutton.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_bitmapbutton.h
# End Source File
# Begin Source File

SOURCE=.\vgui_bitmapimage.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_BudgetBarGraphPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_BudgetHistoryPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_BudgetPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_CenterStringPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_ConnectMessagePanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_ConsolePanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_DebugOverlayPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_DownloadSliderPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_FPSPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_game_viewport.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_grid.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_int.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_LoadingDiscPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_MeasureTimePanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_MessageChars.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_NetGraphPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_scorepanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_TextMessagePanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_VProfGraphPanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_vprofpanel.cpp
# End Source File
# Begin Source File

SOURCE=.\vgui_vprofpanel.h
# End Source File
# Begin Source File

SOURCE=.\view.cpp
# End Source File
# Begin Source File

SOURCE=.\view_beams.cpp
# End Source File
# Begin Source File

SOURCE=.\view_effects.cpp
# End Source File
# Begin Source File

SOURCE=.\view_scene.cpp
# End Source File
# Begin Source File

SOURCE=.\ViewConeImage.cpp
# End Source File
# Begin Source File

SOURCE=.\..\public\vmatrix.cpp
# SUBTRACT CPP /YX /Yc /Yu
# End Source File
# Begin Source File

SOURCE=..\game_shared\voice_banmgr.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\voice_status.cpp
# End Source File
# Begin Source File

SOURCE=.\warp_overlay.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\tf2\weapon_objectselection.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\weapon_parse.cpp
# End Source File
# Begin Source File

SOURCE=..\game_shared\weapon_parse_default.cpp

!IF  "$(CFG)" == "client - Win32 Release TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug TF2"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL2"

!ELSEIF  "$(CFG)" == "client - Win32 Release HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug HL1"

!ELSEIF  "$(CFG)" == "client - Win32 Debug CounterStrike"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "client - Win32 Release CounterStrike"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\weapon_selection.cpp
# End Source File
# Begin Source File

SOURCE=.\weapons_resource.cpp
# End Source File
# Begin Source File

SOURCE=.\WorldDimsProxy.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h"
# Begin Source File

SOURCE=..\game_shared\ai_activity.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\amd3dx.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\ammodef.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\AnimationController.h
# End Source File
# Begin Source File

SOURCE=.\animationlayer.h
# End Source File
# Begin Source File

SOURCE=.\BaseAnimatedTextureProxy.h
# End Source File
# Begin Source File

SOURCE=..\public\basehandle.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\hl2\basehlcombatweapon_shared.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\basetypes.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\beam_flags.h
# End Source File
# Begin Source File

SOURCE=.\beamdraw.h
# End Source File
# Begin Source File

SOURCE=..\Public\bitbuf.h
# End Source File
# Begin Source File

SOURCE=..\Public\bitvec.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\bone_setup.h
# End Source File
# Begin Source File

SOURCE=..\Public\BSPFILE.H
# End Source File
# Begin Source File

SOURCE=.\..\Public\bspflags.h
# End Source File
# Begin Source File

SOURCE=..\Public\BSPTreeData.h
# End Source File
# Begin Source File

SOURCE=..\Public\bumpvects.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\Button.h
# End Source File
# Begin Source File

SOURCE=.\c_AI_BaseNPC.h
# End Source File
# Begin Source File

SOURCE=.\c_baseanimating.h
# End Source File
# Begin Source File

SOURCE=.\c_baseanimatingoverlay.h
# End Source File
# Begin Source File

SOURCE=.\c_basecombatcharacter.h
# End Source File
# Begin Source File

SOURCE=.\c_basecombatweapon.h
# End Source File
# Begin Source File

SOURCE=.\c_basedoor.h
# End Source File
# Begin Source File

SOURCE=.\c_baseentity.h
# End Source File
# Begin Source File

SOURCE=.\c_baseflex.h
# End Source File
# Begin Source File

SOURCE=.\c_basenetworkable.h
# End Source File
# Begin Source File

SOURCE=.\c_baseplayer.h
# End Source File
# Begin Source File

SOURCE=.\c_basetempentity.h
# End Source File
# Begin Source File

SOURCE=.\c_baseviewmodel.h
# End Source File
# Begin Source File

SOURCE=.\c_clientstats.h
# End Source File
# Begin Source File

SOURCE=.\c_func_dust.h
# End Source File
# Begin Source File

SOURCE=.\c_gib.h
# End Source File
# Begin Source File

SOURCE=.\c_impact_effects.h
# End Source File
# Begin Source File

SOURCE=.\c_physbox.h
# End Source File
# Begin Source File

SOURCE=.\c_playerlocaldata.h
# End Source File
# Begin Source File

SOURCE=.\c_playerresource.h
# End Source File
# Begin Source File

SOURCE=.\c_prop_vehicle.h
# End Source File
# Begin Source File

SOURCE=.\c_recipientfilter.h
# End Source File
# Begin Source File

SOURCE=.\c_rope.h
# End Source File
# Begin Source File

SOURCE=.\c_smoke_trail.h
# End Source File
# Begin Source File

SOURCE=.\c_soundscape.h
# End Source File
# Begin Source File

SOURCE=.\c_splash.h
# End Source File
# Begin Source File

SOURCE=.\c_sprite.h
# End Source File
# Begin Source File

SOURCE=.\c_te_basebeam.h
# End Source File
# Begin Source File

SOURCE=.\c_te_effect_dispatch.h
# End Source File
# Begin Source File

SOURCE=.\c_te_legacytempents.h
# End Source File
# Begin Source File

SOURCE=.\c_te_particlesystem.h
# End Source File
# Begin Source File

SOURCE=.\c_team.h
# End Source File
# Begin Source File

SOURCE=.\c_terrainmodmgr.h
# End Source File
# Begin Source File

SOURCE=.\c_tracer.h
# End Source File
# Begin Source File

SOURCE=.\c_weapon__stubs.h
# End Source File
# Begin Source File

SOURCE=.\c_world.h
# End Source File
# Begin Source File

SOURCE=..\Public\cache_user.h
# End Source File
# Begin Source File

SOURCE=.\cbase.h
# End Source File
# Begin Source File

SOURCE=.\cdll_client_int.h
# End Source File
# Begin Source File

SOURCE=.\cdll_convar.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\cdll_int.h
# End Source File
# Begin Source File

SOURCE=.\cdll_util.h
# End Source File
# Begin Source File

SOURCE=..\Public\characterset.h
# End Source File
# Begin Source File

SOURCE=.\cl_animevent.h
# End Source File
# Begin Source File

SOURCE=..\engine\cl_ents_parse.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\client_class.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\client_command.h
# End Source File
# Begin Source File

SOURCE=..\public\client_textmessage.h
# End Source File
# Begin Source File

SOURCE=.\client_thinklist.h
# End Source File
# Begin Source File

SOURCE=.\ClientEffectPrecacheSystem.h
# End Source File
# Begin Source File

SOURCE=.\cliententitylist.h
# End Source File
# Begin Source File

SOURCE=.\ClientLeafSystem.h
# End Source File
# Begin Source File

SOURCE=.\clientmode.h
# End Source File
# Begin Source File

SOURCE=.\clientmode_shared.h
# End Source File
# Begin Source File

SOURCE=.\clientsideeffects.h
# End Source File
# Begin Source File

SOURCE=..\Public\clientstats.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\cmodel.h
# End Source File
# Begin Source File

SOURCE=..\Public\CollisionUtils.h
# End Source File
# Begin Source File

SOURCE=..\public\Color.h
# End Source File
# Begin Source File

SOURCE=..\Public\commonmacros.h
# End Source File
# Begin Source File

SOURCE=..\common\con_nprint.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\const.h
# End Source File
# Begin Source File

SOURCE=..\public\vphysics\constraints.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\Controls.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\convar.h
# End Source File
# Begin Source File

SOURCE=..\Public\coordsize.h
# End Source File
# Begin Source File

SOURCE=..\Public\crtmemdebug.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\Cursor.h
# End Source File
# Begin Source File

SOURCE=..\Public\customentity.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\Dar.h
# End Source File
# Begin Source File

SOURCE=..\Public\datamap.h
# End Source File
# Begin Source File

SOURCE=..\public\tier0\dbg.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\decals.h
# End Source File
# Begin Source File

SOURCE=.\DetailObjectSystem.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\dlight.h
# End Source File
# Begin Source File

SOURCE=..\public\dt_common.h
# End Source File
# Begin Source File

SOURCE=..\public\dt_recv.h
# End Source File
# Begin Source File

SOURCE=..\public\dt_send.h
# End Source File
# Begin Source File

SOURCE=..\Public\edict.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\EditablePanel.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\effect_dispatch_data.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\ehandle.h
# End Source File
# Begin Source File

SOURCE=.\enginesprite.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\entitylist_base.h
# End Source File
# Begin Source File

SOURCE=..\public\tier0\fasttimer.h
# End Source File
# Begin Source File

SOURCE=..\Public\FileSystem.h
# End Source File
# Begin Source File

SOURCE=..\public\filesystem_helpers.h
# End Source File
# Begin Source File

SOURCE=..\public\fmtstr.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\FocusNavGroup.h
# End Source File
# Begin Source File

SOURCE=.\fontabc.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\func_dust_shared.h
# End Source File
# Begin Source File

SOURCE=.\fx.h
# End Source File
# Begin Source File

SOURCE=.\fx_blood.h
# End Source File
# Begin Source File

SOURCE=.\fx_discreetline.h
# End Source File
# Begin Source File

SOURCE=.\fx_envelope.h
# End Source File
# Begin Source File

SOURCE=.\fx_fleck.h
# End Source File
# Begin Source File

SOURCE=.\fx_impact.h
# End Source File
# Begin Source File

SOURCE=.\fx_line.h
# End Source File
# Begin Source File

SOURCE=.\fx_quad.h
# End Source File
# Begin Source File

SOURCE=.\fx_sparks.h
# End Source File
# Begin Source File

SOURCE=.\fx_staticline.h
# End Source File
# Begin Source File

SOURCE=..\Public\GameBSPFile.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\gamemovement.h
# End Source File
# Begin Source File

SOURCE=..\public\gametrace.h
# End Source File
# Begin Source File

SOURCE=..\public\globalvars_base.h
# End Source File
# Begin Source File

SOURCE=.\history_resource.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\hl2_player_shared.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\hl_movedata.h
# End Source File
# Begin Source File

SOURCE=.\hud.h
# End Source File
# Begin Source File

SOURCE=.\hud_chat.h
# End Source File
# Begin Source File

SOURCE=.\hud_element_helper.h
# End Source File
# Begin Source File

SOURCE=.\hud_macros.h
# End Source File
# Begin Source File

SOURCE=.\hudelement.h
# End Source File
# Begin Source File

SOURCE=.\hudtexturehandle.h
# End Source File
# Begin Source File

SOURCE=..\public\appframework\IAppSystem.h
# End Source File
# Begin Source File

SOURCE=.\iclassmap.h
# End Source File
# Begin Source File

SOURCE=..\Public\icliententity.h
# End Source File
# Begin Source File

SOURCE=.\IClientEntityInternal.h
# End Source File
# Begin Source File

SOURCE=..\Public\icliententitylist.h
# End Source File
# Begin Source File

SOURCE=..\public\engine\IClientLeafSystem.h
# End Source File
# Begin Source File

SOURCE=.\iclientmode.h
# End Source File
# Begin Source File

SOURCE=..\public\iclientnetworkable.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\IClientPanel.h
# End Source File
# Begin Source File

SOURCE=..\Public\iclientrenderable.h
# End Source File
# Begin Source File

SOURCE=..\public\iclientthinkable.h
# End Source File
# Begin Source File

SOURCE=..\public\iclientunknown.h
# End Source File
# Begin Source File

SOURCE=.\iclientvehicle.h
# End Source File
# Begin Source File

SOURCE=..\public\engine\ICollideable.h
# End Source File
# Begin Source File

SOURCE=..\public\vstdlib\ICommandLine.h
# End Source File
# Begin Source File

SOURCE=.\iconnectmsg.h
# End Source File
# Begin Source File

SOURCE=.\iconsole.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\icvar.h
# End Source File
# Begin Source File

SOURCE=.\idebugoverlaypanel.h
# End Source File
# Begin Source File

SOURCE=.\idownloadslider.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\IEffects.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\iefx.h
# End Source File
# Begin Source File

SOURCE=..\Public\engine\IEngineSound.h
# End Source File
# Begin Source File

SOURCE=..\public\engine\IEngineTrace.h
# End Source File
# Begin Source File

SOURCE=..\Public\ienginevgui.h
# End Source File
# Begin Source File

SOURCE=.\ifpspanel.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\igamemovement.h
# End Source File
# Begin Source File

SOURCE=..\public\IGameUIFuncs.h
# End Source File
# Begin Source File

SOURCE=..\public\ihandleentity.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\IHTML.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\IImage.h
# End Source File
# Begin Source File

SOURCE=.\iinput.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\IInput.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\IInputInternal.h
# End Source File
# Begin Source File

SOURCE=.\iloadingdisc.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\ILocalize.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\Image.h
# End Source File
# Begin Source File

SOURCE=..\Public\ImageLoader.h
# End Source File
# Begin Source File

SOURCE=..\public\materialsystem\imaterial.h
# End Source File
# Begin Source File

SOURCE=..\public\materialsystem\imaterialproxy.h
# End Source File
# Begin Source File

SOURCE=..\public\materialsystem\imaterialsystem.h
# End Source File
# Begin Source File

SOURCE=..\public\materialsystem\imaterialsystemhardwareconfig.h
# End Source File
# Begin Source File

SOURCE=..\public\materialsystem\imaterialvar.h
# End Source File
# Begin Source File

SOURCE=..\public\VGuiMatSurface\IMatSystemSurface.h
# End Source File
# Begin Source File

SOURCE=..\public\materialsystem\imesh.h
# End Source File
# Begin Source File

SOURCE=.\imessagechars.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\imovehelper.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\in_buttons.h
# End Source File
# Begin Source File

SOURCE=.\in_main.h
# End Source File
# Begin Source File

SOURCE=..\Public\inetgraph.h
# End Source File
# Begin Source File

SOURCE=.\inetgraphpanel.h
# End Source File
# Begin Source File

SOURCE=..\Public\INetworkStringTableClient.h
# End Source File
# Begin Source File

SOURCE=.\initializer.h
# End Source File
# Begin Source File

SOURCE=.\input.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\interface.h
# End Source File
# Begin Source File

SOURCE=.\interpolatedvar.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\interval.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\IPanel.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\iprediction.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\ipredictionsystem.h
# End Source File
# Begin Source File

SOURCE=.\iprofiling.h
# End Source File
# Begin Source File

SOURCE=..\public\irecipientfilter.h
# End Source File
# Begin Source File

SOURCE=..\public\isaverestore.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\IScheme.h
# End Source File
# Begin Source File

SOURCE=..\Public\iserverentity.h
# End Source File
# Begin Source File

SOURCE=..\public\iservernetworkable.h
# End Source File
# Begin Source File

SOURCE=..\Public\engine\IShadowMgr.h
# End Source File
# Begin Source File

SOURCE=..\Public\ISpatialPartition.h
# End Source File
# Begin Source File

SOURCE=..\public\engine\IStaticPropMgr.h
# End Source File
# Begin Source File

SOURCE=..\Public\IStudioRender.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\ISurface.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\ISystem.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\itempents.h
# End Source File
# Begin Source File

SOURCE=.\itextmessage.h
# End Source File
# Begin Source File

SOURCE=..\public\materialsystem\itexture.h
# End Source File
# Begin Source File

SOURCE=..\Public\engine\ivdebugoverlay.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\IVehicle.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\IVGui.h
# End Source File
# Begin Source File

SOURCE=..\Public\ivguicenterprint.h
# End Source File
# Begin Source File

SOURCE=.\ivieweffects.h
# End Source File
# Begin Source File

SOURCE=.\iviewrender.h
# End Source File
# Begin Source File

SOURCE=.\iviewrender_beams.h
# End Source File
# Begin Source File

SOURCE=..\public\engine\ivmodelinfo.h
# End Source File
# Begin Source File

SOURCE=..\Public\engine\IVModelRender.h
# End Source File
# Begin Source File

SOURCE=.\ivmodemanager.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\ivrenderview.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\kbutton.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\KeyCode.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\keydefs.h
# End Source File
# Begin Source File

SOURCE=..\public\KeyValues.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\Label.h
# End Source File
# Begin Source File

SOURCE=.\mat_stub.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\MATHLIB.H
# End Source File
# Begin Source File

SOURCE=..\Public\measure_section.h
# End Source File
# Begin Source File

SOURCE=..\public\tier0\mem.h
# End Source File
# Begin Source File

SOURCE=..\Public\mem_fgets.h
# End Source File
# Begin Source File

SOURCE=..\public\tier0\memalloc.h
# End Source File
# Begin Source File

SOURCE=..\public\tier0\memdbgoff.h
# End Source File
# Begin Source File

SOURCE=..\public\tier0\memdbgon.h
# End Source File
# Begin Source File

SOURCE=..\Public\MemPool.h
# End Source File
# Begin Source File

SOURCE=.\menu.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\MessageMap.h
# End Source File
# Begin Source File

SOURCE=..\Public\model_types.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\MouseCode.h
# End Source File
# Begin Source File

SOURCE=..\Public\mouthinfo.h
# End Source File
# Begin Source File

SOURCE=.\movehelper_client.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\movevars_shared.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\multiplay_gamerules.h
# End Source File
# Begin Source File

SOURCE=.\networkstringtable_clientdll.h
# End Source File
# Begin Source File

SOURCE=..\Public\NetworkStringTableDefs.h
# End Source File
# Begin Source File

SOURCE=..\public\networkvar.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\npcevent.h
# End Source File
# Begin Source File

SOURCE=..\Public\overlaytext.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\Panel.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\PanelAnimationVar.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\PanelListPanel.h
# End Source File
# Begin Source File

SOURCE=.\parsemsg.h
# End Source File
# Begin Source File

SOURCE=.\particle_prototype.h
# End Source File
# Begin Source File

SOURCE=.\particle_simple3D.h
# End Source File
# Begin Source File

SOURCE=.\particle_util.h
# End Source File
# Begin Source File

SOURCE=.\particledraw.h
# End Source File
# Begin Source File

SOURCE=.\particlemgr.h
# End Source File
# Begin Source File

SOURCE=.\particles_ez.h
# End Source File
# Begin Source File

SOURCE=.\particles_simple.h
# End Source File
# Begin Source File

SOURCE=.\ParticleSphereRenderer.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\PHandle.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\physdll.h
# End Source File
# Begin Source File

SOURCE=.\physics.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\physics_shared.h
# End Source File
# Begin Source File

SOURCE=..\Public\PixelWriter.h
# End Source File
# Begin Source File

SOURCE=..\Public\plane.h
# End Source File
# Begin Source File

SOURCE=..\public\tier0\platform.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\playernet_vars.h
# End Source File
# Begin Source File

SOURCE=..\public\PlayerState.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\predictable_entity.h
# End Source File
# Begin Source File

SOURCE=.\prediction.h
# End Source File
# Begin Source File

SOURCE=.\prediction_private.h
# End Source File
# Begin Source File

SOURCE=..\public\processor_detect.h
# End Source File
# Begin Source File

SOURCE=..\public\protected_things.h
# End Source File
# Begin Source File

SOURCE=..\Public\r_efx.h
# End Source File
# Begin Source File

SOURCE=.\ragdoll.h
# End Source File
# Begin Source File

SOURCE=.\ragdoll.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\ragdoll_shared.h
# End Source File
# Begin Source File

SOURCE=..\public\vstdlib\random.h
# End Source File
# Begin Source File

SOURCE=.\rendertexture.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\RichText.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\rope_helpers.h
# End Source File
# Begin Source File

SOURCE=..\Public\rope_physics.h
# End Source File
# Begin Source File

SOURCE=..\Public\rope_shared.h
# End Source File
# Begin Source File

SOURCE=..\Public\s3_intrf.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\saverestore_utlvector.h
# End Source File
# Begin Source File

SOURCE=..\public\saverestoretypes.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\scriptevent.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\ScrollBar.h
# End Source File
# Begin Source File

SOURCE=..\Public\sentence.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\serial_entity.h
# End Source File
# Begin Source File

SOURCE=..\Public\server_class.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\shake.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\shared_classnames.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\shareddefs.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\shareddefs.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\sharedInterface.h
# End Source File
# Begin Source File

SOURCE=..\Public\shattersurfacetypes.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\sheetsimulator.h
# End Source File
# Begin Source File

SOURCE=.\simple_keys.h
# End Source File
# Begin Source File

SOURCE=..\Public\simple_physics.h
# End Source File
# Begin Source File

SOURCE=..\public\smartptr.h
# End Source File
# Begin Source File

SOURCE=.\smoke_fog_overlay.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\solidsetdefaults.h
# End Source File
# Begin Source File

SOURCE=..\Public\soundflags.h
# End Source File
# Begin Source File

SOURCE=..\public\soundinfo.h
# End Source File
# Begin Source File

SOURCE=.\splinepatch.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\sprite.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\sprite.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\SpriteTrail.h
# End Source File
# Begin Source File

SOURCE=..\Public\string_t.h
# End Source File
# Begin Source File

SOURCE=..\Public\StringPool.h
# End Source File
# Begin Source File

SOURCE=..\public\vstdlib\strtools.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\studio.h
# End Source File
# Begin Source File

SOURCE=..\Public\surfinfo.h
# End Source File
# Begin Source File

SOURCE=.\TeamBitmapImage.h
# End Source File
# Begin Source File

SOURCE=.\tempent.h
# End Source File
# Begin Source File

SOURCE=.\..\game_shared\tempentity.h
# End Source File
# Begin Source File

SOURCE=..\Public\terrainmod.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\terrainmodmgr_shared.h
# End Source File
# Begin Source File

SOURCE=.\text_message.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\TextEntry.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\TextImage.h
# End Source File
# Begin Source File

SOURCE=..\Public\TGALoader.h
# End Source File
# Begin Source File

SOURCE=.\toggletextureproxy.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\touchlink.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\touchlist.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui_controls\TreeView.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\usercmd.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\util_shared.h
# End Source File
# Begin Source File

SOURCE=..\Public\utlbidirectionalset.h
# End Source File
# Begin Source File

SOURCE=..\Public\UtlBuffer.h
# End Source File
# Begin Source File

SOURCE=..\public\utlfixedlinkedlist.h
# End Source File
# Begin Source File

SOURCE=..\public\utlfixedmemory.h
# End Source File
# Begin Source File

SOURCE=..\Public\utllinkedlist.h
# End Source File
# Begin Source File

SOURCE=..\public\utlmap.h
# End Source File
# Begin Source File

SOURCE=..\Public\UtlMemory.h
# End Source File
# Begin Source File

SOURCE=..\Public\utlmultilist.h
# End Source File
# Begin Source File

SOURCE=..\Public\utlpriorityqueue.h
# End Source File
# Begin Source File

SOURCE=..\Public\utlrbtree.h
# End Source File
# Begin Source File

SOURCE=..\Public\utlsymbol.h
# End Source File
# Begin Source File

SOURCE=..\Public\UtlVector.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\vallocator.h
# End Source File
# Begin Source File

SOURCE=..\Public\vcollide.h
# End Source File
# Begin Source File

SOURCE=..\Public\vcollide_parse.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\vector.h
# End Source File
# Begin Source File

SOURCE=..\Public\vector2d.h
# End Source File
# Begin Source File

SOURCE=..\Public\vector4d.h
# End Source File
# Begin Source File

SOURCE=..\public\vgui\VGUI.h
# End Source File
# Begin Source File

SOURCE=.\vgui_BasePanel.h
# End Source File
# Begin Source File

SOURCE=.\vgui_BitmapImage.h
# End Source File
# Begin Source File

SOURCE=.\vgui_BitmapPanel.h
# End Source File
# Begin Source File

SOURCE=.\vgui_BudgetBarGraphPanel.h
# End Source File
# Begin Source File

SOURCE=.\vgui_BudgetHistoryPanel.h
# End Source File
# Begin Source File

SOURCE=.\vgui_BudgetPanel.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\vgui_defaultinputsignal.h
# End Source File
# Begin Source File

SOURCE=.\vgui_EntityImagePanel.h
# End Source File
# Begin Source File

SOURCE=.\vgui_EntityPanel.h
# End Source File
# Begin Source File

SOURCE=.\vgui_grid.h
# End Source File
# Begin Source File

SOURCE=.\tf2_hud\vgui_healthbar.h
# End Source File
# Begin Source File

SOURCE=.\vgui_helpers.h
# End Source File
# Begin Source File

SOURCE=.\vgui_ImageHealthPanel.h
# End Source File
# Begin Source File

SOURCE=.\vgui_int.h
# End Source File
# Begin Source File

SOURCE=.\vgui_scorepanel.h
# End Source File
# Begin Source File

SOURCE=.\vguicenterprint.h
# End Source File
# Begin Source File

SOURCE=.\view.h
# End Source File
# Begin Source File

SOURCE=.\view_scene.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\view_shared.h
# End Source File
# Begin Source File

SOURCE=.\ViewConeImage.h
# End Source File
# Begin Source File

SOURCE=.\viewrender.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\vmatrix.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\voice_banmgr.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\voice_common.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\voice_gamemgr.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\voice_status.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\vphysics_interface.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\vphysics_sound.h
# End Source File
# Begin Source File

SOURCE=.\..\Public\vplane.h
# End Source File
# Begin Source File

SOURCE=..\public\tier0\vprof.h
# End Source File
# Begin Source File

SOURCE=..\public\vstdlib\vstdlib.h
# End Source File
# Begin Source File

SOURCE=..\public\vtf\vtf.h
# End Source File
# Begin Source File

SOURCE=..\game_shared\weapon_parse.h
# End Source File
# Begin Source File

SOURCE=.\weapon_selection.h
# End Source File
# Begin Source File

SOURCE=.\weapons_resource.h
# End Source File
# Begin Source File

SOURCE=..\Public\worldsize.h
# End Source File
# End Group
# Begin Source File

SOURCE=..\lib\public\vgui_controls.lib
# End Source File
# Begin Source File

SOURCE=..\lib\common\s3tc.lib
# End Source File
# Begin Source File

SOURCE=..\lib\public\vstdlib.lib
# End Source File
# Begin Source File

SOURCE=..\lib\public\tier0.lib
# End Source File
# Begin Source File

SOURCE=..\lib\public\game_controls.lib
# End Source File
# End Target
# Begin Group "Header Files Platform"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# Begin Group "Shared Headers"

# PROP Default_Filter ""
# End Group
# Begin Group "Shared Source"

# PROP Default_Filter ""
# End Group
# End Project
