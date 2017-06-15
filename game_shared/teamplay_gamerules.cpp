//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================
#include "cbase.h"
#include "player.h"
#include "gamerules.h"
#include "teamplay_gamerules.h"
#include "game.h"
#include "team.h"

static char team_names[MAX_TEAMS][MAX_TEAMNAME_LENGTH];
static int team_scores[MAX_TEAMS];
static int num_teams = 0;

extern bool		g_fGameOver;


LINK_ENTITY_TO_CLASS( teamplay_gamerules, CTeamplayRules );

CTeamplayRules :: CTeamplayRules()
{
	m_DisableDeathMessages = false;
	m_DisableDeathPenalty = false;

	memset( team_names, 0, sizeof(team_names) );
	memset( team_scores, 0, sizeof(team_scores) );
	num_teams = 0;

	// Copy over the team from the server config
	m_szTeamList[0] = 0;

	RecountTeams();
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CTeamplayRules::Precache( void )
{
	// Call the Team Manager's precaches
	for ( int i = 1; i <= GetNumberOfTeams(); i++ )
	{
		CTeam *pTeam = GetGlobalTeam( i );
		pTeam->Precache();
	}
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CTeamplayRules :: Think ( void )
{
	BaseClass::Think();

	///// Check game rules /////

	if ( g_fGameOver )   // someone else quit the game already
	{
		BaseClass::Think();
		return;
	}

	float flTimeLimit = timelimit.GetFloat() * 60;
	
	if ( flTimeLimit != 0 && gpGlobals->curtime >= flTimeLimit )
	{
		ChangeLevel();
		return;
	}

	float flFragLimit = fraglimit.GetFloat();
	if ( flFragLimit )
	{
		// check if any team is over the frag limit
		for ( int i = 0; i < num_teams; i++ )
		{
			if ( team_scores[i] >= flFragLimit )
			{
				ChangeLevel();
				return;
			}
		}
	}
}

//=========================================================
// ClientCommand
// the user has typed a command which is unrecognized by everything else;
// this check to see if the gamerules knows anything about the command
//=========================================================
bool CTeamplayRules::ClientCommand( const char *pcmd, CBaseEntity *pEdict )
{
	if( BaseClass::ClientCommand(pcmd, pEdict) )
		return true;
	
	if ( FStrEq( pcmd, "menuselect" ) )
	{
		if ( engine->Cmd_Argc() < 2 )
			return true;

		//int slot = atoi( engine->Cmd_Argv(1) );

		// select the item from the current menu

		return true;
	}

	return false;
}

void CTeamplayRules :: UpdateGameMode( CBasePlayer *pPlayer )
{
	CSingleUserRecipientFilter user( pPlayer );
	user.MakeReliable();
	UserMessageBegin( user, "GameMode" );
		WRITE_BYTE( 1 );  // game mode teamplay
	MessageEnd();
}


const char *CTeamplayRules::SetDefaultPlayerTeam( CBasePlayer *pPlayer )
{
	// copy out the team name from the model
	char *mdls = engine->InfoKeyValue( engine->GetInfoKeyBuffer( pPlayer->edict() ), "model" );
	pPlayer->SetTeamName( mdls );

	RecountTeams();

	// update the current player of the team he is joining
	if ( (pPlayer->TeamName())[0] == '\0' || !IsValidTeam( pPlayer->TeamName() ) || defaultteam.GetFloat() )
	{
		const char *pTeamName = NULL;
		
		if ( defaultteam.GetFloat() )
		{
			pTeamName = team_names[0];
		}
		else
		{
			pTeamName = TeamWithFewestPlayers();
		}
		pPlayer->SetTeamName( pTeamName );
	}

	return pPlayer->TeamName();
}


//=========================================================
// InitHUD
//=========================================================
void CTeamplayRules::InitHUD( CBasePlayer *pPlayer )
{
	SetDefaultPlayerTeam( pPlayer );
	BaseClass::InitHUD( pPlayer );

	RecountTeams();

	char *mdls = engine->InfoKeyValue( engine->GetInfoKeyBuffer( pPlayer->edict() ), "model" );
	// update the current player of the team he is joining
	char text[1024];
	if ( !strcmp( mdls, pPlayer->TeamName() ) )
	{
		Q_snprintf( text,sizeof(text), "You are on team \'%s\'\n", pPlayer->TeamName() );
	}
	else
	{
		Q_snprintf( text,sizeof(text), "You were assigned to team %s\n", pPlayer->TeamName() );
	}

	ChangePlayerTeam( pPlayer, pPlayer->TeamName(), false, false );
	if ( Q_strlen( pPlayer->TeamName() ) > 0 )
	{
		UTIL_SayText( text, pPlayer );
	}
	RecountTeams();
}


void CTeamplayRules::ChangePlayerTeam( CBasePlayer *pPlayer, const char *pTeamName, bool bKill, bool bGib )
{
	int damageFlags = DMG_GENERIC;
	int clientIndex = pPlayer->entindex();

	if ( !bGib )
	{
		damageFlags |= DMG_NEVERGIB;
	}
	else
	{
		damageFlags |= DMG_ALWAYSGIB;
	}


	// copy out the team name from the model
	pPlayer->SetTeamName( pTeamName );

	engine->SetClientKeyValue( clientIndex, engine->GetInfoKeyBuffer( pPlayer->edict() ), "model", pPlayer->TeamName() );
	engine->SetClientKeyValue( clientIndex, engine->GetInfoKeyBuffer( pPlayer->edict() ), "team", pPlayer->TeamName() );
}

//-----------------------------------------------------------------------------
// Purpose: Player has just left the game
//-----------------------------------------------------------------------------
void CTeamplayRules::ClientDisconnected( edict_t *pClient )
{
	// Msg( "CLIENT DISCONNECTED, REMOVING FROM TEAM.\n" );

	CBasePlayer *pPlayer = (CBasePlayer *)CBaseEntity::Instance( pClient );
	if ( pPlayer )
	{
		// Remove the player from his team
		if ( pPlayer->GetTeam() )
		{
			pPlayer->ChangeTeam(0);
		}
	}

	BaseClass::ClientDisconnected( pClient );
}

//=========================================================
// ClientUserInfoChanged
//=========================================================
void CTeamplayRules::ClientUserInfoChanged( CBasePlayer *pPlayer, char *infobuffer )
{
	char text[1024];

	// prevent skin/color/model changes
	char *mdls = engine->InfoKeyValue( infobuffer, "model" );

	if ( !stricmp( mdls, pPlayer->TeamName() ) )
		return;

	if ( defaultteam.GetFloat() )
	{
		int clientIndex = pPlayer->entindex();

		engine->SetClientKeyValue( clientIndex, engine->GetInfoKeyBuffer( pPlayer->edict() ), "model", pPlayer->TeamName() );
		engine->SetClientKeyValue( clientIndex, engine->GetInfoKeyBuffer( pPlayer->edict() ), "team", pPlayer->TeamName() );
		UTIL_SayText( "Not allowed to change teams in this game!\n", pPlayer );
		return;
	}

	if ( defaultteam.GetFloat() || !IsValidTeam( mdls ) )
	{
		int clientIndex = pPlayer->entindex();

		engine->SetClientKeyValue( clientIndex, engine->GetInfoKeyBuffer( pPlayer->edict() ), "model", pPlayer->TeamName() );
		Q_snprintf( text,sizeof(text), "Can't change team to \'%s\'\n", mdls );
		UTIL_SayText( text, pPlayer );
		Q_snprintf( text,sizeof(text), "Server limits teams to \'%s\'\n", m_szTeamList );
		UTIL_SayText( text, pPlayer );
		return;
	}
	// notify everyone of the team change
	if ( Q_strlen( STRING(pPlayer->pl.netname) ) > 0 )
	{
		Q_snprintf( text,sizeof(text), "%s has changed to team \'%s\'\n", STRING(pPlayer->pl.netname), mdls );
		UTIL_SayTextAll( text, pPlayer );
	}

	UTIL_LogPrintf( "\"%s<%i>\" changed to team %s\n", STRING( pPlayer->pl.netname ), engine->GetPlayerUserId( pPlayer->edict() ), mdls );

	ChangePlayerTeam( pPlayer, mdls, true, true );
	// recound stuff
	RecountTeams();
}

//=========================================================
// Deathnotice. 
//=========================================================
void CTeamplayRules::DeathNotice( CBasePlayer *pVictim, const CTakeDamageInfo &info )
{
	if ( m_DisableDeathMessages )
		return;

	CBaseEntity *pKiller = info.GetAttacker();
	if ( pVictim && pKiller && pKiller->GetFlags() & FL_CLIENT )
	{
		CBasePlayer *pk = (CBasePlayer*)pKiller;

		if ( pk )
		{
			if ( (pk != pVictim) && (PlayerRelationship( pVictim, pk ) == GR_TEAMMATE) )
			{
				CRelieableBroadcastRecipientFilter filter;

				// TODO we are sending this message twice ?? in BaseClass::DeathNotice too.
				UserMessageBegin( filter, "DeathMsg" );	
					WRITE_BYTE( pKiller->entindex() );		// the killer
					WRITE_BYTE( pVictim->entindex() );	// the victim
					WRITE_STRING( "teammate" );		// flag this as a teammate kill
				MessageEnd();
				return;
			}
		}
	}

	BaseClass::DeathNotice( pVictim, info );
}

//=========================================================
//=========================================================
void CTeamplayRules :: PlayerKilled( CBasePlayer *pVictim, const CTakeDamageInfo &info )
{
	if ( !m_DisableDeathPenalty )
	{
		BaseClass::PlayerKilled( pVictim, info );
		RecountTeams();
	}
}


//=========================================================
// IsTeamplay
//=========================================================
bool CTeamplayRules::IsTeamplay( void )
{
	return true;
}

bool CTeamplayRules::FPlayerCanTakeDamage( CBasePlayer *pPlayer, CBaseEntity *pAttacker )
{
	if ( pAttacker && PlayerRelationship( pPlayer, pAttacker ) == GR_TEAMMATE )
	{
		// my teammate hit me.
		if ( (friendlyfire.GetInt() == 0) && (pAttacker != pPlayer) )
		{
			// friendly fire is off, and this hit came from someone other than myself,  then don't get hurt
			return false;
		}
	}

	return BaseClass::FPlayerCanTakeDamage( pPlayer, pAttacker );
}

//=========================================================
//=========================================================
int CTeamplayRules::PlayerRelationship( CBaseEntity *pPlayer, CBaseEntity *pTarget )
{
	// half life multiplay has a simple concept of Player Relationships.
	// you are either on another player's team, or you are not.
	if ( !pPlayer || !pTarget || !pTarget->IsPlayer() )
		return GR_NOTTEAMMATE;

	if ( (*GetTeamID(pPlayer) != '\0') && (*GetTeamID(pTarget) != '\0') && !stricmp( GetTeamID(pPlayer), GetTeamID(pTarget) ) )
	{
		return GR_TEAMMATE;
	}

	return GR_NOTTEAMMATE;
}

//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *pListener - 
//			*pSpeaker - 
// Output : Returns true on success, false on failure.
//-----------------------------------------------------------------------------
bool CTeamplayRules::PlayerCanHearChat( CBasePlayer *pListener, CBasePlayer *pSpeaker )
{
	return ( PlayerRelationship( pListener, pSpeaker ) == GR_TEAMMATE );
}

//=========================================================
//=========================================================
bool CTeamplayRules::ShouldAutoAim( CBasePlayer *pPlayer, edict_t *target )
{
	// always autoaim, unless target is a teammate
	CBaseEntity *pTgt = CBaseEntity::Instance( target );
	if ( pTgt && pTgt->IsPlayer() )
	{
		if ( PlayerRelationship( pPlayer, pTgt ) == GR_TEAMMATE )
			return false; // don't autoaim at teammates
	}

	return BaseClass::ShouldAutoAim( pPlayer, target );
}

//=========================================================
//=========================================================
int CTeamplayRules::IPointsForKill( CBasePlayer *pAttacker, CBasePlayer *pKilled )
{
	if ( !pKilled )
		return 0;

	if ( !pAttacker )
		return 1;

	if ( pAttacker != pKilled && PlayerRelationship( pAttacker, pKilled ) == GR_TEAMMATE )
		return -1;

	return 1;
}

//=========================================================
//=========================================================
const char *CTeamplayRules::GetTeamID( CBaseEntity *pEntity )
{
	if ( pEntity == NULL || pEntity->pev == NULL )
		return "";

	// return their team name
	return pEntity->TeamID();
}


int CTeamplayRules::GetTeamIndex( const char *pTeamName )
{
	if ( pTeamName && *pTeamName != 0 )
	{
		// try to find existing team
		for ( int tm = 0; tm < num_teams; tm++ )
		{
			if ( !stricmp( team_names[tm], pTeamName ) )
				return tm;
		}
	}
	
	return -1;	// No match
}


const char *CTeamplayRules::GetIndexedTeamName( int teamIndex )
{
	if ( teamIndex < 0 || teamIndex >= num_teams )
		return "";

	return team_names[ teamIndex ];
}


bool CTeamplayRules::IsValidTeam( const char *pTeamName ) 
{
	if ( !m_teamLimit )	// Any team is valid if the teamlist isn't set
		return true;

	return ( GetTeamIndex( pTeamName ) != -1 ) ? true : false;
}

const char *CTeamplayRules::TeamWithFewestPlayers( void )
{
	int i;
	int minPlayers = MAX_TEAMS;
	int teamCount[ MAX_TEAMS ];
	char *pTeamName = NULL;

	memset( teamCount, 0, MAX_TEAMS * sizeof(int) );
	
	// loop through all clients, count number of players on each team
	for ( i = 1; i <= gpGlobals->maxClients; i++ )
	{
		CBaseEntity *plr = UTIL_PlayerByIndex( i );

		if ( plr )
		{
			int team = GetTeamIndex( plr->TeamID() );
			if ( team >= 0 )
				teamCount[team] ++;
		}
	}

	// Find team with least players
	for ( i = 0; i < num_teams; i++ )
	{
		if ( teamCount[i] < minPlayers )
		{
			minPlayers = teamCount[i];
			pTeamName = team_names[i];
		}
	}

	return pTeamName;
}


//=========================================================
//=========================================================
void CTeamplayRules::RecountTeams( void )
{
	char	*pName;
	char	teamlist[TEAMPLAY_TEAMLISTLENGTH];

	// loop through all teams, recounting everything
	num_teams = 0;

	// Copy all of the teams from the teamlist
	// make a copy because strtok is destructive
	Q_strncpy( teamlist, m_szTeamList, sizeof(teamlist) );
	pName = teamlist;
	pName = strtok( pName, ";" );
	while ( pName != NULL && *pName )
	{
		if ( GetTeamIndex( pName ) < 0 )
		{
			Q_strncpy( team_names[num_teams], pName, sizeof(team_names[num_teams]));
			num_teams++;
		}
		pName = strtok( NULL, ";" );
	}

	if ( num_teams < 2 )
	{
		num_teams = 0;
		m_teamLimit = false;
	}

	// Sanity check
	memset( team_scores, 0, sizeof(team_scores) );

	// loop through all clients
	for ( int i = 1; i <= gpGlobals->maxClients; i++ )
	{
		CBasePlayer *plr = UTIL_PlayerByIndex( i );

		if ( plr )
		{
			const char *pTeamName = plr->TeamID();
			// try add to existing team
			int tm = GetTeamIndex( pTeamName );
			
			if ( tm < 0 ) // no team match found
			{ 
				if ( !m_teamLimit )
				{
					// add to new team
					tm = num_teams;
					num_teams++;
					team_scores[tm] = 0;
					Q_strncpy( team_names[tm], pTeamName, MAX_TEAMNAME_LENGTH );
				}
			}

			if ( tm >= 0 )
			{
				team_scores[tm] += plr->FragCount();
			}
		}
	}
}
