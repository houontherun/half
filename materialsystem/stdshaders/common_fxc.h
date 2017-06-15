#include "common_hlsl_cpp_consts.h"

#ifdef NV3X
#	define HALF half
#	define HALF2 half2
#	define HALF3 half3
#	define HALF4 half4
#	define HALF3x3 half3x3
#	define HALF3x4 half3x4
#	define HALF4x3 half4x3
#	define HALF_CONSTANT( _constant )	((HALF)_constant)
#else
#	define HALF float
#	define HALF2 float2
#	define HALF3 float3
#	define HALF4 float4
#	define HALF3x3 float3x3
#	define HALF3x4 float3x4
#	define HALF4x3 float4x3
#	define HALF_CONSTANT( _constant )	_constant
#endif

// This is where all common code for both vertex and pixel shaders.
#define OO_SQRT_3 0.57735025882720947f
static const HALF3 bumpBasis[3] = {
	HALF3( 0.81649661064147949f, 0.0f, OO_SQRT_3 ),
	HALF3(  -0.40824833512306213f, 0.70710676908493042f, OO_SQRT_3 ),
	HALF3(  -0.40824821591377258f, -0.7071068286895752f, OO_SQRT_3 )
};
static const HALF3 bumpBasisTranspose[3] = {
	HALF3( 0.81649661064147949f, -0.40824833512306213f, -0.40824833512306213f ),
	HALF3(  0.0f, 0.70710676908493042f, -0.7071068286895752f ),
	HALF3(  OO_SQRT_3, OO_SQRT_3, OO_SQRT_3 )
};

HALF3 CalcReflectionVectorNormalized( HALF3 normal, HALF3 eyeVector )
{
	// FIXME: might be better of normalizing with a normalizing cube map and
	// get rid of the dot( normal, normal )
	// compute reflection vector r = 2 * ((n dot v)/(n dot n)) n - v
	return 2.0 * ( dot( normal, eyeVector ) / dot( normal, normal ) ) * normal - eyeVector;
}

HALF3 CalcReflectionVectorUnnormalized( HALF3 normal, HALF3 eyeVector )
{
	// FIXME: might be better of normalizing with a normalizing cube map and
	// get rid of the dot( normal, normal )
	// compute reflection vector r = 2 * ((n dot v)/(n dot n)) n - v
	//  multiply all values through by N.N.  uniformly scaling reflection vector won't affect result
	//  since it is used in a cubemap lookup
	return (2.0*(dot( normal, eyeVector ))*normal) - (dot( normal, normal )*eyeVector);
}

float3 HuePreservingColorClamp( float3 c )
{
	// Get the max of all of the color components and a specified maximum amount
	float maximum = max( max( c.x, c.y ), max( c.z, 1.0f ) );

	return (c / maximum);
}


#if (AA_CLAMP==1)
HALF2 ComputeLightmapCoordinates( HALF4 Lightmap1and2Coord, HALF2 Lightmap3Coord ) 
{
    HALF2 result = saturate(Lightmap1and2Coord.xy) * Lightmap1and2Coord.wz * 0.99;
    result += Lightmap3Coord;
    return result;
}

void ComputeBumpedLightmapCoordinates( HALF4 Lightmap1and2Coord, HALF2 Lightmap3Coord,
									  out HALF2 bumpCoord1,
									  out HALF2 bumpCoord2,
									  out HALF2 bumpCoord3 ) 
{
    HALF2 result = saturate(Lightmap1and2Coord.xy) * Lightmap1and2Coord.wz * 0.99;
    result += Lightmap3Coord;
    bumpCoord1 = result + HALF2(Lightmap1and2Coord.z, 0);
    bumpCoord2 = result + 2*HALF2(Lightmap1and2Coord.z, 0);
    bumpCoord3 = result + 3*HALF2(Lightmap1and2Coord.z, 0);
}
#else
HALF2 ComputeLightmapCoordinates( HALF4 Lightmap1and2Coord, HALF2 Lightmap3Coord ) 
{
    return Lightmap1and2Coord.xy;
}

void ComputeBumpedLightmapCoordinates( HALF4 Lightmap1and2Coord, HALF2 Lightmap3Coord,
									  out HALF2 bumpCoord1,
									  out HALF2 bumpCoord2,
									  out HALF2 bumpCoord3 ) 
{
    bumpCoord1 = Lightmap1and2Coord.xy;
    bumpCoord2 = Lightmap1and2Coord.wz; // reversed order!!!
    bumpCoord3 = Lightmap3Coord.xy;
}
#endif

// Versions of matrix multiply functions which force HLSL compiler to explictly use DOTs, 
// not giving it the option of using MAD expansion.  In a perfect world, the compiler would
// always pick the best strategy, and these shouldn't be needed.. but.. well.. umm..
//
// lorenmcq

float3 mul3x3(float3 v, float3x3 m)
{
    return float3(dot(v, transpose(m)[0]), dot(v, transpose(m)[1]), dot(v, transpose(m)[2]));
}

float3 mul4x3(float4 v, float4x3 m)
{
    return float3(dot(v, transpose(m)[0]), dot(v, transpose(m)[1]), dot(v, transpose(m)[2]));
}

