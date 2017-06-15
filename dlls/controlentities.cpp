//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: contains entities who have no physical representation in the game, and who
//		must be triggered by other entities to cause their effects.
//
// $NoKeywords: $
//=============================================================================

#include "cbase.h"
#include "player.h"
#include "vstdlib/strtools.h"

//-----------------------------------------------------------------------------
// Purpose: when fired, it changes which track the CD is playing
//-----------------------------------------------------------------------------
class CTargetCDAudioRep : public CPointEntity
{
public:
	DECLARE_CLASS( CTargetCDAudioRep, CPointEntity );

	void InputChangeCDTrack( inputdata_t &inputdata );
	
	DECLARE_DATADESC();

private:
	int m_iTrack;  // CD track to change to when fired
};

LINK_ENTITY_TO_CLASS( target_cdaudio, CTargetCDAudioRep );

BEGIN_DATADESC( CTargetCDAudioRep )

	DEFINE_KEYFIELD( CTargetCDAudioRep, m_iTrack, FIELD_INTEGER, "track" ),
	DEFINE_INPUTFUNC( CTargetCDAudioRep, FIELD_VOID, "ChangeCDTrack", InputChangeCDTrack ),

END_DATADESC()



//-----------------------------------------------------------------------------
// Purpose: Changes the current playing CD track
//-----------------------------------------------------------------------------
void CTargetCDAudioRep::InputChangeCDTrack( inputdata_t &inputdata )
{
	edict_t *pClient;
	int iTrack = m_iTrack;
	
	// manually find the single player. 
	pClient = engine->PEntityOfEntIndex( 1 );
	
	// Can't play if the client is not connected!
	if ( !pClient )
		return;

	if ( iTrack < -1 || iTrack > 30 )
	{
		Warning( "TargetCDAudio - Track %d out of range\n" );
		return;
	}

	if ( iTrack == -1 )
	{
		engine->ClientCommand( pClient, "cd pause\n");
	}
	else
	{
		char string [ 64 ];

		Q_snprintf( string,sizeof(string), "cd play %3d\n", iTrack );
		engine->ClientCommand ( pClient, string);
	}
}

//-----------------------------------------------------------------------------
// Purpose: changes the gravity of the player who activates this entity
//-----------------------------------------------------------------------------
class CTargetChangeGravity : public CPointEntity
{
public:
	DECLARE_CLASS( CTargetChangeGravity, CPointEntity );

	DECLARE_DATADESC();

	void InputChangeGrav( inputdata_t &inputdata );
	void InputResetGrav( inputdata_t &inputdata );

	int m_iGravity;

	int m_iOldGrav;
};

LINK_ENTITY_TO_CLASS( target_changegravity, CTargetChangeGravity );

BEGIN_DATADESC( CTargetChangeGravity )

	DEFINE_KEYFIELD( CTargetChangeGravity, m_iGravity, FIELD_INTEGER, "gravity" ),
	DEFINE_FIELD( CTargetChangeGravity, m_iOldGrav, FIELD_INTEGER ),
	DEFINE_INPUTFUNC( CTargetChangeGravity, FIELD_VOID, "ChangeGrav", InputChangeGrav ),
	DEFINE_INPUTFUNC( CTargetChangeGravity, FIELD_VOID, "ResetGrav", InputResetGrav ),

END_DATADESC()



//-----------------------------------------------------------------------------
// Purpose: Input handler for changing the activator's gravity.
//-----------------------------------------------------------------------------
void CTargetChangeGravity::InputChangeGrav( inputdata_t &inputdata )
{
	CBasePlayer *pl = ToBasePlayer( inputdata.pActivator );
	if ( !pl )
		return;

	// Save the gravity to restore it in InputResetGrav
	if ( m_iOldGrav )
		m_iOldGrav = pl->GetGravity();

	pl->SetGravity(m_iGravity);
}


//-----------------------------------------------------------------------------
// Purpose: Input handler for resetting the activator's gravity.
//-----------------------------------------------------------------------------
void CTargetChangeGravity::InputResetGrav( inputdata_t &inputdata )
{
	CBasePlayer *pl = ToBasePlayer( inputdata.pActivator );
	if ( !pl )
		return;

	pl->SetGravity(m_iOldGrav);
}


