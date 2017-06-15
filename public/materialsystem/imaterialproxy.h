//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#ifndef IMATERIALPROXY_H
#define IMATERIALPROXY_H
#pragma once

#include "interface.h"

#define IMATERIAL_PROXY_INTERFACE_VERSION "_IMaterialProxy003"

class IMaterial;
class KeyValues;

class IMaterialProxy
{
public:
	virtual bool Init( IMaterial* pMaterial, KeyValues *pKeyValues ) = 0;
	virtual void OnBind( void * ) = 0;
	virtual void Release() = 0;

protected:
	// no one should call this directly
	virtual ~IMaterialProxy() {}
};

#endif // IMATERIALPROXY_H
