# Microsoft Developer Studio Project File - Name="vtex_dll" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=vtex_dll - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "vtex_dll.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "vtex_dll.mak" CFG="vtex_dll - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "vtex_dll - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "vtex_dll - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/Src/utils/vtex", UYVDAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "vtex_dll - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "vtex_dll___Win32_Release"
# PROP BASE Intermediate_Dir "vtex_dll___Win32_Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "vtex_dll___Win32_Release"
# PROP Intermediate_Dir "vtex_dll___Win32_Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "VTEX_DLL_EXPORTS" /YX /FD /c
# ADD CPP /nologo /G6 /W4 /Zi /O2 /I "..\..\public" /I "..\..\common" /I "..\..\common\materialsystem" /I "..\common" /D "NDEBUG" /D "TGAWRITER_USE_FOPEN" /D "TGALOADER_USE_FOPEN" /D "VTEX_DLL" /D "_WIN32" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "VTEX_DLL_EXPORTS" /D "PROTECTED_THINGS_DISABLE" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 s3tc.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /map /debug /machine:I386 /nodefaultlib:"libcd" /libpath:"..\..\lib\public\\" /libpath:"..\..\lib\common\\"
# SUBTRACT LINK32 /nodefaultlib
# Begin Custom Build
TargetDir=.\vtex_dll___Win32_Release
TargetPath=.\vtex_dll___Win32_Release\vtex_dll.dll
InputPath=.\vtex_dll___Win32_Release\vtex_dll.dll
SOURCE="$(InputPath)"

"..\..\..\bin\vtex.dll" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	if exist ..\..\..\bin\vtex.dll attrib -r ..\..\..\bin\vtex.dll 
	copy $(TargetPath) ..\..\..\bin\vtex.dll 
	if exist $(TargetDir)\vtex.map copy $(TargetDir)\vtex.map ..\..\bin\vtex.map 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "vtex_dll - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "vtex_dll___Win32_Debug"
# PROP BASE Intermediate_Dir "vtex_dll___Win32_Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "vtex_dll___Win32_Debug"
# PROP Intermediate_Dir "vtex_dll___Win32_Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "VTEX_DLL_EXPORTS" /YX /FD /GZ /c
# ADD CPP /nologo /G6 /W4 /Gm /ZI /Od /I "..\..\public" /I "..\..\common" /I "..\..\common\materialsystem" /I "..\common" /D "_DEBUG" /D "TGAWRITER_USE_FOPEN" /D "TGALOADER_USE_FOPEN" /D "VTEX_DLL" /D "_WIN32" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "VTEX_DLL_EXPORTS" /D "PROTECTED_THINGS_DISABLE" /FR /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 s3tc.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /nodefaultlib:"libc" /pdbtype:sept /libpath:"..\..\lib\public\\" /libpath:"..\..\lib\common\\"
# Begin Custom Build
TargetDir=.\vtex_dll___Win32_Debug
TargetPath=.\vtex_dll___Win32_Debug\vtex_dll.dll
InputPath=.\vtex_dll___Win32_Debug\vtex_dll.dll
SOURCE="$(InputPath)"

"..\..\..\bin\vtex.dll" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	if exist ..\..\..\bin\vtex.dll attrib -r ..\..\..\bin\vtex.dll 
	copy $(TargetPath) ..\..\..\bin\vtex.dll 
	if exist $(TargetDir)\vtex.map copy $(TargetDir)\vtex.map ..\..\bin\vtex.map 
	
# End Custom Build

!ENDIF 

# Begin Target

# Name "vtex_dll - Win32 Release"
# Name "vtex_dll - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\..\public\characterset.cpp
# End Source File
# Begin Source File

SOURCE=..\common\cmdlib.cpp
# End Source File
# Begin Source File

SOURCE=..\..\public\filesystem_helpers.cpp
# End Source File
# Begin Source File

SOURCE=..\..\public\filesystem_tools.cpp
# End Source File
# Begin Source File

SOURCE=..\..\Public\ImageLoader.cpp
# End Source File
# Begin Source File

SOURCE=..\..\Public\interface.cpp
# End Source File
# Begin Source File

SOURCE=..\..\Public\Mathlib.cpp
# End Source File
# Begin Source File

SOURCE=..\..\Public\TGALoader.cpp
# End Source File
# Begin Source File

SOURCE=..\..\Public\TGAWriter.cpp
# End Source File
# Begin Source File

SOURCE=..\..\Public\UtlBuffer.cpp
# End Source File
# Begin Source File

SOURCE=.\vtex.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=..\..\Public\ivtex.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# Begin Source File

SOURCE=..\..\lib\public\vtf.lib
# End Source File
# Begin Source File

SOURCE=..\..\lib\public\vstdlib.lib
# End Source File
# Begin Source File

SOURCE=..\..\lib\public\tier0.lib
# End Source File
# End Target
# End Project
