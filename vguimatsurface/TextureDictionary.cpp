//======== (C) Copyright 1999, 2000 Valve, L.L.C. All rights reserved. ========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//
// Purpose: Contains all texture state for the material system surface to use
//
// $Revision: $
// $NoKeywords: $
//=============================================================================

#include "TextureDictionary.h"
#include "UtlLinkedList.h"
#include "checksum_crc.h"
#include "materialsystem/IMaterial.h"
#include "VguiMatSurface.h"
#include "materialsystem/IMaterialSystem.h"
#include "tier0/dbg.h"

#include "PixelWriter.h"
#include "materialsystem/IMaterialVar.h"
#include "materialsystem/ITexture.h"
#include "vtf/vtf.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"

#define TEXTURE_ID_UNKNOWN	-1

class CMatSystemTexture;

// Case-sensitive string checksum
static CRC32_t Texture_CRCName( const char *string )
{
	CRC32_t crc;
	
	CRC32_Init( &crc );
	CRC32_ProcessBuffer( &crc, (void *)string, strlen( string ) );
	CRC32_Final( &crc );

	return crc;
}

class CFontTextureRegen;

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
class CMatSystemTexture
{
public:
	CMatSystemTexture( void );
	~CMatSystemTexture( void );

	void SetId( int id ) { m_ID = id; };

	CRC32_t		GetCRC() const;
	void SetCRC( CRC32_t val );

	void SetMaterial( const char *pFileName );
	void SetMaterial( IMaterial *pMaterial );

	// This is used when we want different rendering state sharing the same procedural texture (fonts)
	void ReferenceOtherProcedural( CMatSystemTexture *pTexture, IMaterial *pMaterial );

	IMaterial *GetMaterial() { return m_pMaterial; }
	int Width() const { return m_iWide; }
	int Height() const { return m_iTall; }

	bool IsProcedural( void ) const;
	void SetProcedural( bool proc );

 	bool IsReference() const { return m_Flags & TEXTURE_IS_REFERENCE; }

	void SetTextureRGBA( const char* rgba,int wide,int tall );
	void SetSubTextureRGBA( int drawX, int drawY, unsigned const char *rgba, int subTextureWide, int subTextureTall );

	float	m_s0, m_t0, m_s1, m_t1;

private:
	void CreateRegen( int nWidth, int nHeight );
	void ReleaseRegen( void );
	void CleanUpMaterial();

	ITexture *GetTextureValue( void );

private:
	enum
	{
		TEXTURE_IS_PROCEDURAL = 0x1,
		TEXTURE_IS_REFERENCE = 0x2
	};

	CRC32_t		m_crcFile;
	IMaterial	*m_pMaterial;
	ITexture	*m_pTexture;
	int			m_iWide, m_iTall;
	int			m_ID;

	int			m_Flags;
	CFontTextureRegen *m_pRegen;
};


//-----------------------------------------------------------------------------
// A class that manages textures used by the material system surface
//-----------------------------------------------------------------------------
class CTextureDictionary : public ITextureDictionary
{
public:
	CTextureDictionary( void );

	// Create, destroy textures
	int	CreateTexture( bool procedural = false );
	void DestroyTexture( int id );
	void DestroyAllTextures();

	// Is this a valid id?
	bool IsValidId( int id ) const;

	// Binds a material to a texture
	virtual void BindTextureToFile( int id, const char *pFileName );
	virtual void BindTextureToMaterial( int id, IMaterial *pMaterial );
	virtual void BindTextureToMaterialReference( int id, int referenceId, IMaterial *pMaterial );

	// Texture info
	IMaterial *GetTextureMaterial( int id );
	void GetTextureSize(int id, int& iWide, int& iTall );
	void GetTextureTexCoords( int id, float &s0, float &t0, float &s1, float &t1 );

	void SetTextureRGBA( int id, const char* rgba,int wide,int tall );
	void SetSubTextureRGBA( int id, int drawX, int drawY, unsigned const char *rgba, int subTextureWide, int subTextureTall );

	int	FindTextureIdForTextureFile( char const *pFileName );

public:

	CMatSystemTexture	*GetTexture( int id );

private:
	CUtlLinkedList< CMatSystemTexture, unsigned short >	m_Textures;
};

static CTextureDictionary s_TextureDictionary;


//-----------------------------------------------------------------------------
// A texture regenerator that holds onto the bits at all times
//-----------------------------------------------------------------------------
class CFontTextureRegen : public ITextureRegenerator
{
public:
	CFontTextureRegen( int nWidth, int nHeight )
	{
		int nSizeBytes = nWidth * nHeight * 4;
		m_pTextureBits = new unsigned char[ nSizeBytes ];
		memset( m_pTextureBits, 0, nSizeBytes );
		m_nWidth = nWidth;

#ifdef _DEBUG
		m_nHeight = nHeight;
#endif
	}

	~CFontTextureRegen( void )
	{
		DeleteTextureBits();
	}

	void UpdateBackingBits( Rect_t &subRect, const unsigned char *pBits )
	{
		if (!m_pTextureBits)
			return;

		// Copy subrect into backing bits storage
		Assert( (subRect.x >= 0) && (subRect.y >= 0) );
		Assert( (subRect.x + subRect.width <= m_nWidth) && (subRect.y + subRect.height <= m_nHeight) );

		int x, y;
		for( y=0; y < subRect.height; ++y )
		{
			int idx = ( (subRect.y + y) * m_nWidth + subRect.x ) << 2;
			unsigned int *pDst = (unsigned int*)(&m_pTextureBits[ idx ]);
			const unsigned int *pSrc = (const unsigned int *)(&pBits[ (y * subRect.width) << 2 ]);

			for( x=0; x < subRect.width; ++x )
			{
				*pDst++ = *pSrc++;
			}
		}
	}

	virtual void RegenerateTextureBits( ITexture *pTexture, IVTFTexture *pVTFTexture, Rect_t *pSubRect )
	{
		if (!m_pTextureBits)
			return;

		Assert( (pVTFTexture->Width() == m_nWidth) && (pVTFTexture->Height() == m_nHeight) );

		CPixelWriter pixelWriter;
		pixelWriter.SetPixelMemory( pVTFTexture->Format(), 
			pVTFTexture->ImageData( 0, 0, 0 ), pVTFTexture->RowSizeInBytes( 0 ) );

		// Now upload the part we've been asked for
		int xmax = pSubRect->x + pSubRect->width;
		int ymax = pSubRect->y + pSubRect->height;
		int x, y;

		for( y = pSubRect->y; y < ymax; ++y )
		{
 			pixelWriter.Seek( pSubRect->x, y );
			unsigned char *rgba = &m_pTextureBits[ (y * m_nWidth + pSubRect->x) << 2 ];

			for( x=pSubRect->x; x < xmax; ++x )
			{
				pixelWriter.WritePixel( rgba[0], rgba[1], rgba[2], rgba[3] );
				rgba += 4;
			}
		}
	}

	virtual void Release()
	{
		// Called by the material system when this needs to go away
		DeleteTextureBits();
	}

	void DeleteTextureBits()
	{
		if (m_pTextureBits)
		{
			delete[] m_pTextureBits;
			m_pTextureBits = NULL;
		}
	}

private:
	unsigned char *m_pTextureBits;
	int	m_nWidth;

#ifdef _DEBUG
	int m_nHeight;
#endif
};


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CMatSystemTexture::CMatSystemTexture( void )
{
	m_pMaterial = NULL;
	m_pTexture = NULL;
	m_crcFile = (CRC32_t)0;
	m_iWide = m_iTall = 0;
	m_s0 = m_t0 = 0;
	m_s1 = m_t1 = 1;

	m_Flags = 0;
	m_pRegen = NULL;
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CMatSystemTexture::~CMatSystemTexture( void )
{
	CleanUpMaterial();
}

bool CMatSystemTexture::IsProcedural( void ) const
{
	return (m_Flags & TEXTURE_IS_PROCEDURAL) != 0;
}

void CMatSystemTexture::SetProcedural( bool proc )
{
	if (proc)
	{
		m_Flags |= TEXTURE_IS_PROCEDURAL;
	}
	else
	{
		m_Flags &= ~TEXTURE_IS_PROCEDURAL;
	}
}

void CMatSystemTexture::CleanUpMaterial()
{
	if ( m_pTexture )
	{
		m_pTexture->SetTextureRegenerator( NULL );
		m_pTexture->DecrementReferenceCount();
		m_pTexture = NULL;
	}
	if ( m_pMaterial )
	{
		m_pMaterial->DecrementReferenceCount();
		m_pMaterial = NULL;
	}
	ReleaseRegen();
}

void CMatSystemTexture::CreateRegen( int nWidth, int nHeight )
{
	Assert( IsProcedural() );

	if ( !m_pRegen )
	{
		m_pRegen = new CFontTextureRegen( nWidth, nHeight );
	}
}

void CMatSystemTexture::ReleaseRegen( void )
{
	if (m_pRegen)
	{
		if (!IsReference())
		{
			delete m_pRegen;
		}

		m_pRegen = NULL;
	}
}

void CMatSystemTexture::SetTextureRGBA( const char* rgba,int wide,int tall )
{
	Assert( IsProcedural() );
	if ( !IsProcedural() )
		return;

	Assert( wide == m_iWide );
	Assert( tall == m_iTall );

	// Just replace the whole thing
	SetSubTextureRGBA( 0, 0, (const unsigned char *)rgba, wide, tall );
}

//-----------------------------------------------------------------------------
// Purpose: 
// Output : ITexture
//-----------------------------------------------------------------------------
ITexture *CMatSystemTexture::GetTextureValue( void )
{
	Assert( IsProcedural() );
	if ( !m_pMaterial )
		return NULL;

	return m_pTexture;
}

void CMatSystemTexture::SetSubTextureRGBA( int drawX, int drawY, unsigned const char *rgba, int subTextureWide, int subTextureTall )
{
	ITexture *pTexture = GetTextureValue();
	if ( !pTexture )
		return;

	Assert( IsProcedural() );
	if ( !IsProcedural() )
		return;

	Assert( drawX < m_iWide );
	Assert( drawY < m_iTall );
	Assert( drawX + subTextureWide <= m_iWide );
	Assert( drawY + subTextureTall <= m_iTall );

	Assert( m_pRegen );

	Assert( rgba );

	Rect_t subRect;
	subRect.x = drawX;
	subRect.y = drawY;
	subRect.width = subTextureWide;
	subRect.height = subTextureTall;
	
	m_pRegen->UpdateBackingBits( subRect, rgba );
	pTexture->Download( &subRect );
}

void CMatSystemTexture::SetCRC( CRC32_t val )
{
	m_crcFile = val;
}

CRC32_t CMatSystemTexture::GetCRC() const
{ 
	return m_crcFile; 
}

void CMatSystemTexture::SetMaterial( IMaterial *pMaterial )
{
	// Decrement references to old texture
	CleanUpMaterial();

	m_pMaterial = pMaterial;

	if (!m_pMaterial)
	{
		m_iWide = m_iTall = 0;
		m_s0 = m_t0 = 0.0f;
		m_s1 = m_t1 = 1.0f;
		return;
	}

	// Increment its reference count
	m_pMaterial->IncrementReferenceCount();

	// Compute texture size
	m_iWide = m_pMaterial->GetMappingWidth();
	m_iTall = m_pMaterial->GetMappingHeight();

	// Compute texture coordinates
	float flPixelCenterX = 0.0f;
	float flPixelCenterY = 0.0f;

	if ( m_iWide > 0.0f && m_iTall > 0.0f)
	{
		flPixelCenterX = 0.5f / m_iWide;
		flPixelCenterY = 0.5f / m_iTall;
	}

	m_s0 = flPixelCenterX;
	m_t0 = flPixelCenterY;

	// FIXME: Old code used +, it should be - yes?!??!
	m_s1 = 1.0 - flPixelCenterX;
	m_t1 = 1.0 - flPixelCenterY;

	if ( IsProcedural() )
	{
		bool bFound;
		IMaterialVar *tv = m_pMaterial->FindVar( "$baseTexture", &bFound );
		if ( bFound )
		{
			m_pTexture = tv->GetTextureValue();
			if ( m_pTexture )
			{
				m_pTexture->IncrementReferenceCount();

				// Upload new data
				CreateRegen( m_iWide, m_iTall );
				m_pTexture->SetTextureRegenerator( m_pRegen );
			}
		}
	}
}

// This is used when we want different rendering state sharing the same procedural texture (fonts)
void CMatSystemTexture::ReferenceOtherProcedural( CMatSystemTexture *pTexture, IMaterial *pMaterial )
{
	Assert( pTexture->IsProcedural() );

	m_Flags |= TEXTURE_IS_REFERENCE;

	m_pMaterial = pMaterial;
	m_iWide = pTexture->m_iWide;
	m_iTall = pTexture->m_iTall;
	m_s0 = pTexture->m_s0;
	m_t0 = pTexture->m_t0;
	m_s1 = pTexture->m_s1;
	m_t1 = pTexture->m_t1;

	Assert( (pMaterial->GetMappingWidth() == m_iWide) && (pMaterial->GetMappingHeight() == m_iTall) );

	bool bFound;
	IMaterialVar *tv = m_pMaterial->FindVar( "$baseTexture", &bFound );
	if ( bFound )
	{
		m_pTexture = tv->GetTextureValue();
		if ( m_pTexture )
		{
			m_pTexture->IncrementReferenceCount();
			Assert( m_pTexture == pTexture->m_pTexture );

			// Reference, but do *not* create a new one!!!
			m_pRegen = pTexture->m_pRegen;
		}
	}
}

void CMatSystemTexture::SetMaterial( const char *pFileName )
{
	// Get a pointer to the new material
	bool bFound;
	IMaterial *pMaterial = g_pMaterialSystem->FindMaterial( pFileName, &bFound );

	if ( !bFound )
	{
		Msg( "--- Missing Vgui material %s\n", pFileName );
	}

	SetMaterial( pMaterial );
}

//-----------------------------------------------------------------------------
// Singleton instance
//-----------------------------------------------------------------------------
ITextureDictionary *TextureDictionary()
{
	return &s_TextureDictionary;
}

CTextureDictionary::CTextureDictionary( void )
{
	// First entry is bogus texture
	m_Textures.AddToTail();
}

//-----------------------------------------------------------------------------
// Create, destroy textures
//-----------------------------------------------------------------------------
int	CTextureDictionary::CreateTexture( bool procedural /*=false*/ )
{
	int idx = m_Textures.AddToTail();
	CMatSystemTexture &texture = m_Textures[idx];
	texture.SetProcedural( procedural );
	texture.SetId( idx );

	return idx;
}

void CTextureDictionary::DestroyTexture( int id )
{
	if (id != INVALID_TEXTURE_ID)
	{
		Assert( id != m_Textures.InvalidIndex() );
		m_Textures.Remove((unsigned short)id);
	}
}

void CTextureDictionary::DestroyAllTextures()
{
	m_Textures.RemoveAll();
	// First entry is bogus texture
	m_Textures.AddToTail();	
	CMatSystemTexture &texture = m_Textures[0];
	texture.SetId( 0 );
}

void CTextureDictionary::SetTextureRGBA( int id, const char* rgba,int wide,int tall )
{
	if (!IsValidId(id))
	{
		Msg( "SetTextureRGBA: Invalid texture id %i\n", id );
		return;
	}
	CMatSystemTexture &texture = m_Textures[id];
	texture.SetTextureRGBA( rgba, wide, tall );

}

void CTextureDictionary::SetSubTextureRGBA( int id, int drawX, int drawY, unsigned const char *rgba, int subTextureWide, int subTextureTall )
{
	if (!IsValidId(id))
	{
		Msg( "SetSubTextureRGBA: Invalid texture id %i\n", id );
		return;
	}

	CMatSystemTexture &texture = m_Textures[id];
	texture.SetSubTextureRGBA( drawX, drawY, rgba, subTextureWide, subTextureTall );
}

//-----------------------------------------------------------------------------
// Returns true if the id is valid
//-----------------------------------------------------------------------------
bool CTextureDictionary::IsValidId( int id ) const
{
	Assert( id != 0 );
	if ( id == 0 )
		return false;

	return m_Textures.IsValidIndex( id );
}


//-----------------------------------------------------------------------------
// Binds a file to a particular texture
//-----------------------------------------------------------------------------
void CTextureDictionary::BindTextureToFile( int id, const char *pFileName )
{
	if (!IsValidId(id))
	{
		Msg( "BindTextureToFile: Invalid texture id for file %s\n", pFileName );
		return;
	}

	CMatSystemTexture &texture = m_Textures[id];

	// Reload from file if the material was never loaded, or if the filename has changed at all
	CRC32_t fileNameCRC = Texture_CRCName( pFileName );
	if ( !texture.GetMaterial() || fileNameCRC != texture.GetCRC() )
	{
		// New texture name
		texture.SetCRC( fileNameCRC );
		texture.SetMaterial( pFileName );

//		m_bCacheDirty = true;
	}
}


//-----------------------------------------------------------------------------
// Binds a material to a texture
//-----------------------------------------------------------------------------
void CTextureDictionary::BindTextureToMaterial( int id, IMaterial *pMaterial )
{
	if (!IsValidId(id))
	{
		Msg( "BindTextureToFile: Invalid texture id %d\n", id );
		return;
	}

	CMatSystemTexture &texture = m_Textures[id];
	texture.SetMaterial( pMaterial );
//		m_bCacheDirty = true;
}


//-----------------------------------------------------------------------------
// Binds a material to a texture reference
//-----------------------------------------------------------------------------
void CTextureDictionary::BindTextureToMaterialReference( int id, int referenceId, IMaterial *pMaterial )
{
	if (!IsValidId(id) || !IsValidId(referenceId))
	{
		Msg( "BindTextureToFile: Invalid texture ids %d %d\n", id, referenceId );
		return;
	}

	CMatSystemTexture &texture = m_Textures[id];
	CMatSystemTexture &textureSource = m_Textures[referenceId];
	texture.ReferenceOtherProcedural( &textureSource, pMaterial );
}


//-----------------------------------------------------------------------------
// Returns the material associated with an id
//-----------------------------------------------------------------------------
IMaterial *CTextureDictionary::GetTextureMaterial( int id )
{
	if (!IsValidId(id))
		return NULL;

	// FIXME: Why is this cache dirty stuff here??
	// Make sure all used materials are cached ( and all unused materials are gone )
//	if ( m_bCacheDirty )
//	{
//		m_bCacheDirty = false;
//		g_pMaterialSystem->UncacheUnusedMaterials();
//		g_pMaterialSystem->CacheUsedMaterials();
//	}

	return m_Textures[id].GetMaterial();
}


//-----------------------------------------------------------------------------
// Returns the material size associated with an id
//-----------------------------------------------------------------------------
void CTextureDictionary::GetTextureSize(int id, int& iWide, int& iTall )
{
	if (!IsValidId(id))
	{
		iWide = iTall = 0;
		return;
	}

	iWide = m_Textures[id].Width();
	iTall = m_Textures[id].Height();
}

void CTextureDictionary::GetTextureTexCoords( int id, float &s0, float &t0, float &s1, float &t1 )
{
	if (!IsValidId(id))
	{
		s0 = t0 = 0.0f;
		s1 = t1 = 1.0f;
		return;
	}

	s0 = m_Textures[id].m_s0;
	t0 = m_Textures[id].m_t0;
	s1 = m_Textures[id].m_s1;
	t1 = m_Textures[id].m_t1;
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : id - 
// Output : CMatSystemTexture
//-----------------------------------------------------------------------------
CMatSystemTexture *CTextureDictionary::GetTexture( int id )
{
	if (!IsValidId(id))
		return NULL;

	return &m_Textures[ id ];
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *pFileName - 
//-----------------------------------------------------------------------------
int	CTextureDictionary::FindTextureIdForTextureFile( char const *pFileName )
{
	int c = m_Textures.Count();
	for ( int i = 0; i < c; i++ )
	{
		CMatSystemTexture *tex = &m_Textures[ i ];
		if ( !tex )
			continue;

		IMaterial *mat = tex->GetMaterial();
		if ( !mat )
			continue;

		if ( !stricmp( mat->GetName(), pFileName ) )
			return i;
	}

	return -1;
}
