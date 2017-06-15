//========= Copyright � 1996-2002, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================
#include "cbase.h"
#include "itempents.h"
#include "effect_dispatch_data.h"

// External definitions
void TE_ArmorRicochet( IRecipientFilter& filter, float delay,
	const Vector* pos, const Vector* dir );
void TE_BeamEntPoint( IRecipientFilter& filter, float delay,
	int	nStartEntity, const Vector *start, int nEndEntity, const Vector* end,
	int modelindex, int haloindex, int startframe, int framerate,
	float life, float width, float endWidth, int fadeLength, float amplitude, 
	int r, int g, int b, int a, int speed );
void TE_BeamEnts( IRecipientFilter& filter, float delay,
	int	start, int end, int modelindex, int haloindex, int startframe, int framerate,
	float life, float width, float endWidth, int fadeLength, float amplitude, 
	int r, int g, int b, int a, int speed );
void TE_BeamPoints( IRecipientFilter& filter, float delay,
	const Vector* start, const Vector* end, int modelindex, int haloindex, int startframe, int framerate,
	float life, float width, float endWidth, int fadeLength, float amplitude, 
	int r, int g, int b, int a, int speed );
void TE_BeamLaser( IRecipientFilter& filter, float delay,
	int	start, int end, int modelindex, int haloindex, int startframe, int framerate,
	float life, float width, float endWidth, int fadeLength, float amplitude, int r, int g, int b, int a, int speed );
void TE_BeamRing( IRecipientFilter& filter, float delay,
	int	start, int end, int modelindex, int haloindex, int startframe, int framerate,
	float life, float width, int spread, float amplitude, int r, int g, int b, int a, int speed );
void TE_BeamRingPoint( IRecipientFilter& filter, float delay,
	const Vector& center, float start_radius, float end_radius, int modelindex, int haloindex, int startframe, int framerate,
	float life, float width, int spread, float amplitude, int r, int g, int b, int a, int speed );
void TE_BeamSpline( IRecipientFilter& filter, float delay,
	int points, Vector* rgPoints );
void TE_BloodStream( IRecipientFilter& filter, float delay,
	const Vector* org, const Vector* dir, int r, int g, int b, int a, int amount );
void TE_BloodSprite( IRecipientFilter& filter, float delay,
	const Vector* org, const Vector *dir, int r, int g, int b, int a, int size );
void TE_BreakModel( IRecipientFilter& filter, float delay,
	const Vector* pos, const Vector* size, const Vector* vel, int modelindex, int randomization,
	int count, float time, int flags );
void TE_BSPDecal( IRecipientFilter& filter, float delay,
	const Vector* pos, int entity, int index );
void TE_Bubbles( IRecipientFilter& filter, float delay,
	const Vector* mins, const Vector* maxs, float height, int modelindex, int count, float speed );
void TE_BubbleTrail( IRecipientFilter& filter, float delay,
	const Vector* mins, const Vector* maxs, float height, int modelindex, int count, float speed );
void TE_Decal( IRecipientFilter& filter, float delay,
	const Vector* pos, const Vector* start, int entity, int hitbox, int index );
void TE_DynamicLight( IRecipientFilter& filter, float delay,
	const Vector* org, int r, int g, int b, int exponent, float radius, float time, float decay );
void TE_Explosion( IRecipientFilter& filter, float delay,
	const Vector* pos, int modelindex, float scale, int framerate, int flags, int radius, int magnitude, 
	const Vector* normal = NULL, unsigned char materialType = 'C' );
void TE_FogRipple( IRecipientFilter& filter, float delay,
	const Vector* pos,const Vector* velocity);
void TE_ShatterSurface( IRecipientFilter& filter, float delay,
	const Vector* pos, const QAngle* angle, const Vector* vForce, const Vector* vForcePos, 
	float width, float height, float shardsize, ShatterSurface_t surfacetype,
	int front_r, int front_g, int front_b, int back_r, int back_g, int back_b);
void TE_GlowSprite( IRecipientFilter& filter, float delay,
	const Vector* pos, int modelindex, float life, float size, int brightness );
void TE_FootprintDecal( IRecipientFilter& filter, float delay, const Vector* origin, const Vector* right, 
	int entity, int index, unsigned char materialType );
void TE_Fizz( IRecipientFilter& filter, float delay,
	const C_BaseEntity *ed, int modelindex, int density );
void TE_KillPlayerAttachments( IRecipientFilter& filter, float delay,
	int player );
void TE_LargeFunnel( IRecipientFilter& filter, float delay,
	const Vector* pos, int modelindex, int reversed );
void TE_MetalSparks( IRecipientFilter& filter, float delay,
	const Vector* pos, const Vector* dir );
void TE_EnergySplash( IRecipientFilter& filter, float delay,
	const Vector* pos, const Vector* dir, bool bExplosive );
void TE_PlayerDecal( IRecipientFilter& filter, float delay,
	const Vector* pos, int player, int entity );
void TE_ShowLine( IRecipientFilter& filter, float delay,
	const Vector* start, const Vector* end );
void TE_Smoke( IRecipientFilter& filter, float delay,
	const Vector* pos, int modelindex, float scale, int framerate );
void TE_Sparks( IRecipientFilter& filter, float delay,
	const Vector* pos, int nMagnitude, int nTrailLength, const Vector *pDir );
void TE_Sprite( IRecipientFilter& filter, float delay,
	const Vector* pos, int modelindex, float size, int brightness );
void TE_SpriteSpray( IRecipientFilter& filter, float delay,
	const Vector* pos, const Vector* dir, int modelindex, int speed, float noise, int count );
void TE_TextMessage( IRecipientFilter& filter, float delay,
	const struct hudtextparms_s *tp, const char *pMessage );
void TE_WorldDecal( IRecipientFilter& filter, float delay,
	const Vector* pos, int index );
void TE_MuzzleFlash( IRecipientFilter& filter, float delay,
	const Vector &start, const QAngle &angles, float scale, int type );
void TE_Dust( IRecipientFilter& filter, float delay,
			 const Vector &pos, const Vector &dir, float size, float speed );
void TE_GaussExplosion( IRecipientFilter& filter, float delayt,
			 const Vector &pos, const Vector &dir, int type );
void TE_DispatchEffect( IRecipientFilter& filter, float delay, 
			 const Vector &pos, const char *pName, const CEffectData &data );

class C_TempEntsSystem : public ITempEntsSystem
{
private:
	//-----------------------------------------------------------------------------
	// Purpose: Returning true means don't even call TE func
	// Input  : filter - 
	//			*suppress_host - 
	// Output : static bool
	//-----------------------------------------------------------------------------
	bool SuppressTE( IRecipientFilter& filter )
	{
		if ( !CanPredict() )
			return true;

		C_RecipientFilter& _filter = (( C_RecipientFilter & )filter);

		if ( !_filter.GetRecipientCount() )
		{
			// Suppress it
			return true;
		}

		// There's at least one recipient
		return false;
	}
public:

	virtual void ArmorRicochet( IRecipientFilter& filter, float delay,
		const Vector* pos, const Vector* dir )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_ArmorRicochet( filter, delay, pos, dir );
		}
	}

	virtual void BeamEntPoint( IRecipientFilter& filter, float delay,
		int	nStartEntity, const Vector *pStart, int nEndEntity, const Vector* pEnd,
		int modelindex, int haloindex, int startframe, int framerate,
		float life, float width, float endWidth, int fadeLength, float amplitude, 
		int r, int g, int b, int a, int speed )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BeamEntPoint( filter, delay, nStartEntity, pStart, nEndEntity, pEnd,
				modelindex, haloindex, startframe, framerate,
				life, width, endWidth, fadeLength, amplitude, r, g, b, a, speed );
		}
	}

	virtual void BeamEnts( IRecipientFilter& filter, float delay,
		int	start, int end, int modelindex, int haloindex, int startframe, int framerate,
		float life, float width, float endWidth, int fadeLength, float amplitude, 
		int r, int g, int b, int a, int speed )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BeamEnts( filter, delay,
				start, end, modelindex, haloindex, startframe, framerate,
				life, width, endWidth, fadeLength, amplitude, 
				r, g, b, a, speed );
		}
	}
	virtual void BeamPoints( IRecipientFilter& filter, float delay,
		const Vector* start, const Vector* end, int modelindex, int haloindex, int startframe, int framerate,
		float life, float width, float endWidth, int fadeLength, float amplitude, 
		int r, int g, int b, int a, int speed )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BeamPoints( filter, delay,
				start, end, modelindex, haloindex, startframe, framerate,
				life, width, endWidth, fadeLength, amplitude, 
				r, g, b, a, speed );
		}
	}
	virtual void BeamLaser( IRecipientFilter& filter, float delay,
		int	start, int end, int modelindex, int haloindex, int startframe, int framerate,
		float life, float width, float endWidth, int fadeLength, float amplitude, int r, int g, int b, int a, int speed )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BeamLaser( filter, delay,
				start, end, modelindex, haloindex, startframe, framerate,
				life, width, endWidth, fadeLength, amplitude, r, g, b, a, speed );
		}
	}
	virtual void BeamRing( IRecipientFilter& filter, float delay,
		int	start, int end, int modelindex, int haloindex, int startframe, int framerate,
		float life, float width, int spread, float amplitude, int r, int g, int b, int a, int speed )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BeamRing( filter, delay,
				start, end, modelindex, haloindex, startframe, framerate,
				life, width, spread, amplitude, r, g, b, a, speed );
		}
	}
	virtual void BeamRingPoint( IRecipientFilter& filter, float delay,
		const Vector& center, float start_radius, float end_radius, int modelindex, int haloindex, int startframe, int framerate,
		float life, float width, int spread, float amplitude, int r, int g, int b, int a, int speed )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BeamRingPoint( filter, delay,
				center, start_radius, end_radius, modelindex, haloindex, startframe, framerate,
				life, width, spread, amplitude, r, g, b, a, speed );
		}
	}
	virtual void BeamSpline( IRecipientFilter& filter, float delay,
		int points, Vector* rgPoints )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BeamSpline( filter, delay, points, rgPoints );
		}
	}
	virtual void BloodStream( IRecipientFilter& filter, float delay,
		const Vector* org, const Vector* dir, int r, int g, int b, int a, int amount )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BloodStream( filter, delay, org, dir, r, g, b, a, amount );
		}
	}
	virtual void BloodSprite( IRecipientFilter& filter, float delay,
		const Vector* org, const Vector *dir, int r, int g, int b, int a, int size )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BloodSprite( filter, delay, org, dir, r, g, b, a, size );
		}
	}
	virtual void BreakModel( IRecipientFilter& filter, float delay,
		const Vector* pos, const Vector* size, const Vector* vel, int modelindex, int randomization,
		int count, float time, int flags )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BreakModel( filter, delay, pos, size, vel, modelindex, randomization,
				count, time, flags );
		}
	}
	virtual void BSPDecal( IRecipientFilter& filter, float delay,
		const Vector* pos, int entity, int index )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BSPDecal( filter, delay, pos, entity, index );
		}
	}
	virtual void Bubbles( IRecipientFilter& filter, float delay,
		const Vector* mins, const Vector* maxs, float height, int modelindex, int count, float speed )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_Bubbles( filter, delay, mins, maxs, height, modelindex, count, speed );
		}
	}
	virtual void BubbleTrail( IRecipientFilter& filter, float delay,
		const Vector* mins, const Vector* maxs, float height, int modelindex, int count, float speed )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_BubbleTrail( filter, delay, mins, maxs, height, modelindex, count, speed );
		}
	}
	virtual void Decal( IRecipientFilter& filter, float delay,
		const Vector* pos, const Vector* start, int entity, int hitbox, int index )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_Decal( filter, delay, pos, start, entity, hitbox, index );
		}
	}
	virtual void DynamicLight( IRecipientFilter& filter, float delay,
		const Vector* org, int r, int g, int b, int exponent, float radius, float time, float decay )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_DynamicLight( filter, delay, org, r, g, b, exponent, radius, time, decay );
		}
	}
	virtual void Explosion( IRecipientFilter& filter, float delay,
		const Vector* pos, int modelindex, float scale, int framerate, int flags, int radius, int magnitude, const Vector* normal = NULL, unsigned char materialType = 'C' )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_Explosion( filter, delay, pos, modelindex, scale, framerate, flags, radius, magnitude, 
				normal, materialType );
		}
	}
	virtual void FogRipple( IRecipientFilter& filter, float delay,
		const Vector* pos,const Vector* velocity)
	{
		if ( !SuppressTE( filter ) )
		{
			TE_FogRipple( filter, delay, pos, velocity );
		}
	}
	virtual void ShatterSurface( IRecipientFilter& filter, float delay,
		const Vector* pos, const QAngle* angle, const Vector* vForce, const Vector* vForcePos, 
		float width, float height, float shardsize, ShatterSurface_t surfacetype,
		int front_r, int front_g, int front_b, int back_r, int back_g, int back_b)
	{
		if ( !SuppressTE( filter ) )
		{
			TE_ShatterSurface( filter, delay, pos, angle, vForce, vForcePos, 
				width, height, shardsize, surfacetype, front_r, front_g, front_b, back_r, back_g, back_b);
		}
	}
	virtual void GlowSprite( IRecipientFilter& filter, float delay,
		const Vector* pos, int modelindex, float life, float size, int brightness )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_GlowSprite( filter, delay, pos, modelindex, life, size, brightness );
		}
	}
	virtual void FootprintDecal( IRecipientFilter& filter, float delay, const Vector* origin, const Vector* right, 
		int entity, int index, unsigned char materialType )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_FootprintDecal( filter, delay, origin, right, 
				entity, index, materialType );
		}
	}
	virtual void Fizz( IRecipientFilter& filter, float delay,
		const C_BaseEntity *ed, int modelindex, int density )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_Fizz( filter, delay,
				ed, modelindex, density );
		}
	}
	virtual void KillPlayerAttachments( IRecipientFilter& filter, float delay,
		int player )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_KillPlayerAttachments( filter, delay, player );
		}
	}
	virtual void LargeFunnel( IRecipientFilter& filter, float delay,
		const Vector* pos, int modelindex, int reversed )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_LargeFunnel( filter, delay, pos, modelindex, reversed );
		}
	}
	virtual void MetalSparks( IRecipientFilter& filter, float delay,
		const Vector* pos, const Vector* dir )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_MetalSparks( filter, delay, pos, dir );
		}
	}
	virtual void EnergySplash( IRecipientFilter& filter, float delay,
		const Vector* pos, const Vector* dir, bool bExplosive )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_EnergySplash( filter, delay,
				pos, dir, bExplosive );
		}
	}
	virtual void PlayerDecal( IRecipientFilter& filter, float delay,
		const Vector* pos, int player, int entity )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_PlayerDecal( filter, delay,
				pos, player, entity );
		}
	}
	virtual void ShowLine( IRecipientFilter& filter, float delay,
		const Vector* start, const Vector* end )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_ShowLine( filter, delay,
				start, end );
		}
	}
	virtual void Smoke( IRecipientFilter& filter, float delay,
		const Vector* pos, int modelindex, float scale, int framerate )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_Smoke( filter, delay,
				pos, modelindex, scale, framerate );
		}
	}
	virtual void Sparks( IRecipientFilter& filter, float delay,
		const Vector* pos, int nMagnitude, int nTrailLength, const Vector *pDir )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_Sparks( filter, delay,
				pos, nMagnitude, nTrailLength, pDir );
		}
	}
	virtual void Sprite( IRecipientFilter& filter, float delay,
		const Vector* pos, int modelindex, float size, int brightness )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_Sprite( filter, delay,
				pos, modelindex, size, brightness );
		}
	}
	virtual void SpriteSpray( IRecipientFilter& filter, float delay,
		const Vector* pos, const Vector* dir, int modelindex, int speed, float noise, int count )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_SpriteSpray( filter, delay,
				pos, dir, modelindex, speed, noise, count );
		}
	}
	virtual void TextMessage( IRecipientFilter& filter, float delay,
		const struct hudtextparms_s *tp, const char *pMessage )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_TextMessage( filter, delay,
				tp, pMessage );
		}
	}	
	virtual void WorldDecal( IRecipientFilter& filter, float delay,
		const Vector* pos, int index )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_WorldDecal( filter, delay,
				pos, index );
		}
	}
	virtual void MuzzleFlash( IRecipientFilter& filter, float delay,
		const Vector &start, const QAngle &angles, float scale, int type )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_MuzzleFlash( filter, delay,
				start, angles, scale, type );
		}
	}
	virtual void Dust( IRecipientFilter& filter, float delay,
				 const Vector &pos, const Vector &dir, float size, float speed )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_Dust( filter, delay,
				pos, dir, size, speed );
		}
	}
	virtual void GaussExplosion( IRecipientFilter& filter, float delay,
				const Vector &pos, const Vector &dir, int type )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_GaussExplosion( filter, delay, pos, dir, type );
		}
	}
	virtual void DispatchEffect( IRecipientFilter& filter, float delay,
				const Vector &pos, const char *pName, const CEffectData &data )
	{
		if ( !SuppressTE( filter ) )
		{
			TE_DispatchEffect( filter, delay, pos, pName, data );
		}
	}
};

static C_TempEntsSystem g_TESystem;
// Expose to rest of engine
ITempEntsSystem *te = &g_TESystem;