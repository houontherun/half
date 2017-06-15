//========= Copyright � 1996-2003, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
//=============================================================================

#ifndef PLAYER_H
#define PLAYER_H
#ifdef _WIN32
#pragma once
#endif

#include "basecombatcharacter.h"
#include "usercmd.h"
#include "playerlocaldata.h"
#include "PlayerState.h"

#define CMD_MAXBACKUP 30

// For queuing and processing usercmds
class CCommandContext
{
public:
	CUserCmd		cmds[ CMD_MAXBACKUP ];

	int				numcmds;
	int				totalcmds;
	int				dropped_packets;
	bool			paused;
};

//-----------------------------------------------------------------------------
// Forward declarations: 
//-----------------------------------------------------------------------------
class CBaseCombatWeapon;
class CBaseViewModel;
class CTeam;
class IPhysicsPlayerController;
class IServerVehicle;
class CUserCmd;

// for step sounds
struct surfacedata_t;


//#define PLAYER_FATAL_FALL_SPEED		1024// approx 60 feet
//#define PLAYER_MAX_SAFE_FALL_SPEED	580// approx 20 feet
//#define DAMAGE_FOR_FALL_SPEED		(float) 100 / ( PLAYER_FATAL_FALL_SPEED - PLAYER_MAX_SAFE_FALL_SPEED )// damage per unit per second.
//#define PLAYER_MIN_BOUNCE_SPEED		200
//#define PLAYER_FALL_PUNCH_THRESHHOLD (float)350 // won't punch player's screen/make scrape noise unless player falling at least this fast.

// !!!set this bit on guns and stuff that should never respawn.
#define	SF_NORESPAWN	( 1 << 30 )

//
// Player PHYSICS FLAGS bits
//
enum PlayerPhysFlag_e
{
	PFLAG_ONLADDER		= ( 1<<0 ),
	PFLAG_ONSWING		= ( 1<<0 ),
	PFLAG_DIROVERRIDE	= ( 1<<1 ),		// override the player's directional control (trains, physics gun, etc.)
	PFLAG_DUCKING		= ( 1<<3 ),		// In the process of ducking, but totally squatted yet
	PFLAG_USING			= ( 1<<4 ),		// Using a continuous entity
	PFLAG_OBSERVER		= ( 1<<5 ),		// player is locked in stationary cam mode. Spectators can move, observers can't.

	// If you add another flag here check that you aren't 
	// overwriting phys flags in the HL2 of TF2 player classes
};

//
// generic player
//
//-----------------------------------------------------
//This is Half-Life player entity
//-----------------------------------------------------
#define CSUITPLAYLIST	4		// max of 4 suit sentences queued up at any time
#define	SUIT_REPEAT_OK		0

#define SUIT_NEXT_IN_30SEC	30
#define SUIT_NEXT_IN_1MIN	60
#define SUIT_NEXT_IN_5MIN	300
#define SUIT_NEXT_IN_10MIN	600
#define SUIT_NEXT_IN_30MIN	1800
#define SUIT_NEXT_IN_1HOUR	3600

#define CSUITNOREPEAT		32

#define TEAM_NAME_LENGTH	16

// constant items
#define ITEM_HEALTHKIT		1
#define ITEM_BATTERY		4

#define AUTOAIM_2DEGREES  0.0348994967025
#define AUTOAIM_5DEGREES  0.08715574274766
#define AUTOAIM_8DEGREES  0.1391731009601
#define AUTOAIM_10DEGREES 0.1736481776669

#define AUTOAIM_20DEGREES 0.1736481776669*2	//FIXME: Okay fine, this isn't exactly right

// useful cosines
#define DOT_1DEGREE   0.9998476951564
#define DOT_2DEGREE   0.9993908270191
#define DOT_3DEGREE   0.9986295347546
#define DOT_4DEGREE   0.9975640502598
#define DOT_5DEGREE   0.9961946980917
#define DOT_6DEGREE   0.9945218953683
#define DOT_7DEGREE   0.9925461516413
#define DOT_8DEGREE   0.9902680687416
#define DOT_9DEGREE   0.9876883405951
#define DOT_10DEGREE  0.9848077530122
#define DOT_15DEGREE  0.9659258262891
#define DOT_20DEGREE  0.9396926207859
#define DOT_25DEGREE  0.9063077870367
#define DOT_30DEGREE  0.866025403784

//----------------------------------------------------
// Player Physics Shadow
//----------------------------------------------------
#define VPHYS_MAX_DISTANCE		2
#define VPHYS_MAX_VEL			10
#define VPHYS_MAX_DISTSQR		(VPHYS_MAX_DISTANCE*VPHYS_MAX_DISTANCE)
#define VPHYS_MAX_VELSQR		(VPHYS_MAX_VEL*VPHYS_MAX_VEL)

enum
{
	VPHYS_WALK = 0,
	VPHYS_CROUCH,
	VPHYS_NOCLIP,
};

extern bool gInitHUD;

class CBasePlayer : public CBaseCombatCharacter
{
public:
	DECLARE_CLASS( CBasePlayer, CBaseCombatCharacter );
protected:
	static edict_t *s_PlayerEdict; // must be set before calling constructor
public:
	DECLARE_DATADESC();
	DECLARE_SERVERCLASS();
	DECLARE_PREDICTABLE();

	CBasePlayer();
	~CBasePlayer();

	virtual void			UpdateOnRemove( void );

	static CBasePlayer		*CreatePlayer( const char *className, edict_t *ed );

	void					CreateViewModel( int viewmodelindex = 0 );
	CBaseViewModel			*GetViewModel( int viewmodelindex = 0 );
	void					HideViewModels( void );
	void					DestroyViewModels( void );

	CPlayerState			*PlayerData( void ) { return &pl; }
	
	void					AttachEdict( edict_t *pRequiredEdict = NULL ) {}  // players have their edicts assigned to them in the constructor, they can't be manually attached/detached
	void					DetachEdict( void ) {}
	int						RequiredEdictIndex( void ) { return ENTINDEX(edict()); } 

	void					LockPlayerInPlace( void );
	void					UnlockPlayer( void );

	virtual void			DrawDebugGeometryOverlays(void);
	
	// Networking is about to update this entity, let it override and specify it's own pvs
	virtual void			SetupVisibility( unsigned char *pvs, unsigned char *pas );

	virtual void			Spawn( void );
	virtual void			InitialSpawn( void );
	virtual void			InitHUD( void ) {}

	virtual void			PlayerDeathThink( void );

	virtual void			Jump( void );
	virtual void			Duck( void );

	void					AddToPlayerSimulationList( CBaseEntity *other );
	void					RemoveFromPlayerSimulationList( CBaseEntity *other );
	void					SimulatePlayerSimulatedEntities( void );
	void					ClearPlayerSimulationList( void );

	// Physics simulation (player executes it's usercmd's here)
	virtual void			PhysicsSimulate( void );
	virtual unsigned int	PhysicsSolidMaskForEntity( void ) const;

	virtual void			PreThink( void );
	virtual void			PostThink( void );
	virtual int				TakeHealth( float flHealth, int bitsDamageType );
	virtual void			TraceAttack( const CTakeDamageInfo &info, const Vector &vecDir, trace_t *ptr );
	virtual int				OnTakeDamage( const CTakeDamageInfo &info );
	virtual void			DamageEffect(float flDamage, int fDamageType);

	virtual void			OnDamagedByExplosion( const CTakeDamageInfo &info );
	void					CheckExplosionEffects( void );
	void					ClearExplosionEffects( void );
	int						GetExplosionEffects( void ) const;

	virtual Vector			EyePosition( );			// position of eyes
	const QAngle			&EyeAngles( );
	virtual const QAngle	&LocalEyeAngles();		// Direction of eyes
	void					EyeVectors( Vector *pForward, Vector *pRight = NULL, Vector *pUp = NULL );

	// Sets the view angles
	void					SnapEyeAngles( const QAngle &viewAngles );

	virtual QAngle			BodyAngles();
	virtual Vector			BodyTarget( const Vector &posSrc, bool bNoisy);
	virtual bool			ShouldFadeOnDeath( void ) { return FALSE; }
	
	int						OnTakeDamage_Alive( const CTakeDamageInfo &info );
	virtual void			Event_Killed( const CTakeDamageInfo &info );
	void					Event_Dying( void );

	virtual	bool			IsPlayer( void ) const { return true; }			// Spectators return TRUE for this, use IsObserver to seperate cases
	virtual bool			IsNetClient( void ) { return true; }		// Bots should return FALSE for this, they can't receive NET messages
																		// Spectators should return TRUE for this

	// Get the client index (entindex-1).
	int						GetClientIndex()	{ return ENTINDEX( edict() ) - 1; }

	virtual void			VelocityPunch( const Vector &vecForce );
	virtual void			ViewPunch( const QAngle &angleOffset );
	void					ViewPunchReset( float tolerance = 0 );
	void					ShowViewModel(bool bShow);

	// View model prediction setup
	void					CalcPlayerView( Vector& eyeOrigin, QAngle& eyeAngles, float& fov );
	void					CalcVehicleView( IServerVehicle *pVehicle, Vector& eyeOrigin, QAngle& eyeAngles, 	
								float& zNear, float& zFar, float& fov );
	void					CalcObserverView( Vector& eyeOrigin, QAngle& eyeAngles, float& fov );
	// Handle view smoothing when going up stairs
	void					SmoothViewOnStairs( Vector& eyeOrigin );
	float					CalcRoll (const QAngle& angles, const Vector& velocity, float rollangle, float rollspeed);
	void					CalcViewRoll( QAngle& eyeAngles );
	float					GetWaterOffset( const Vector& eyePosition );

	virtual void			GetAimVector( float speed, float aimfactor, Vector& result );

	virtual int				Save( ISave &save );
	virtual int				Restore( IRestore &restore );
	virtual bool			ShouldSavePhysics();

	virtual void			PackDeadPlayerItems( void );
	virtual void			RemoveAllItems( bool removeSuit );
	bool					IsDead() const;

	// Weapon stuff
	virtual Vector			Weapon_ShootPosition( );
	virtual bool			Weapon_CanUse( CBaseCombatWeapon *pWeapon );
	virtual void			Weapon_Equip( CBaseCombatWeapon *pWeapon );
	virtual	void			Weapon_Drop( CBaseCombatWeapon *pWeapon, const Vector *pvecTarget /* = NULL */, const Vector *pVelocity /* = NULL */ );
	virtual	bool			Weapon_Switch( CBaseCombatWeapon *pWeapon, int viewmodelindex = 0 );		// Switch to given weapon if has ammo (false if failed)
	virtual void			Weapon_SetLast( CBaseCombatWeapon *pWeapon );
	virtual bool			Weapon_ShouldSetLast( CBaseCombatWeapon *pOldWeapon, CBaseCombatWeapon *pNewWeapon ) { return true; }
	virtual bool			Weapon_ShouldSelectItem( CBaseCombatWeapon *pWeapon );
	void					Weapon_DropSlot( int weaponSlot );

	// JOHN:  sends custom messages if player HUD data has changed  (eg health, ammo)
	virtual void			UpdateClientData( void );
	
	// Player is moved across the transition by other means
	virtual int				ObjectCaps( void ) { return BaseClass::ObjectCaps() & ~FCAP_ACROSS_TRANSITION; }
	virtual void			Precache( void );
	bool					IsOnLadder( void );

	virtual int				FlashlightIsOn( void ) { return false; }
	virtual void			FlashlightTurnOn( void ) { };
	virtual void			FlashlightTurnOff( void ) { };
	
	void					UpdatePlayerSound ( void );
	virtual void			DeathSound ( void );

	Class_T					Classify ( void );
	virtual void			SetAnimation( PLAYER_ANIM playerAnim );
	void					SetWeaponAnimType( const char *szExtention );

	// custom player functions
	virtual void			ImpulseCommands( void );
	virtual void			CheatImpulseCommands( int iImpulse );
	virtual bool			ClientCommand(const char *cmd);
	
	// Observer functions
	virtual bool			StartObserverMode( Vector vecPosition, QAngle vecViewAngle ); // true, if successful
	virtual void			StopObserverMode();	// stop spectator mode
	virtual bool			SetObserverMode(int mode); // sets new observer mode, returns true if successful
	virtual int				GetObserverMode(); // returns observer mode or OBS_NONE
	virtual bool			SetObserverTarget(CBaseEntity * target);
	virtual CBaseEntity		*GetObserverTarget();	// returns players targer or NULL
	virtual CBaseEntity		*FindNextObserverTarget( bool bReverse ); // returns next/prev player to follow or NULL
	virtual bool			IsValidObserverTarget(CBaseEntity * target); // true, if player is allowed to see this target
	virtual void			CheckObserverSettings(); // checks, if target still valid (didn't die etc)
	virtual void			ForceObserverMode(int mode); // sets a temporary mode, force because of invalid targets
	virtual void			ResetObserverMode(); // resets all observer related settings

	virtual void			StartDeathCam( void );
	virtual void			CreateCorpse( void ) { }
	virtual CBaseEntity		*EntSelectSpawnPoint( void );

	// Vehicles
	bool					IsInAVehicle( void ) const;
	virtual void			GetInVehicle( IServerVehicle *pVehicle, int nRole );
	void					LeaveVehicle( const Vector &vecExitPoint = vec3_origin, const QAngle &vecExitAngles = vec3_angle );
	
	// override these for 
	virtual void			OnVehicleStart() {}
	virtual void			OnVehicleEnd( Vector &playerDestPosition ) {} 
	IServerVehicle			*GetVehicle();
	CBaseEntity				*GetVehicleEntity( void );
	bool					UsingStandardWeaponsInVehicle( void );
	
	void					AddPoints( int score, bool bAllowNegativeScore );
	void					AddPointsToTeam( int score, bool bAllowNegativeScore );
	virtual bool			BumpWeapon( CBaseCombatWeapon *pWeapon );
	bool					RemovePlayerItem( CBaseCombatWeapon *pItem );
	CBaseEntity				*HasNamedPlayerItem( const char *pszItemName );
	bool 					HasWeapons( void );// do I have ANY weapons?
	virtual void			SelectLastItem(void);
	virtual void 			SelectItem( const char *pstr, int iSubType = 0 );
	void					ItemPreFrame( void );
	virtual void			ItemPostFrame( void );
	virtual CBaseEntity		*GiveNamedItem( const char *szName, int iSubType = 0 );
	void					EnableControl(bool fControl);
	void					AbortReload( void );

	void					SendAmmoUpdate(void);

	void					WaterMove( void );
	float					GetWaterJumpTime() const;
	virtual void			PlayerUse( void );
	CBaseEntity				*FindUseEntity( void );
	virtual bool			IsUseableEntity( CBaseEntity *pEntity, unsigned int requiredCaps );
	bool					ClearUseEntity();

	// physics interactions
	// mass/size limit set to zero for none
	static bool				CanPickupObject( CBaseEntity *pObject, float massLimit, float sizeLimit );
	virtual void			PickupObject( CBaseEntity *pObject ) {}
	virtual void			ForceDropOfCarriedPhysObjects( void ) {}

	void					CheckSuitUpdate();
	void					SetSuitUpdate(char *name, int fgroup, int iNoRepeat);
	void					UpdateGeigerCounter( void );
	void					CheckTimeBasedDamage( void );

	void					ResetAutoaim( void );
	Vector					GetAutoaimVector( float flDelta  );
	QAngle					AutoaimDeflection( Vector &vecSrc, float flDist, float flDelta  );
	bool					ShouldAutoaim( void );
	void					SetTargetInfo( Vector &vecSrc, float flDist );


	virtual void			ForceClientDllUpdate( void );  // Forces all client .dll specific data to be resent to client.

	void					DeathMessage( CBaseEntity *pKiller );

	virtual void			ProcessUsercmds( CUserCmd *cmds, int numcmds, int totalcmds,
								int dropped_packets, bool paused );

	// Run a user command. The default implementation calls ::PlayerRunCommand. In TF, this controls a vehicle if
	// the player is in one.
	virtual void			PlayerRunCommand(CUserCmd *ucmd, IMoveHelper *moveHelper);

	// Team Handling
	virtual void			ChangeTeam( int iTeamNum );

	// say/sayteam allowed?
	virtual bool			CanSpeak( void ) { return true; }
	audioparams_t			&GetAudioParams() { return m_Local.m_audio; }

	static  void			ModifyOrAppendPlayerCriteria( AI_CriteriaSet& set );

	const QAngle& GetPunchAngle();
	void SetPunchAngle( const QAngle &punchAngle );


public:
	// Player Physics Shadow
	void					SetupVPhysicsShadow( CPhysCollide *pStandModel, const char *pStandHullName, CPhysCollide *pCrouchModel, const char *pCrouchHullName );
	IPhysicsPlayerController* GetPhysicsController() { return m_pPhysicsController; }
	virtual void			VPhysicsCollision( int index, gamevcollisionevent_t *pEvent );
	void					VPhysicsUpdate( IPhysicsObject *pPhysics );
	virtual void			VPhysicsShadowUpdate( IPhysicsObject *pPhysics );
	virtual void			VPhysicsGetShadowVelocity( IPhysicsObject *pPhysics, Vector &outVel );
	virtual bool			IsFollowingPhysics( void ) { return false; }

	void					SetTouchedPhysics( bool bTouch );
	bool					TouchedPhysics( void );
	Vector					GetSmoothedVelocity( void );

	virtual void			InitVCollision( void );
	virtual void			VPhysicsDestroyObject();
	void					SetVCollisionState( int collisionState );
	void					PostThinkVPhysics( void );
	virtual void			UpdatePhysicsShadowToCurrentPosition();
	void					UpdateVPhysicsPosition( const Vector &position, const Vector &velocity );

	// Accessor methods
	int		FragCount() const		{ return m_iFrags; }
	int		DeathCount() const		{ return m_iDeaths;}
	bool	IsConnected() const		{ return m_bConnected; }
	bool	IsSuitEquipped() const	{ return m_Local.m_bWearingSuit; }
	const char *TeamName() const	{ return m_szTeamName; }
	int		ArmorValue() const		{ return m_ArmorValue; }
	bool	HUDNeedsRestart() const { return m_fInitHUD; }
	float	MaxSpeed() const		{ return m_flMaxspeed; }
	Activity GetActivity( ) const	{ return m_Activity; }
	inline void SetActivity( Activity eActivity ) { m_Activity = eActivity; }
	bool	IsPlayerLockedInPlace() const { return m_iPlayerLocked != 0; }
	bool	IsObserver() const		{ return (m_afPhysicsFlags & PFLAG_OBSERVER) != 0; }
	bool	IsOnTarget() const		{ return m_fOnTarget; }
	float	MuzzleFlashTime() const { return m_flFlashTime; }
	float	PlayerDrownTime() const	{ return m_AirFinished; }

	void	ResetFragCount() { m_iFrags = 0; }
	void	IncrementFragCount( int nCount ) { m_iFrags += nCount; }

	void	ResetDeathCount() { m_iDeaths = 0; }
	void	IncrementDeathCount( int nCount ) { m_iDeaths += nCount; }

	void	SetArmorValue( int value );
	void	IncrementArmorValue( int nCount, int nMaxValue = -1 );

	void	SetConnected( bool bConnected ) { m_bConnected = bConnected; }
	void	EquipSuit() { m_Local.m_bWearingSuit = true; }
	void	SetTeamName( const char *pTeamName );
	void	SetMaxSpeed( float flMaxSpeed ) { m_flMaxspeed = flMaxSpeed; }

	void	NotifyNearbyRadiationSource( float flRange );

	void	SetAnimationExtension( const char *pExtension );

	void	SetAdditionalPVSOrigin( const Vector &vecOrigin );
	void	SetCameraPVSOrigin( const Vector &vecOrigin );
	void	SetMuzzleFlashTime( float flTime );
	void	SetUseEntity( CBaseEntity *pUseEntity );

	// Only used by the physics gun... is there a better interface?
	void	SetPhysicsFlag( int nFlag, bool bSet );

	void	AllowImmediateDecalPainting();

	// Suicide...
	void	CommitSuicide();

	// For debugging...
	void	ForceOrigin( const Vector &vecOrigin );

	// Bot accessors...
	void	SetTimeBase( float flTimeBase );
	float	GetTimeBase() const;
	void	SetLastUserCommand( const CUserCmd &cmd );
	CUserCmd const *GetLastUserCommand( void );

	bool	IsPredictingWeapons( void ) const; 
	int		CurrentCommandNumber() const;

	int		GetFOV() const;
	void	SetFOV( int FOV, float zoomRate = 0.0f );

	int		GetImpulse( void ) const { return m_nImpulse; }

	// Movement constraints
	void	ActivateMovementConstraint( CBaseEntity *pEntity, const Vector &vecCenter, float flRadius, float flConstraintWidth, float flSpeedFactor );
	void	DeactivateMovementConstraint( );

private:
	
	// For queueing up CUserCmds and running them from PhysicsSimulate
	int					GetCommandContextCount( void ) const;
	CCommandContext		*GetCommandContext( int index );
	CCommandContext		*AllocCommandContext( void );
	void				RemoveCommandContext( int index );
	void				RemoveAllCommandContexts( void );

	int					DetermineSimulationTicks( void );
	void				AdjustPlayerTimeBase( int simulation_ticks );

public:
	// FIXME: Make these protected or private!

	// This player's data that should only be replicated to 
	//  the player and not to other players.
	CNetworkVarEmbedded( CPlayerLocalData, m_Local );

	// Player data that's sometimes needed by the engine
	CNetworkVarEmbedded( CPlayerState, pl );

	IMPLEMENT_NETWORK_VAR_FOR_DERIVED( m_vecViewOffset );
	IMPLEMENT_NETWORK_VAR_FOR_DERIVED( m_flFriction );
	IMPLEMENT_NETWORK_VAR_FOR_DERIVED( m_lifeState );
	IMPLEMENT_NETWORK_VAR_FOR_DERIVED( m_hGroundEntity );
	IMPLEMENT_NETWORK_VAR_FOR_DERIVED( m_iAmmo );

	int						m_nButtons;
	int						m_afButtonPressed;
	int						m_afButtonReleased;
	int						m_afButtonLast;

	CNetworkVar( bool, m_fOnTarget );		//Is the crosshair on a target?

	CNetworkVar( int, m_iObserverMode );	// if in spectator mode != 0

	int						m_iObserverLastMode; // last used observer mode
	CNetworkHandle( CBaseEntity, m_hObserverTarget );	// entity handle to m_iObserverTarget
	bool					m_bForcedObserverMode; // true, player was forced by invalid targets to switch mode

	EHANDLE					m_hAutoAimTarget;	//If the crosshair is on a target, this is it

	char					m_szAnimExtension[32];

private:

	Activity				m_Activity;

protected:
	// FIXME: Make these private! (tf_player uses them)

	// Secondary point to derive PVS from when zoomed in with binoculars/sniper rifle.  The PVS is 
	//  a merge of the standing origin and this additional origin
	Vector					m_vecAdditionalPVSOrigin; 
	// Extra PVS origin if we are using a camera object
	Vector					m_vecCameraPVSOrigin;

	EHANDLE					m_hUseEntity;			// the player is currently controlling this entity because of +USE latched, NULL if no entity

	int						m_iTrain;				// Train control position

	float					m_iRespawnFrames;	// used in PlayerDeathThink() to make sure players can always respawn
 	unsigned int			m_afPhysicsFlags;	// physics flags - set when 'normal' physics should be revisited or overriden
	
	// Vehicles
	CNetworkHandle( CBaseEntity, m_hVehicle );

	void					UpdateButtonState( int nUserCmdButtonMask );

	int						m_lastDamageAmount;		// Last damage taken

	Vector					m_DmgOrigin;
	float					m_DmgTake;
	float					m_DmgSave;
	int						m_bitsDamageType;	// what types of damage has player taken
	int						m_bitsHUDDamage;	// Damage bits for the current fame. These get sent to the hud via gmsgDamage

	float					m_fDeadTime;			// the time at which the player died  (used in PlayerDeathThink())

private:
	void HandleFuncTrain();

// DATA
private:
	CUtlVector< CCommandContext > m_CommandContext;
	// Player Physics Shadow
	IPhysicsPlayerController	*m_pPhysicsController;
	IPhysicsObject				*m_pShadowStand;
	IPhysicsObject				*m_pShadowCrouch;
	int							m_vphysicsCollisionState;
	Vector						m_oldOrigin;
	Vector						m_vecSmoothedVelocity;
	bool						m_touchedPhysObject;

	int						m_iPlayerSound;// the index of the sound list slot reserved for this player
	int						m_iTargetVolume;// ideal sound volume. 
	
	int						m_rgItems[MAX_ITEMS];

	float					m_fNextSuicideTime; // the time after which the player can next use the suicide command


	// these are time-sensitive things that we keep track of
	float					m_flTimeStepSound;	// when the last stepping sound was made
	float					m_flSwimTime;		// how long player has been underwater
	float					m_flDuckTime;		// how long we've been ducking

	float					m_flSuitUpdate;					// when to play next suit update
	int						m_rgSuitPlayList[CSUITPLAYLIST];// next sentencenum to play for suit update
	int						m_iSuitPlayNext;				// next sentence slot for queue storage;
	int						m_rgiSuitNoRepeat[CSUITNOREPEAT];		// suit sentence no repeat list
	float					m_rgflSuitNoRepeatTime[CSUITNOREPEAT];	// how long to wait before allowing repeat
	float					m_tbdPrev;				// Time-based damage timer

	float					m_flgeigerRange;		// range to nearest radiation source
	float					m_flgeigerDelay;		// delay per update of range msg to client
	int						m_igeigerRangePrev;
	int						m_iStepLeft;			// alternate left/right foot stepping sound
	char					m_chTextureType;		// current texture type

	int						m_idrowndmg;			// track drowning damage taken
	int						m_idrownrestored;		// track drowning damage restored

	int						m_nPoisonDmg;			// track recoverable poison damage taken
	int						m_nPoisonRestored;		// track poison damage restored

	bool					m_fInitHUD;				// True when deferred HUD restart msg needs to be sent
	bool					m_fGameHUDInitialized;
	bool					m_fWeapon;				// Set this to FALSE to force a reset of the current weapon HUD info

	bool					m_fNoPlayerSound;	// a debugging feature. Player makes no sound if this is true. 
	
	int						m_iUpdateTime;		// stores the number of frame ticks before sending HUD update messages
	int						m_iClientBattery;	// the Battery currently known by the client.  If this changes, send a new

	// Autoaim data
	QAngle					m_vecAutoAim;
	int						m_lastx, m_lasty;	// These are the previous update's crosshair angles, DON"T SAVE/RESTORE

	int						m_iFrags;
	int						m_iDeaths;

	float					m_flNextDecalTime;// next time this player can spray a decal

	// Team Handling
	char					m_szTeamName[TEAM_NAME_LENGTH];

	// Multiplayer handling
	bool					m_bConnected;		// True if the player's connected

	// from edict_t
	// CBasePlayer doesn't send this but CCSPlayer does.
	CNetworkVarForDerived( int, m_ArmorValue );
	float					m_AirFinished;
	float					m_PainFinished;

	// player locking
	int						m_iPlayerLocked;

	// the player's personal view model
	typedef CHandle<CBaseViewModel> CBaseViewModelHandle;

	CNetworkArray( CBaseViewModelHandle, m_hViewModel, MAX_VIEWMODELS );

// Replicated to all clients
	CNetworkVar( float, m_flMaxspeed );
	
// Not transmitted
	float					m_flWaterJumpTime;  // used to be called teleport_time
	Vector					m_vecWaterJumpVel;
	int						m_nImpulse;
	float					m_flStepSoundTime;
	float					m_flSwimSoundTime;
	Vector					m_vecLadderNormal;

	float					m_flFlashTime;
	int						m_nDrownDmgRate;		// Drowning damage in points per second without air.

	// Used in test code to teleport the player to random locations in the map.
	Vector					m_vForcedOrigin;
	bool					m_bForceOrigin;	

	// Clients try to run on their own realtime clock, this is this client's clock
	CNetworkVar( int, m_nTickBase );

	// Last received usercmd (in case we drop a lot of packets )
	CUserCmd				m_LastCmd;
	CUserCmd				*m_pCurrentCommand;
	
	// NOTE: bits damage type appears to only be used for time-based damage
	BYTE						m_rgbTimeBasedDamage[CDMG_TIMEBASED];
	CNetworkVar( CBaseCombatWeaponHandle, m_hLastWeapon );

	CUtlVector< CHandle< CBaseEntity > > m_SimulatedByThisPlayer;

	CNetworkVar( int, m_nExplosionFX );
	float					m_flExplosionFXEndTime;

	float					m_flOldPlayerZ;

	bool					m_bPlayerUnderwater;

	// Movement constraints
	CNetworkHandle( CBaseEntity, m_hConstraintEntity );
	CNetworkVector( m_vecConstraintCenter );
	CNetworkVar( float, m_flConstraintRadius );
	CNetworkVar( float, m_flConstraintWidth );
	CNetworkVar( float, m_flConstraintSpeedFactor );

	friend class CPlayerMove;
	friend class CPlayerClass;

	// HACK FOR TF2 Prediction
	friend class CTFGameMovementRecon;
	friend class CGameMovement;
	friend class CTFGameMovement;
	friend class CHL1GameMovement;
};

EXTERN_SEND_TABLE(DT_BasePlayer)


//-----------------------------------------------------------------------------
// Helper functions implemented in this module.
//-----------------------------------------------------------------------------

bool IsSpawnPointValid( CBaseEntity *pPlayer, CBaseEntity *pSpot );


//-----------------------------------------------------------------------------
// Inline methods
//-----------------------------------------------------------------------------
inline void CBasePlayer::SetAdditionalPVSOrigin( const Vector &vecOrigin ) 
{ 
	m_vecAdditionalPVSOrigin = vecOrigin; 
}

inline void CBasePlayer::SetCameraPVSOrigin( const Vector &vecOrigin ) 
{ 
	m_vecCameraPVSOrigin = vecOrigin; 
}

inline void CBasePlayer::SetMuzzleFlashTime( float flTime ) 
{ 
	m_flFlashTime = flTime; 
}

inline void CBasePlayer::SetUseEntity( CBaseEntity *pUseEntity ) 
{ 
	m_hUseEntity = pUseEntity; 
}

// Bot accessors...
inline void CBasePlayer::SetTimeBase( float flTimeBase ) 
{ 
	m_nTickBase = TIME_TO_TICKS( flTimeBase ); 
}

inline void CBasePlayer::SetLastUserCommand( const CUserCmd &cmd ) 
{ 
	m_LastCmd = cmd; 
}

inline CUserCmd const *CBasePlayer::GetLastUserCommand( void )
{
	return &m_LastCmd;
}

inline bool CBasePlayer::IsPredictingWeapons( void ) const 
{
	return m_LastCmd.predict_weapons;
}

inline int CBasePlayer::CurrentCommandNumber() const
{
	Assert( m_pCurrentCommand );
	return m_pCurrentCommand->command_number;
}

inline IServerVehicle *CBasePlayer::GetVehicle() 
{ 
	CBaseEntity *pVehicleEnt = m_hVehicle.Get();
	return pVehicleEnt ? pVehicleEnt->GetServerVehicle() : NULL;
}

inline CBaseEntity *CBasePlayer::GetVehicleEntity() 
{ 
	return m_hVehicle.Get();
}

inline bool CBasePlayer::IsInAVehicle( void ) const 
{ 
	return ( NULL != m_hVehicle.Get() ) ? true : false; 
}

inline void CBasePlayer::SetTouchedPhysics( bool bTouch ) 
{ 
	m_touchedPhysObject = bTouch; 
}

inline bool CBasePlayer::TouchedPhysics( void )			
{ 
	return m_touchedPhysObject; 
}

inline Vector CBasePlayer::GetSmoothedVelocity( void )
{ 
	return m_vecSmoothedVelocity; 
}


//-----------------------------------------------------------------------------
// Converts an entity to a player
//-----------------------------------------------------------------------------
inline CBasePlayer *ToBasePlayer( CBaseEntity *pEntity )
{
	if ( !pEntity || !pEntity->IsPlayer() )
		return NULL;
#if _DEBUG
	return dynamic_cast<CBasePlayer *>( pEntity );
#else
	return static_cast<CBasePlayer *>( pEntity );
#endif
}

#endif // PLAYER_H
