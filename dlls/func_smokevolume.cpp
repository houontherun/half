//========= Copyright � 1996-2002, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#include "cbase.h"
#include "baseparticleentity.h"
#include "sendproxy.h"

class CFuncSmokeVolume : public CBaseParticleEntity
{
public:
	DECLARE_CLASS( CFuncSmokeVolume, CBaseParticleEntity );
	DECLARE_SERVERCLASS();
	DECLARE_DATADESC();

	CFuncSmokeVolume();
	void Spawn();
	void Activate( void );

	// Set the times it fades out at.
	void SetDensity( float density );

private:
	CNetworkVar( color32, m_Color1 );
	CNetworkVar( color32, m_Color2 );
	CNetworkString( m_MaterialName, 255 );
	string_t m_String_tMaterialName;
	CNetworkVar( float, m_ParticleDrawWidth );
	CNetworkVar( float, m_ParticleSpacingDistance );
	CNetworkVar( float, m_DensityRampSpeed );
	CNetworkVar( float, m_RotationSpeed );
	CNetworkVar( float, m_MovementSpeed );
	CNetworkVar( float, m_Density );
};

BEGIN_DATADESC( CFuncSmokeVolume )

	// Save/restore Keyvalue fields
	DEFINE_KEYFIELD( CFuncSmokeVolume, m_Color1, FIELD_COLOR32, "Color1" ),
	DEFINE_KEYFIELD( CFuncSmokeVolume, m_Color2, FIELD_COLOR32, "Color2" ),
//	DEFINE_ARRAY( CFuncSmokeVolume, m_MaterialName, FIELD_STRING, 255 ),
	DEFINE_KEYFIELD( CFuncSmokeVolume, m_String_tMaterialName, FIELD_STRING, "Material" ),
	DEFINE_KEYFIELD( CFuncSmokeVolume, m_ParticleDrawWidth, FIELD_FLOAT, "ParticleDrawWidth" ),
	DEFINE_KEYFIELD( CFuncSmokeVolume, m_ParticleSpacingDistance, FIELD_FLOAT, "ParticleSpacingDistance" ),
	DEFINE_KEYFIELD( CFuncSmokeVolume, m_DensityRampSpeed, FIELD_FLOAT, "DensityRampSpeed" ),
	DEFINE_KEYFIELD( CFuncSmokeVolume, m_RotationSpeed, FIELD_FLOAT, "RotationSpeed" ),
	DEFINE_KEYFIELD( CFuncSmokeVolume, m_MovementSpeed, FIELD_FLOAT, "MovementSpeed" ),
	DEFINE_KEYFIELD( CFuncSmokeVolume, m_Density, FIELD_FLOAT, "Density" ),
	// inputs
	DEFINE_INPUT( CFuncSmokeVolume, m_RotationSpeed, FIELD_FLOAT, "SetRotationSpeed"),
	DEFINE_INPUT( CFuncSmokeVolume, m_MovementSpeed, FIELD_FLOAT, "SetMovementSpeed"),
	DEFINE_INPUT( CFuncSmokeVolume, m_Density, FIELD_FLOAT, "SetDensity"),

END_DATADESC()




IMPLEMENT_SERVERCLASS_ST( CFuncSmokeVolume, DT_FuncSmokeVolume )
	SendPropInt( SENDINFO( m_Color1 ), 32, SPROP_UNSIGNED, SendProxy_Color32ToInt ),
	SendPropInt( SENDINFO( m_Color2 ), 32, SPROP_UNSIGNED, SendProxy_Color32ToInt ),
	SendPropString( SENDINFO( m_MaterialName ) ),
	SendPropFloat( SENDINFO( m_ParticleDrawWidth ), 0, SPROP_NOSCALE ),
	SendPropFloat( SENDINFO( m_ParticleSpacingDistance ), 0, SPROP_NOSCALE ),
	SendPropFloat( SENDINFO( m_DensityRampSpeed ), 0, SPROP_NOSCALE ),
	SendPropFloat( SENDINFO( m_RotationSpeed ), 0, SPROP_NOSCALE ),
	SendPropFloat( SENDINFO( m_MovementSpeed ), 0, SPROP_NOSCALE ),
	SendPropFloat( SENDINFO( m_Density ), 0, SPROP_NOSCALE ),
	SendPropDataTable( SENDINFO_DT( m_Collision ), &REFERENCE_SEND_TABLE(DT_CollisionProperty) ),
END_SEND_TABLE()

LINK_ENTITY_TO_CLASS( func_smokevolume, CFuncSmokeVolume );

CFuncSmokeVolume::CFuncSmokeVolume()
{
	m_Density = 1.0f;
}

void CFuncSmokeVolume::SetDensity( float density )
{
	if( density != m_Density )
	{
		m_Density = density;
//		NetworkStateChanged();
	}
}

void CFuncSmokeVolume::Spawn()
{
	memset( m_MaterialName.GetForModify(), 0, sizeof( m_MaterialName ) );

	// Bind to our bmodel.
	SetModel( STRING( GetModelName() ) );

	// Use manual mode.
//	NetworkStateManualMode( true );
//	NetworkStateChanged();

	BaseClass::Spawn();
}

void CFuncSmokeVolume::Activate( void )
{
	BaseClass::Activate();
	Q_strncpy( m_MaterialName.GetForModify(), STRING( m_String_tMaterialName ), 255 );
}

