//========= Copyright � 1996-2003, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
//=============================================================================

#ifndef PARTICLES_EZ_H
#define PARTICLES_EZ_H
#ifdef _WIN32
#pragma once
#endif


#include "particles_simple.h"


// Use these to fire and forget particles.
// pParticle should be ON THE STACK - ie: don't allocate it from a CSimpleEmitter or from the particle manager.
// Just make one on the stack, fill in its parameters, and pass it in here.
void AddSimpleParticle( const SimpleParticle *pParticle, PMaterialHandle hMaterial );
void AddEmberParticle( const SimpleParticle *pParticle, PMaterialHandle hMaterial );
void AddFireSmokeParticle( const SimpleParticle *pParticle, PMaterialHandle hMaterial );
void AddFireParticle( const SimpleParticle *pParticle, PMaterialHandle hMaterial );
void AddLitSmokeParticle( const CLitSmokeEmitter::LitSmokeParticle *pParticle, PMaterialHandle hMaterial );


// Called by the renderer to draw all the particles.
void DrawParticleSingletons();


#endif // PARTICLES_EZ_H
