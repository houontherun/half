//========= Copyright � 1996-2002, Valve LLC, All rights reserved. ============
//
// Purpose: Client side implementation of CBaseCombatWeapon.
//
// $NoKeywords: $
//=============================================================================
#include "cbase.h"
#include "history_resource.h"
#include "iclientmode.h"
#include "iinput.h"
#include "weapon_selection.h"
#include "hud_crosshair.h"
#include "engine/ivmodelinfo.h"
#include "tier0/vprof.h"

//-----------------------------------------------------------------------------
// Purpose: Gets the local client's active weapon, if any.
//-----------------------------------------------------------------------------
C_BaseCombatWeapon *GetActiveWeapon( void )
{
	C_BasePlayer *player = C_BasePlayer::GetLocalPlayer();
	if ( !player )
		return NULL;

	return player->GetActiveWeapon();
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void C_BaseCombatWeapon::SetDormant( bool bDormant )
{
	// If I'm going from active to dormant and I'm carried by another player, holster me.
	if ( !IsDormant() && bDormant && !IsCarriedByLocalPlayer() )
	{
		Holster( NULL );
	}

	BaseClass::SetDormant( bDormant );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void C_BaseCombatWeapon::NotifyShouldTransmit( ShouldTransmitState_t state )
{
	BaseClass::NotifyShouldTransmit(state);

	if (state == SHOULDTRANSMIT_END)
	{
		if (m_iState == WEAPON_IS_ACTIVE)
		{
			m_iState = WEAPON_IS_CARRIED_BY_PLAYER;
		}
	}
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void C_BaseCombatWeapon::OnPreDataChanged( DataUpdateType_t updateType )
{
	BaseClass::OnPreDataChanged(updateType);

	m_iOldState = m_iState;
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void C_BaseCombatWeapon::OnRestore()
{
	BaseClass::OnRestore();

	m_bJustRestored = true;
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : bnewentity - 
//-----------------------------------------------------------------------------
void C_BaseCombatWeapon::OnDataChanged( DataUpdateType_t updateType )
{
	BaseClass::OnDataChanged(updateType);

	bool bnewentity = (updateType == DATA_UPDATE_CREATED);

	CHandle< C_BaseCombatWeapon > handle;
	handle = this;

	// If it's being carried by the *local* player, on the first update,
	// find the registered weapon for this ID
	C_BasePlayer *pPlayer = C_BasePlayer::GetLocalPlayer();
	if (!pPlayer || !IsBeingCarried() || (GetOwner() != pPlayer) )
	{
		// BRJ 10/14/02
		// FIXME: Remove when Yahn's client-side prediction is done
		// It's a hacky workaround for the model indices fighting
		// (GetRenderBounds uses the model index, which is for the view model)
		SetModelIndex( m_iWorldModelIndex );
		SetModelPointer( modelinfo->GetModel( m_iWorldModelIndex ) );
		return;
	}

	// If I was just picked up, or created & immediately carried, add myself to this client's list of weapons
	if ( (m_iState != WEAPON_NOT_CARRIED ) && 
		( bnewentity || m_iOldState == WEAPON_NOT_CARRIED ) )
	{
		// Tell the HUD this weapon's been picked up
		if ( ShouldDrawPickup() )
		{
			CBaseHudWeaponSelection *pHudSelection = GetHudWeaponSelection();
			if ( pHudSelection )
			{
				pHudSelection->OnWeaponPickup( this );
			}

			pPlayer->EmitSound( "Player.PickupWeapon" );
		}
	}

	m_bJustRestored = false;
}

//-----------------------------------------------------------------------------
// Is anyone carrying it?
//-----------------------------------------------------------------------------
bool C_BaseCombatWeapon::IsBeingCarried() const
{
	return ( m_hOwner.Get() != NULL );
}

//-----------------------------------------------------------------------------
// Is the carrier alive?
//-----------------------------------------------------------------------------
bool C_BaseCombatWeapon::IsCarrierAlive() const
{
	if ( !m_hOwner.Get() )
		return false;

	return m_hOwner.Get()->GetHealth() > 0;
}

//-----------------------------------------------------------------------------
// Should this object cast shadows?
//-----------------------------------------------------------------------------
ShadowType_t C_BaseCombatWeapon::ShadowCastType()
{
	if (!IsBeingCarried())
		return SHADOWS_RENDER_TO_TEXTURE;

	if (IsCarriedByLocalPlayer())
		return SHADOWS_NONE;

	return (m_iState != WEAPON_IS_CARRIED_BY_PLAYER) ? SHADOWS_RENDER_TO_TEXTURE : SHADOWS_NONE;
}

//-----------------------------------------------------------------------------
// Purpose: This weapon is the active weapon, and it should now draw anything
//			it wants to. This gets called every frame.
//-----------------------------------------------------------------------------
void C_BaseCombatWeapon::Redraw()
{
	if ( g_pClientMode->ShouldDrawCrosshair() )
	{
		DrawCrosshair();
	}

	DrawAmmo();
}

//-----------------------------------------------------------------------------
// Purpose: Draw the weapon's crosshair
//-----------------------------------------------------------------------------
void C_BaseCombatWeapon::DrawCrosshair()
{
	C_BasePlayer *player = C_BasePlayer::GetLocalPlayer();
	if ( !player )
		return;

	Color clr = gHUD.m_clrNormal;
/*

	// TEST: if the thing under your crosshair is on a different team, light the crosshair with a different color.
	Vector vShootPos, vShootAngles;
	GetShootPosition( vShootPos, vShootAngles );

	Vector vForward;
	AngleVectors( vShootAngles, &vForward );
	
	
	// Change the color depending on if we're looking at a friend or an enemy.
	CPartitionFilterListMask filter( PARTITION_ALL_CLIENT_EDICTS );	
	trace_t tr;
	traceline->TraceLine( vShootPos, vShootPos + vForward * 10000, COLLISION_GROUP_NONE, MASK_SHOT, &tr, true, ~0, &filter );

	if ( tr.index != 0 && tr.index != INVALID_CLIENTENTITY_HANDLE )
	{
		C_BaseEntity *pEnt = ClientEntityList().GetBaseEntityFromHandle( tr.index );
		if ( pEnt )
		{
			if ( pEnt->GetTeamNumber() != player->GetTeamNumber() )
			{
				g = b = 0;
			}
		}
	}		 
*/

	CHudCrosshair *crosshair = (CHudCrosshair *)GET_HUDELEMENT( CHudCrosshair );
	if ( !crosshair )
		return;

	// Check to see if the player is in VGUI mode...
	if (player->IsInVGuiInputMode())
	{
		CHudTexture *pArrow	= gHUD.GetIcon( "arrow" );

		crosshair->SetCrosshair( pArrow, gHUD.m_clrNormal );
		return;
	}

	// Find out if this weapon's auto-aimed onto a target
	bool bOnTarget = ( m_iState == WEAPON_IS_ONTARGET );
	
	if ( player->m_Local.m_iFOV >= 90 )
	{ 
		// normal crosshairs
		if ( bOnTarget && GetWpnData().iconAutoaim )
		{
			clr[3] = 255;

			crosshair->SetCrosshair( GetWpnData().iconAutoaim, clr );
		}
		else if ( GetWpnData().iconCrosshair )
		{
			clr[3] = 255;
			crosshair->SetCrosshair( GetWpnData().iconCrosshair, clr );
		}
		else
		{
			crosshair->SetCrosshair( 0, Color( 255, 255, 255, 255 ) );
		}
	}
	else
	{ 
		Color white( 255, 255, 255, 255 );

		// zoomed crosshairs
		if (bOnTarget && GetWpnData().iconZoomedAutoaim)
			crosshair->SetCrosshair(GetWpnData().iconZoomedAutoaim, white);
		else if ( GetWpnData().iconZoomedCrosshair )
			crosshair->SetCrosshair( GetWpnData().iconZoomedCrosshair, white );
		else
			crosshair->SetCrosshair( 0, white );
	}
}

//-----------------------------------------------------------------------------
// Purpose: nothing
//-----------------------------------------------------------------------------
void C_BaseCombatWeapon::DrawAmmo()
{
	// ammo drawing has been moved into hud_ammo.cpp
}

//-----------------------------------------------------------------------------
// Purpose: This weapon is the active weapon, and the viewmodel for it was just drawn.
//-----------------------------------------------------------------------------
void C_BaseCombatWeapon::ViewModelDrawn( C_BaseViewModel *pViewModel )
{
}

//-----------------------------------------------------------------------------
// Purpose: Returns true if this client's carrying this weapon
//-----------------------------------------------------------------------------
bool C_BaseCombatWeapon::IsCarriedByLocalPlayer( void )
{
	if ( !GetOwner() )
		return false;

	return ( GetOwner() == C_BasePlayer::GetLocalPlayer() );
}

//-----------------------------------------------------------------------------
// Purpose: Returns true if this weapon is the local client's currently wielded weapon
//-----------------------------------------------------------------------------
bool C_BaseCombatWeapon::IsActiveByLocalPlayer( void )
{
	if ( IsCarriedByLocalPlayer() )
	{
		return (m_iState == WEAPON_IS_ACTIVE);
	}

	return false;
}

bool C_BaseCombatWeapon::GetShootPosition( Vector &vOrigin, QAngle &vAngles )
{
	// Get the entity because the weapon doesn't have the right angles.
	C_BaseCombatCharacter *pEnt = ToBaseCombatCharacter( GetOwner() );
	if ( pEnt )
	{
		if ( pEnt == C_BasePlayer::GetLocalPlayer() )
		{
			vAngles = pEnt->EyeAngles();
		}
		else
		{
			vAngles = pEnt->GetRenderAngles();	
		}
	}
	else
	{
		vAngles.Init();
	}

	QAngle vDummy;
	if ( IsActiveByLocalPlayer() && !input->CAM_IsThirdPerson() )
	{
		C_BasePlayer *player = ToBasePlayer( pEnt );
		C_BaseViewModel *vm = player ? player->GetViewModel( 0 ) : NULL;
		if ( vm )
		{
			int iAttachment = vm->LookupAttachment( "muzzle" );
			if ( vm->GetAttachment( iAttachment, vOrigin, vDummy ) )
			{
				return true;
			}
		}
	}
	else
	{
		// Thirdperson
		int iAttachment = LookupAttachment( "muzzle" );
		if ( GetAttachment( iAttachment, vOrigin, vDummy ) )
		{
			return true;
		}
	}

	vOrigin = GetRenderOrigin();
	return false;
}


//-----------------------------------------------------------------------------
// Returns the attachment render origin + origin
//-----------------------------------------------------------------------------
void C_BaseCombatWeapon::GetAimEntOrigin( IClientEntity *pAttachedTo, Vector *pOrigin, QAngle *pAngles )
{
	// FIXME: Should really be computing the actual attachment points here
	Vector vecRenderMins, vecRenderMaxs;
	pAttachedTo->GetRenderBounds( vecRenderMins, vecRenderMaxs );

	VectorAdd( vecRenderMins, vecRenderMaxs, *pOrigin );
	*pOrigin *= 0.5f;
	*pOrigin += pAttachedTo->GetRenderOrigin();
	*pAngles = pAttachedTo->GetRenderAngles();
}


//-----------------------------------------------------------------------------
// Purpose: 
// Output : Returns true on success, false on failure.
//-----------------------------------------------------------------------------
bool C_BaseCombatWeapon::ShouldDraw( void )
{
	if ( m_iWorldModelIndex == 0 )
	{
		return false;
	}

	// carried by player?
	if ( IsCarriedByLocalPlayer() )
	{
		// Only ever show the active weapon
		if ( !IsActiveByLocalPlayer() )
			return false;

		// Don't show it if it's the view model and we're in firstperson
		if (input->CAM_IsThirdPerson() == false)
		{
			return false;
		}
		
		return true;
	}

	// If it's a player, then only show active weapons
	if ( GetOwner() && GetOwner()->IsPlayer() )
	{
		// Show it if it's active...
		return (m_iState == WEAPON_IS_ACTIVE);
	}

	// FIXME: We may want to only show active weapons on NPCs
	// These are carried by AIs; always show them
	return true;
}

//-----------------------------------------------------------------------------
// Purpose: Return true if a weapon-pickup icon should be displayed when this weapon is received
//-----------------------------------------------------------------------------
bool C_BaseCombatWeapon::ShouldDrawPickup( void )
{
	if ( m_bJustRestored )
		return false;

	return true;
}
		   
//-----------------------------------------------------------------------------
// Purpose: Render the weapon. Draw the Viewmodel if the weapon's being carried
//			by this player, otherwise draw the worldmodel.
//-----------------------------------------------------------------------------
int C_BaseCombatWeapon::DrawModel( int flags )
{
	VPROF_BUDGET( "C_BaseCombatWeapon::DrawModel", VPROF_BUDGETGROUP_MODEL_RENDERING );
	if ( !m_bReadyToDraw )
		return 0;

	if ( !ShouldDraw() )
		return 0;

//	model = modelinfo->GetModel( m_iWorldModelIndex );
	return BaseClass::DrawModel( flags );
}
