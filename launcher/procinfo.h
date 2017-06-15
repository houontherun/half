#ifndef PROCINFO_H
#define PROCINFO_H
#pragma once

#ifndef _WINDOWS_
#include <windows.h>
#endif

/***************************************************************************
;    Copyright (C) 1998 Intel Corp.
;    
;    Subject to the terms and conditions set forth below, Intel hereby 
;    grants you a nonexclusive, nontransferable license, to use, 
;    reproduce and distribute the example code sequences contained 
;    herein, in object code format, solely as part of your computer 
;    program(s) and solely in order to allow your computer program(s) to 
;    implement the multimedia instruction extensions contained in such 
;    sequences solely with respect to the Intel instruction set 
;    architecture.  No other license, express, implied, statutory, by 
;    estoppel or otherwise, to any other intellectual property rights is 
;    granted herein.
;    
;    ALL INFORMATION, SAMPLES AND OTHER MATERIALS PROVIDED HEREIN 
;    INCLUDING, WITHOUT LIMITATION, THE EXAMPLE CODE SEQUENCES ARE  
;    PROVIDED "AS IS" WITH NO WARRANTIES, EXPRESS, IMPLIED, STATUTORY OR 
;    OTHERWISE, AND INTEL SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF 
;    MERCHANTABILITY,  NONINFRINGEMENT OR FITNESS FOR ANY PARTICULAR 
;    PURPOSE.
;    
;    THE MATERIALS PROVIDED HEREIN ARE PROVIDED WITHOUT CHARGE. 
;    THEREFORE, IN NO EVENT WILL INTEL BE LIABLE FOR ANY DAMAGES OF ANY 
;    KIND, INCLUDING DIRECT OR INDIRECT DAMAGES, LOSS OF DATA, LOST 
;    PROFITS, COST OF COVER OR SPECIAL, INCIDENTAL, CONSEQUENTIAL, 
;    DAMAGES ARISING FROM THE USE OF THE MATERIALS PROVIDED HEREIN, 
;    INCLUDING WITHOUT LIMITATION THE EXAMPLE CODE SEQUENCES, HOWEVER 
;    CAUSED AND ON ANY THEORY OF LIABILITY.  THIS LIMITATION WILL APPLY 
;    EVEN IF INTEL OR ANY AUTHORIZED AGENT OF INTEL HAS BEEN ADVISED OF 
;    THE POSSIBILITY OF SUCH DAMAGE.
;
;***************************************************************************/

// sys_win.h file for processor info functions in procinfo.c

#if defined(__cplusplus)
extern "C" 
{
#endif

typedef unsigned __int64	QWORD;

#if _MSC_VER < 1200
#define CPUID _asm _emit 0fh _asm _emit 0a2h
#define EMMS _asm _emit 0fh _asm _emit 077h
#endif


#if defined(__cplusplus)
}
#endif

#endif
