//========= Copyright � 1996-2002, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#include "BaseVSShader.h"

// FIMXE!!!!!!!!!!!!!!!!!
// FIXME!!!!!!!!!!!!!!!!!  This is defined in multiple places.
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// FIMXE!!!!!!!!!!!!!!!!!
// GR - limits for blured image (HDR stuff)
#define MAX_BLUR_IMAGE_WIDTH  256
#define MAX_BLUR_IMAGE_HEIGHT 192

#define CLAMP_BLUR_IMAGE_WIDTH( _w ) ( ( _w < MAX_BLUR_IMAGE_WIDTH ) ? _w : MAX_BLUR_IMAGE_WIDTH )
#define CLAMP_BLUR_IMAGE_HEIGHT( _h ) ( ( _h < MAX_BLUR_IMAGE_HEIGHT ) ? _h : MAX_BLUR_IMAGE_HEIGHT )

BEGIN_VS_SHADER( BlurFilterY, "Help for BlurFilterY" )
	BEGIN_SHADER_PARAMS
		SHADER_PARAM( FRAMETEXTURE, SHADER_PARAM_TYPE_TEXTURE, "", "" )
	END_SHADER_PARAMS

	SHADER_INIT
	{
		if( params[FRAMETEXTURE]->IsDefined() )
		{
			LoadTexture( FRAMETEXTURE );
		}
	}
	
	SHADER_FALLBACK
	{
		// Requires DX9 + above
		if ( g_pHardwareConfig->GetDXSupportLevel() < 90 )
			return "Wireframe";
		return 0;
	}

	SHADER_DRAW
	{
		SHADOW_STATE
		{
			pShaderShadow->EnableDepthWrites( false );
			pShaderShadow->EnableAlphaWrites( true );

			pShaderShadow->EnableTexture( SHADER_TEXTURE_STAGE0, true );
			int fmt = VERTEX_POSITION;
			pShaderShadow->VertexShaderVertexFormat( fmt, 1, 0, 0, 0 );

			// Pre-cache shaders
			pShaderShadow->SetVertexShader( "BlurFilter_vs20" );
			pShaderShadow->SetPixelShader( "BlurFilter_ps20", 0 );
		}

		DYNAMIC_STATE
		{
			BindTexture( SHADER_TEXTURE_STAGE0, FRAMETEXTURE, -1 );

			int width, height;
			pShaderAPI->GetBackBufferDimensions( width, height );

			float v[4];

			// The temp buffer is 1/4 back buffer size
			float dY = 1.0f / CLAMP_BLUR_IMAGE_HEIGHT( height / 4.0f );

			// Tap offsets
			v[0] = 0.0f;
			v[1] = 1.3366f * dY;
			pShaderAPI->SetVertexShaderConstant( 90, v, 1 );
			v[0] = 0.0f;
			v[1] = 3.4295f * dY;
			pShaderAPI->SetVertexShaderConstant( 91, v, 1 );
			v[0] = 0.0f;
			v[1] = 5.4264f * dY;
			pShaderAPI->SetVertexShaderConstant( 92, v, 1 );

			v[0] = 0.0f;
			v[1] = 7.4359f * dY;
			pShaderAPI->SetPixelShaderConstant( 0, v, 1 );
			v[0] = 0.0f;
			v[1] = 9.4436f * dY;
			pShaderAPI->SetPixelShaderConstant( 1, v, 1 );
			v[0] = 0.0f;
			v[1] = 11.4401f * dY;
			pShaderAPI->SetPixelShaderConstant( 2, v, 1 );
		}
		Draw();
	}
END_SHADER
