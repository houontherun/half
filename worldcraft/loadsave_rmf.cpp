//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#include "stdafx.h"
#include <io.h>
#include "Worldcraft.h"
#include "MapEntity.h"
#include "MapFace.h"
#include "MapSolid.h"
#include "MapStudioModel.h"
#include "MapWorld.h"
#include "GameData.h"
#include "GlobalFunctions.h"
#include "VisGroup.h"
#include "MapDoc.h"
#include "MapDisp.h"

static CMapWorld *pLoadingWorld;
static float fThisVersion;
static BOOL bCorrupt;


float GetFileVersion() { return fThisVersion; }


static void WriteString(fstream& file, LPCTSTR pszString)
{
	BYTE cLen = strlen(pszString)+1;
	file.write(&cLen, 1);
	file.write(pszString, cLen);
}

static void ReadString(fstream& file, char * pszString)
{
	BYTE cLen;
	file.read(&cLen, 1);
	file.read(pszString, cLen);
}


//-----------------------------------------------------------------------------
// Purpose: Loads a solid face from RMF.
//-----------------------------------------------------------------------------
int CMapFace::SerializeRMF(fstream& file, BOOL fIsStoring)
{
	int iSize;

	if (fIsStoring)
	{
		//
		// After 3.3 the alignment of vec4_t's changed. We never save the new format,
		// since RMF is no longer being revved.
		//
		TEXTURE_33 OldTex33;
		memset(&OldTex33, 0, sizeof(OldTex33));

		memcpy(OldTex33.texture, texture.texture, sizeof(OldTex33.texture));

		OldTex33.UAxis[0] = texture.UAxis[0];
		OldTex33.UAxis[1] = texture.UAxis[1];
		OldTex33.UAxis[2] = texture.UAxis[2];
		OldTex33.UAxis[3] = texture.UAxis[3];

		OldTex33.VAxis[0] = texture.VAxis[0];
		OldTex33.VAxis[1] = texture.VAxis[1];
		OldTex33.VAxis[2] = texture.VAxis[2];
		OldTex33.VAxis[3] = texture.VAxis[3];

		OldTex33.rotate = texture.rotate;

		OldTex33.scale[0] = texture.scale[0];
		OldTex33.scale[1] = texture.scale[1];

		OldTex33.smooth = texture.smooth;
		OldTex33.material = texture.material;
		OldTex33.q2surface = texture.q2surface;
		OldTex33.q2contents = texture.q2contents;
		OldTex33.nLightmapScale = texture.nLightmapScale;

		file.write((char *)&OldTex33, sizeof(OldTex33));

		iSize = nPoints;
		file.write((char *)&iSize, sizeof(int));

		//
		// Save face points. We don't serialize the Vectors directly because the memory
		// layout changed with SSE optimizations.
		//
		float SavePoints[256][3];
		for (int i = 0; i < iSize; i++)
		{
			SavePoints[i][0] = Points[i].x;
			SavePoints[i][1] = Points[i].y;
			SavePoints[i][2] = Points[i].z;
		}

		file.write((char *)SavePoints, nPoints * 3 * sizeof(float));

		//
		// Save plane points. We don't serialize the Vectors directly because the memory
		// layout changed with SSE optimizations.
		//
		for (i = 0; i < 3; i++)
		{
			SavePoints[i][0] = plane.planepts[i].x;
			SavePoints[i][1] = plane.planepts[i].y;
			SavePoints[i][2] = plane.planepts[i].z;
		}

		file.write((char *)SavePoints, 3 * 3 * sizeof(float));
	}
	else
	{
		// Pre-2.2 used a different texture structure format.
		TEXTURE_21 OldTex;
		memset(&OldTex, 0, sizeof(OldTex));

		if (fThisVersion < 0.9f)
		{
			// Read the name
			file.read(OldTex.texture, 16);

			// Ensure name is ASCIIZ
			OldTex.texture[16] = 0;

			// Read the rest - skip the name
			file.read((char *)&OldTex.rotate, sizeof(OldTex.rotate) + sizeof(OldTex.shift) + sizeof(OldTex.scale));
		}
		else if (fThisVersion < 1.2f)
		{
			// Didn't have smooth/material groups:
			file.read((char *)&OldTex, 40);
			file.read((char *)&OldTex, sizeof(OldTex.texture) - (MAX_PATH) + sizeof(OldTex.rotate) + sizeof(OldTex.shift) + sizeof(OldTex.scale));
		}
		else if (fThisVersion < 1.7f)
		{
			// No quake2 fields yet and smaller texture size.
			file.read((char *)&OldTex, 40);
			file.read((char *)&OldTex.rotate, sizeof(OldTex) - (sizeof(int) * 3) - MAX_PATH);
		}
		else if (fThisVersion < 1.8f)
		{
			// Texture name field changed from 40 to MAX_PATH in size.
			file.read((char *)&OldTex, 40);
			file.read((char *)&OldTex.rotate, sizeof(OldTex) - MAX_PATH);
		}
		else if (fThisVersion < 2.2f)
		{
			file.read((char *)&OldTex, sizeof(OldTex));
		}
		else
		{
			//
			// After 3.3 the alignment of vec4_t's changed. We never save the new format,
			// since RMF is no longer being revved.
			//
			TEXTURE_33 OldTex33;
			memset(&OldTex33, 0, sizeof(OldTex33));

			file.read((char *)&OldTex33, sizeof(OldTex33));

			memcpy(texture.texture, OldTex33.texture, sizeof(texture.texture));

			texture.UAxis[0] = OldTex33.UAxis[0];
			texture.UAxis[1] = OldTex33.UAxis[1];
			texture.UAxis[2] = OldTex33.UAxis[2];
			texture.UAxis[3] = OldTex33.UAxis[3];

			texture.VAxis[0] = OldTex33.VAxis[0];
			texture.VAxis[1] = OldTex33.VAxis[1];
			texture.VAxis[2] = OldTex33.VAxis[2];
			texture.VAxis[3] = OldTex33.VAxis[3];

			texture.rotate = OldTex33.rotate;

			texture.scale[0] = OldTex33.scale[0];
			texture.scale[1] = OldTex33.scale[1];

			texture.smooth = OldTex33.smooth;
			texture.material = OldTex33.material;
			texture.q2surface = OldTex33.q2surface;
			texture.q2contents = OldTex33.q2contents;
			texture.nLightmapScale = OldTex33.nLightmapScale;

			if (texture.nLightmapScale == 0)
			{
				texture.nLightmapScale = g_pGameConfig->GetDefaultLightmapScale();
			}
		}

		// If reading from a pre-2.2 RMF file, copy the texture info from the old format.
		if (fThisVersion < 2.2f)
		{
			memcpy(texture.texture, OldTex.texture, sizeof(texture.texture));
			memcpy(texture.scale, OldTex.scale, sizeof(texture.scale));
			texture.rotate = OldTex.rotate;
			texture.smooth = OldTex.smooth;
			texture.material = OldTex.material;
			texture.q2surface = OldTex.q2surface;
			texture.q2contents = OldTex.q2contents;
			texture.UAxis[3] = OldTex.shift[0];
			texture.VAxis[3] = OldTex.shift[1];
		}

		if (fThisVersion < 1.8f)
		{
			texture.texture[40] = 0;
		}

		//
		// Reverse forward slashes if we are not using materials.
		//
		if (g_pGameConfig->GetTextureFormat() != tfVMT)
		{
			for (int i = strlen(texture.texture) - 1; i >= 0; i--)
			{
				if (texture.texture[i] == '/')
				{
					texture.texture[i] = '\\';
				}
			}
		}

		if (texture.texture[1] == ':')
		{
			char szBuf[MAX_PATH];
			char *psz;
			strcpy(szBuf, texture.texture);
			psz = strstr(szBuf, "textures\\");
			if (psz)
			{
				memset(texture.texture, 0, sizeof(texture.texture));
				psz += strlen("textures\\");
				strcpy(texture.texture, psz);
			}
		}
		
		if (fThisVersion < 0.6f)
		{
			float light;
			file.read((char*) &light, sizeof(light));
		}

		//
		// Load the points into an array of float[3]'s and transfer them into
		// an array of Vectors which will be used for face creation. We can't
		// load directly into the Vectors because the memory layout changed
		// when SSE optimizations were added.
		//
		float LoadPoints[256][3];

		file.read((char *)&iSize, sizeof(int));
		file.read((char *)&LoadPoints, iSize * 3 * sizeof(float));

		Vector CreatePoints[256];
		for (int i = 0; i < iSize; i++)
		{
			CreatePoints[i].x = LoadPoints[i][0];
			CreatePoints[i].y = LoadPoints[i][1];
			CreatePoints[i].z = LoadPoints[i][2];

			//
			// Negate Z for older RMF files.
			//
			if (fThisVersion < 0.5f)
			{
				CreatePoints[i].z = -CreatePoints[i].z;
			}
		}

        if (fThisVersion < 2.2f)
        {
            CreateFace(CreatePoints, iSize);
        }

		//
		// Load the plane points. We don't really need them, but they can fix the face if, somehow, it
		// was saved without any points. RMF could have been smaller if we only saved these plane points.
		//
		if (fThisVersion >= 0.7f)
		{
			//
			// Load the points into an array of float[3]'s and transfer them into
			// the array of Vectors. We can't load directly into the Vectors because the memory
			// layout changed when SSE optimizations were added.
			//
			float LoadPlanePoints[3][3];
			file.read((char *)LoadPlanePoints, sizeof(LoadPlanePoints));
			
			for (int i = 0; i < 3; i++)
			{
				plane.planepts[i].x = LoadPlanePoints[i][0];
				plane.planepts[i].y = LoadPlanePoints[i][1];
				plane.planepts[i].z = LoadPlanePoints[i][2];
			}

			CalcPlane();

			// If reading from an older RMF file, set up the texture axes Quake-style.
			if (fThisVersion < 2.2f)
			{
				InitializeTextureAxes(TEXTURE_ALIGN_QUAKE, INIT_TEXTURE_AXES | INIT_TEXTURE_FORCE);
			}
		}

        if( fThisVersion < 2.2f )
        {
            SetTexture(texture.texture);
        }

        //
        // version 3.4 -- added displacement info to faces
        //
        if( ( fThisVersion >= 3.4f ) && ( fThisVersion <= 3.6f ) )
        {
			bool bHasMapDisp;

            if( fThisVersion >= 3.5f )
            {
                int nLoadHasMapDisp;

                // check displacement mapping flag
                file.read( ( char* )&nLoadHasMapDisp, sizeof( int ) );
				bHasMapDisp = nLoadHasMapDisp != 0;
			}                
            else
            {
                // check displacement mapping flag
                file.read( ( char* )&bHasMapDisp, sizeof( bool ) );
            }

            if( bHasMapDisp )
            {
				EditDispHandle_t handle = EditDispMgr()->Create();
				SetDisp( handle );

				CMapDisp *pDisp = EditDispMgr()->GetDisp( handle );
				pDisp->SetParent( this );
				pDisp->SerializedLoadRMF( file, this, fThisVersion );
            }
        }

        if (fThisVersion >= 2.2f)
        {
            CreateFace(CreatePoints, iSize); 
            SetTexture(texture.texture);
        }
	}

	if (file.bad())
	{
		return(-1);
	}

	return(0);
}


int MDkeyvalue::SerializeRMF(fstream& file, BOOL fIsStoring)
{
	// load/save a keyvalue
	if( fIsStoring )
	{
		WriteString(file, szKey);
		WriteString(file, szValue);
	}
	else
	{
		ReadString(file, szKey);
		ReadString(file, szValue);
	}

	if( file.bad() )
		return -1;
	return 0;
}


int CMapSolid::SerializeRMF(fstream& file, BOOL fIsStoring)
{
	int iRvl, iSize;

	// load/save children
	CMapClass::SerializeRMF(file, fIsStoring);

	// load/save a brush
	if(fIsStoring)
	{
		// serialize the Faces
		iSize = Faces.GetCount();
		file.write((char*) &iSize, sizeof(int));
		for(int i = 0; i < iSize; i++)
		{
			iRvl = Faces[i].SerializeRMF(file, fIsStoring);
			if(iRvl < 0)
				return iRvl;
		}
	}
	else
	{
		// read Faces
		file.read((char*) &iSize, sizeof(int));
		Faces.SetCount(iSize);
	
		for(int i = 0; i < iSize; i++)
		{
			// extract face
			iRvl = Faces[i].SerializeRMF(file, fIsStoring);
			if (iRvl < 0)
			{
				return(iRvl);
			}

			Faces[i].SetRenderColor(r, g, b);
			Faces[i].SetParent(this);
		}

		CalcBounds();

		//
		// Set solid type based on texture name.
		//
		m_eSolidType = HL1SolidTypeFromTextureName(Faces[0].texture.texture);
	}

	if (file.bad())
	{
		return -1;
	}
	
	return 0;
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : file - 
//			fIsStoring - 
// Output : int
//-----------------------------------------------------------------------------
int CEditGameClass::SerializeRMF(fstream& file, BOOL fIsStoring)
{
	int iSize, iRvl;
	int iAngle = 0;

	if (fIsStoring)
	{
		// save data
		WriteString(file, GetClassName());
		file.write((char*) &iAngle, sizeof(iAngle));

		int nSpawnFlags = GetSpawnFlags();
		file.write((char *)&nSpawnFlags, sizeof(nSpawnFlags));

		//
		// Write the number of keyvalues.
		//
		iSize = m_KeyValues.GetCount();
		file.write((char*) &iSize, sizeof(int));

		//
		// Write the keyvalues.
		//
		for (int i = 0; i < iSize; i++ )
		{
			MDkeyvalue KeyValue = m_KeyValues.GetKeyValue(i);

			iRvl = KeyValue.SerializeRMF(file, fIsStoring);
			if (iRvl < 0)
			{
				return iRvl;
			}
		}

		//
		// Save dummy timeline info.
		//
		BOOL bTimeline = FALSE;
		int nTime = 0;
		file.write((char*) &bTimeline, sizeof bTimeline);
		file.write((char*) &nTime, sizeof nTime);
		file.write((char*) &nTime, sizeof nTime);
	}
	else
	{
		char buf[128];
		ReadString(file, buf);
		file.read((char*) &iAngle, sizeof(iAngle));

		int nSpawnFlags;
		file.read((char *)&nSpawnFlags, sizeof(nSpawnFlags));

		ASSERT(buf[0]);

		CEditGameClass::SetClass(buf, true);

		//
		// Read the keyvalues.
		//
		file.read((char *) &iSize, sizeof(int));
		m_KeyValues.SetSize(iSize + 1);
		for (int i = 0; i < iSize; i++ )
		{
			MDkeyvalue KeyValue;
			iRvl = KeyValue.SerializeRMF(file, fIsStoring);
			if (iRvl < 0)
			{
				return iRvl;
			}
			m_KeyValues.SetValue(KeyValue.szKey, KeyValue.szValue);
		}

		SetSpawnFlags(nSpawnFlags);
		m_KeyValues.SetValue("classname", buf);

		// backwards compatibility for old iAngle
		if (iAngle)
		{
			ImportAngle(iAngle);
		}

		//
		// Dummy timeline information - unused.
		//
		if (fThisVersion >= 1.5f)
		{
			BOOL bTimeline;
			int nTime;

			file.read((char*) &bTimeline, sizeof bTimeline);
			file.read((char*) &nTime, sizeof nTime);
			file.read((char*) &nTime, sizeof nTime);
		}
	}

	return file.bad() ? -1 : 0;
}


int CMapClass::SerializeRMF(fstream& file, BOOL fIsStoring)
{
	int iSize, iRvl;

	if(fIsStoring)
	{
		// write type
		WriteString(file, GetType());

		//
		// Write the visgroup ID (zero if none).
		//
		DWORD dwID = 0;
		if (m_pVisGroup)
		{
			dwID = m_pVisGroup->GetID();
		}
		file.write((char *)&dwID, sizeof(dwID));

		//
		// Write the object color.
		//
		file.write((char *)&r, sizeof(BYTE));
		file.write((char *)&g, sizeof(BYTE));
		file.write((char *)&b, sizeof(BYTE));

		//
		// Save children.
		//
		int nChildCount = 0;

		POSITION p = Children.GetHeadPosition();
		while (p != NULL)
		{
			CMapClass *pChild = Children.GetNext(p);
			if (pChild->ShouldSerialize())
			{
				nChildCount++;
			}
		}

		file.write((char *)&nChildCount, sizeof(int));

		p = Children.GetHeadPosition();
		while (p != NULL)
		{
			CMapClass *pChild = Children.GetNext(p);
			if (pChild->ShouldSerialize())
			{
				iRvl = pChild->SerializeRMF(file, fIsStoring);
				if (iRvl < 0)
				{
					return iRvl;
				}
			}
		}
	}
	else
	{
		// read our stuff
		if(fThisVersion < 1.0f)
		{
			// kill group information .. unfortunate
			file.read((char*) &iSize, sizeof(int));
			file.seekg(iSize, ios::cur);
		}
		else
		{
			DWORD dwGroupID;
			file.read((char*) &dwGroupID, sizeof(DWORD));
			CMapDoc *pDoc = CMapDoc::GetActiveMapDoc();
			if (pDoc != NULL)
			{
				SetVisGroup(pDoc->VisGroups_GroupForID(dwGroupID));
			}
			SetColorFromVisGroups();
		}

		//
		// Read the object color.
		//
		file.read((char *)&r, sizeof(BYTE));
		file.read((char *)&g, sizeof(BYTE));
		file.read((char *)&b, sizeof(BYTE));

		// load children
		file.read((char*) &iSize, sizeof(int));
		for(int i = 0; i < iSize; i++)
		{
			char buf[128];
			ReadString(file, buf);
			CMapClass *pChild = CMapClassManager::CreateObject(buf);
			if(!pChild)
			{
				bCorrupt = TRUE;
				return -1;
			}
			iRvl = pChild->SerializeRMF(file, fIsStoring);
			if(iRvl < 0)
				return iRvl;
			AddChild(pChild);
		}
	}

	return file.bad() ? -1 : 0;
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : file - 
//			fIsStoring - 
// Output : 
//-----------------------------------------------------------------------------
int CMapEntity::SerializeRMF(fstream &file, BOOL fIsStoring)
{
	int iSize;
	Vector Origin;

	//
	// Read/write base class.
	//
	CMapClass::SerializeRMF(file, fIsStoring);
	CEditGameClass::SerializeRMF(file, fIsStoring);
	
	if (fIsStoring)
	{
		// Write flags
		file.write((char*) &flags, sizeof(flags));

		// Write origin
		GetOrigin(Origin);
		file.write((char *)Origin.Base(), 3 * sizeof(float));

		// Save padding for unused "complex" field 
		iSize = 0;
		file.write((char*) &iSize, sizeof(int));
	}
	else
	{
		// Read flags
		file.read((char *)&flags, sizeof(flags));

		// Read origin
		file.read((char *)Origin.Base(), 3 * sizeof(float));
		SetOrigin(Origin);

		if (IsClass())
		{
			// Known class. Determine flags based on the class.
			flags = IsSolidClass() ? (flags & ~flagPlaceholder) : (flags | flagPlaceholder);
		}
		else
		{
			// Unknown class. Determine flags by looking for children (only solid ents have children at this point).
			flags = (Children.GetCount() > 0) ? (flags & ~flagPlaceholder) : (flags | flagPlaceholder);
		}

		if (!(IsPlaceholder()))
		{
			CMapPoint::SetOrigin(Vector(0, 0, 0));
		}

		GetOrigin(Origin);

		// import for previous to 0.5
		if (fThisVersion < 0.5f)
		{
			Origin.z = -Origin.z;
		}

		// load unused "complex" field
		file.read((char *)&iSize, sizeof(int));

		SetOrigin(Origin);

		//
		// HACK: Set our class to NULL so that it is properly set from our "classname"
		// key in PostloadWorld.
		//
		m_szClass[0] = '\0';

		CalcBounds(TRUE);
	}

	if (file.bad())
	{
		return -1;
	}
	
	return 0;
}


int CMapWorld::SerializeRMF(fstream &file, BOOL fIsStoring)
{
    float fVersion = 3.7f;
	float fLastCompat = 0.3f;
	
	int nSolids = 0, i;
	int iSize;

	pLoadingWorld = this;
	bCorrupt = FALSE;

	// load/save a world
	if(fIsStoring)	
	{
		// write version
		file.write((char*) &fVersion, sizeof(fVersion));

		file.write("RMF", 3);

		// save groups
		CMapDoc *pDoc = CMapDoc::GetActiveMapDoc();
		iSize = pDoc->VisGroups_GetCount();
		file.write((char*) &iSize, sizeof(int));

		POSITION p;
		CVisGroup *pGroup;
		p = pDoc->VisGroups_GetHeadPosition();
		for(i = 0; i < iSize; i++)
		{
			pGroup = pDoc->VisGroups_GetNext(p);
			file.write((char*) pGroup, sizeof(CVisGroup));
		}

		// save children & local data
		if(CMapClass::SerializeRMF(file, fIsStoring) == -1)
			goto FatalError;

		// save ceditgameclass
		if(CEditGameClass::SerializeRMF(file, fIsStoring) == -1)
			goto FatalError;

		// save paths
		iSize = m_Paths.GetCount();
		file.write((char*) &iSize, sizeof(iSize));

		p = m_Paths.GetHeadPosition();
		while(p)
		{
			CMapPath *pPath = m_Paths.GetNext(p);
			pPath->SerializeRMF(file, TRUE);
		}

		if(file.bad())
			goto FatalError;
	}
	else
	{
		// read & check version
		file.read((char*) &fThisVersion, sizeof(fThisVersion));
		if(fThisVersion < fLastCompat || fThisVersion > fVersion)
		{
			CString str;
			str.Format("Oops! SerializeRMF() v%1.1f tried to load a file v%1.1f. Aborting.",
				fVersion, fThisVersion);
			AfxMessageBox(str);
			return -1;
		}

		char buf[128];

		if(fThisVersion >= 0.8f)
		{
			file.read(buf, 3);
			if(strncmp(buf, "RMF", 3))
			{
				AfxMessageBox("Invalid file type.");
				return -1;
			}
		}

		// load groups
		if (fThisVersion >= 1.0f)
		{
			CMapDoc *pDoc = CMapDoc::GetActiveMapDoc();

			file.read((char*) &iSize, sizeof(int));

			for (i = 0; i < iSize; i++)
			{
				CVisGroup *pGroup = new CVisGroup;
				file.read((char *)pGroup, sizeof(CVisGroup));

				if (pDoc != NULL)
				{
					pDoc->VisGroups_AddGroup(pGroup);
				}
			}
		}

		m_Render2DBox.ResetBounds();

		// make sure it's a CMapWorld
		ReadString(file, buf);
		if(strcmp(buf, GetType()))
		{
			AfxMessageBox("Invalid file type.");
			return -1;
		}

		// load children & local data
		if(CMapClass::SerializeRMF(file, fIsStoring) == -1)
			goto FatalError;

		// load ceditgameclass & CMapClass
		if(CEditGameClass::SerializeRMF(file, fIsStoring) == -1)
			goto FatalError;

		if(fThisVersion < 1.0f)
		{
			const int old_group_bytes = 134;
			file.read((char*) &iSize, sizeof(int));
			file.seekg(old_group_bytes * iSize, ios::cur);
		}

		// load paths
		if(fThisVersion >= 1.1f)
		{
			file.read((char*) &iSize, sizeof iSize);
			for(int i = 0; i < iSize; i++)
			{
				CMapPath *pPath = new CMapPath;
				pPath->SerializeRMF(file, FALSE);
				if(pPath->GetNodeCount() == 0)
				{
					delete pPath;
					continue;	// no add dead paths
				}
				m_Paths.AddTail(pPath);
			}
		}

		// read camera
		if(fThisVersion < 1.4f)
		{
			float unused[3];
			file.read((char*) unused, sizeof(float)*3);
			file.read((char*) unused, sizeof(float)*3);
		}

		if(file.bad())
			goto FatalError;

		PostloadWorld();
		
		if (g_pGameConfig->GetTextureFormat() == tfVMT)
		{
			// do batch search and replace of textures from trans.txt if it exists.
			char translationFilename[MAX_PATH];
			_snprintf( translationFilename, MAX_PATH-1, "%s/materials/trans.txt", g_pGameConfig->m_szGameDir );
			FILE *searchReplaceFP;
			searchReplaceFP = fopen( translationFilename, "r" );
			if( searchReplaceFP )
			{
				CMapDoc::GetActiveMapDoc()->BatchReplaceTextures( searchReplaceFP );
				fclose( searchReplaceFP );
			}
		}
	}

	return nSolids;

FatalError:
	CString str;
	if(bCorrupt)
	{
		// file-is-corrupt error
		str.Format("The file is corrupt.");
		AfxMessageBox(str);
		
		return -1;
	}

	// OS error.
	str.Format("The OS reported an error %s the file: %s",
		fIsStoring ? "saving" : "loading", strerror(errno));
	AfxMessageBox(str);

	return -1;
}
