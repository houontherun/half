//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#ifndef CHOREOEVENT_H
#define CHOREOEVENT_H
#ifdef _WIN32
#pragma once
#endif

class CChoreoActor;
class CChoreoChannel;
class CChoreoEvent;
class CChoreoScene;
class IChoreoEventCallback; 
class CAudioMixer;

#include "utlvector.h"
#include "expressionsample.h"
#include "networkvar.h"

//-----------------------------------------------------------------------------
// Purpose: SPEAK events can have "relative tags" that other objects can reference
//  to specify their start times off of
//-----------------------------------------------------------------------------
class CEventRelativeTag
{
public:
	DECLARE_CLASS_NOBASE( CEventRelativeTag );
	
	enum
	{
		MAX_EVENTTAG_LENGTH = 128,
	};

					CEventRelativeTag( CChoreoEvent *owner, const char *name, float percentage );
					CEventRelativeTag( const CEventRelativeTag& src );
	
	const char		*GetName( void );
	float			GetPercentage( void );
	void			SetPercentage( float percentage );

	// Returns the corrected time based on the owner's length and start time
	float			GetStartTime( void );
	CChoreoEvent	*GetOwner( void );
	void			SetOwner( CChoreoEvent *event );

protected:

	char			m_szName[ MAX_EVENTTAG_LENGTH ];
	float			m_flPercentage;
	CChoreoEvent	*m_pOwner;
};

//-----------------------------------------------------------------------------
// Purpose: GESTURE events can have "absolute tags" (where the value is not a 
//  percentage, but an actual timestamp from the start of the event)
//-----------------------------------------------------------------------------
class CEventAbsoluteTag
{
public:
	enum
	{
		MAX_EVENTTAG_LENGTH = 128,
	};

					CEventAbsoluteTag( CChoreoEvent *owner, const char *name, float t );
					CEventAbsoluteTag( const CEventAbsoluteTag& src );
	
	const char		*GetName( void );
	float			GetTime( void );
	void			SetTime( float t );

	CChoreoEvent	*GetOwner( void );
	void			SetOwner( CChoreoEvent *event );

protected:

	char			m_szName[ MAX_EVENTTAG_LENGTH ];
	float			m_flTagTime;
	CChoreoEvent	*m_pOwner;
};

//-----------------------------------------------------------------------------
// Purpose: FLEXANIMATION events can have "timing tags" that are used to align and
//  manipulate flex animation curves
//-----------------------------------------------------------------------------
class CFlexTimingTag : public CEventRelativeTag
{
	DECLARE_CLASS( CFlexTimingTag, CEventRelativeTag );

public:
					CFlexTimingTag( CChoreoEvent *owner, const char *name, float percentage, bool locked );
					CFlexTimingTag( const CFlexTimingTag& src );
	
	bool			GetLocked( void );
	void			SetLocked( bool locked );

protected:
	bool			m_bLocked;
};

//-----------------------------------------------------------------------------
// Purpose: A flex controller position can be animated over a period of time
//-----------------------------------------------------------------------------
class CFlexAnimationTrack
{
public:
	enum
	{
		MAX_CONTROLLER_NAME = 128,
	};

						CFlexAnimationTrack( CChoreoEvent *event );
						CFlexAnimationTrack( const CFlexAnimationTrack* src );
	virtual 			~CFlexAnimationTrack( void );

	void				SetEvent( CChoreoEvent *event );
	CChoreoEvent		*GetEvent( void );

	void				SetFlexControllerName( const char *name );
	char const			*GetFlexControllerName( void );

	void				SetComboType( bool combo );
	bool				IsComboType( void );

	void				SetMin( float value );
	void				SetMax( float value );
	float				GetMin( int type = 0 );
	float				GetMax( int type = 0 );

	int					GetNumSamples( int type = 0 );
	CExpressionSample	*GetSample( int index, int type = 0 );

	bool				IsTrackActive( void );
	void				SetTrackActive( bool active );

	// returns scaled value for absolute time per left/right side
	float				GetIntensity( float time, int side = 0 );

	void				AddSample( float time, float value, int type = 0 );
	void				RemoveSample( int index, int type = 0 );
	void				Clear( void );

	void				Resort( int type = 0 );

	// Puts in dummy start/end samples to spline to zero ( or 0.5 for
	//  left/right data) at the origins
	CExpressionSample	*GetBoundedSample( int number, int type = 0 );

	int					GetFlexControllerIndex( int side = 0 );
	int					GetRawFlexControllerIndex( int side = 0 );
	void				SetFlexControllerIndex( int raw, int index, int side = 0 );

	// returns 0..1 value for 0..1 time fraction per mag/balance
	float				GetFracIntensity( float time, int type );

	// retrieves raw intensity values (for mag vs. left/right slider setting)
	float				GetSampleIntensity( float time );
	float				GetBalanceIntensity( float time );

private:
	// remove any samples after endtime
	void				RemoveOutOfRangeSamples( int type );

	// returns scaled value for absolute time per mag/balance
	float				GetIntensityInternal( float time, int type );

	float				GetZeroValue( int type );

	char				*m_pControllerName;

	// Is track active
	bool				m_bActive;

	// Is this a combo (magnitude + stereo) track
	bool				m_bCombo;

	// base track has range, combo is always 0..1
	float				m_flMin;
	float				m_flMax;

	// 0 == magnitude
	// 1 == left/right
	CUtlVector< CExpressionSample > m_Samples[ 2 ];
	int					m_nFlexControllerIndex[ 2 ];
	int					m_nFlexControllerIndexRaw[ 2 ];

	CChoreoEvent		*m_pEvent;
};

//-----------------------------------------------------------------------------
// Purpose: The generic scene event type
//-----------------------------------------------------------------------------
class CChoreoEvent
{
public:
	// Type of event this object represents
	typedef enum
	{
		// Don't know yet
		UNSPECIFIED = 0,

		// Section start/end
		SECTION,

		// Play an expression
		EXPRESSION,
		
		// Look at another actor
		LOOKAT,

		// Move to a location
		MOVETO,

		// Speak/visemes a .wav file
		SPEAK,

		// Play a gesture
		GESTURE,

		// Play a sequence
		SEQUENCE,

		// Face another actor
		FACE,

		// Fire a trigger
		FIRETRIGGER,

		// One or more flex sliders animated over the course of the event time period
		FLEXANIMATION,

		// A contained .vcd file
		SUBSCENE,

		// Loop back to previous time (forever or up to N times)
		LOOP,

		// A time span during which the scene may be temporarily interrupted
		INTERRUPT,

		// A dummy event that is used to mark the .vcd end time
		STOPPOINT,
	} EVENTTYPE;

	enum
	{
		MAX_TAGNAME_STRING		= 128,
	};

	// Construction
	CChoreoEvent( CChoreoScene *scene );
	CChoreoEvent( CChoreoScene *scene, EVENTTYPE type, const char *name );
	CChoreoEvent( CChoreoScene *scene, EVENTTYPE type, const char *name, const char *param );

	// Assignment
	CChoreoEvent&	operator=(const CChoreoEvent& src );

	~CChoreoEvent( void );

	// Accessors
	EVENTTYPE		GetType( void );
	void			SetType( EVENTTYPE type );

	void			SetName( const char *name );
	const char		*GetName( void );

	void			SetParameters( const char *target );
	const char		*GetParameters( void );
	void			SetParameters2( const char *target );
	const char		*GetParameters2( void );

	void			SetStartTime( float starttime );
	float			GetStartTime( void );

	void			SetEndTime( float endtime );
	float			GetEndTime( void );

	float			GetDuration( void );

	void			SetResumeCondition( bool resumecondition );
	bool			IsResumeCondition( void );

	int				GetRampCount( void );
	CExpressionSample *GetRamp( int index );
	void			AddRamp( float time, float value, bool selected );
	void			DeleteRamp( int index );
	void			ClearRamp( void );
	void			ResortRamp( void );
	// remove any samples after endtime
	void			RemoveOutOfRangeRampSamples( void );

	// Puts in dummy start/end samples to spline to zero ( or 0.5 for
	//  left/right data) at the origins
	CExpressionSample	*GetBoundedRamp( int number );
	float			GetRampIntensity( float time );

	// Calculates weighting for a given time
	float			GetIntensity( float time );

	// Calculates 0..1 completion for a given time
	float			GetCompletion( float time );

	// An end time of -1.0f means that the events is just triggered at the leading edge
	bool			HasEndTime( void );

	// Is the event something that can be sized ( a .wav file, e.g. )
	bool			IsFixedLength( void );
	void			SetFixedLength( bool isfixedlength );

	// Move the start/end/both times by the specified dt (fixes up -1.0f endtimes)
	void			OffsetStartTime( float dt );
	void			OffsetEndTime( float dt );
	void			OffsetTime( float dt );

	// Snap to scene framerate
	void			SnapTimes( void );
	float			SnapTime( float t );

	CChoreoScene	*GetScene( void );
	void			SetScene( CChoreoScene *scene );

	// The actor the event is associated with
	void			SetActor( CChoreoActor *actor );
	CChoreoActor	*GetActor( void );

	// The channel the event is associated with
	void			SetChannel( CChoreoChannel *channel );
	CChoreoChannel	*GetChannel( void );

	// Get a more involved description of the event
	const char		*GetDescription( void );

	void			ClearAllRelativeTags( void );
	int				GetNumRelativeTags( void );
	CEventRelativeTag *GetRelativeTag( int tagnum );
	CEventRelativeTag *FindRelativeTag( const char *tagname );
	void			AddRelativeTag( const char *tagname, float percentage );
	void			RemoveRelativeTag( const char *tagname );
	
	bool			IsUsingRelativeTag( void );
	void			SetUsingRelativeTag( bool usetag, const char *tagname = 0, const char *wavname = 0);
	const char		*GetRelativeTagName( void );
	const char		*GetRelativeWavName( void );

	// Absolute tags
	typedef enum
	{
		PLAYBACK = 0,
		SHIFTED,
		
		NUM_ABS_TAG_TYPES,
	} AbsTagType;

	void			SetGestureSequenceDuration( float duration );
	bool			GetGestureSequenceDuration( float& duration );

	void			ClearAllAbsoluteTags( AbsTagType type );
	int				GetNumAbsoluteTags( AbsTagType type );
	CEventAbsoluteTag *GetAbsoluteTag( AbsTagType type, int tagnum );
	CEventAbsoluteTag *FindAbsoluteTag( AbsTagType type, const char *tagname );
	void			AddAbsoluteTag( AbsTagType type, const char *tagname, float t );
	void			RemoveAbsoluteTag( AbsTagType type, const char *tagname );
	float			GetShiftedTimeFromReferenceTime( float t );
	float			GetReferenceTimeFromShiftedTime( float t );

	static const char *NameForAbsoluteTagType( AbsTagType t );
	static AbsTagType	TypeForAbsoluteTagName( const char *name );

	// Flex animation type
	int				GetNumFlexAnimationTracks( void );
	CFlexAnimationTrack		*GetFlexAnimationTrack( int index );
	CFlexAnimationTrack		*AddTrack( const char *controllername );
	CFlexAnimationTrack		*FindTrack( const char *controllername );
	void			RemoveTrack( int index );
	void			RemoveAllTracks( void );
	void			OnEndTimeChanged( void );

	bool			GetTrackLookupSet( void );
	void			SetTrackLookupSet( bool set );

	// Flex Timing Tags (used by editor only)
	void			ClearAllTimingTags( void );
	int				GetNumTimingTags( void );
	CFlexTimingTag	*GetTimingTag( int tagnum );
	CFlexTimingTag	*FindTimingTag( const char *tagname );
	void			AddTimingTag( const char *tagname, float percentage, bool locked );
	void			RemoveTimingTag( const char *tagname );

	// Subscene ( embedded .vcd ) support
	void			SetSubScene( CChoreoScene *scene );
	CChoreoScene	*GetSubScene( void );

	bool			IsProcessing( void ) const;
	void			StartProcessing( IChoreoEventCallback *cb, CChoreoScene *scene, float t );
	void			ContinueProcessing( IChoreoEventCallback *cb, CChoreoScene *scene, float t );
	void			StopProcessing( IChoreoEventCallback *cb, CChoreoScene *scene, float t );
	bool			CheckProcessing( IChoreoEventCallback *cb, CChoreoScene *scene, float t );
	void			ResetProcessing( void );

	void			SetMixer( CAudioMixer *mixer );
	CAudioMixer		*GetMixer( void ) const;

	// Hack for LOOKAT in editor
	int				GetPitch( void ) const;
	void			SetPitch( int pitch );
	int				GetYaw( void ) const;
	void			SetYaw( int yaw );

	// For LOOP events
	void			SetLoopCount( int numloops );
	int				GetLoopCount( void );
	int				GetNumLoopsRemaining( void );
	void			SetNumLoopsRemaining( int loops );

	// Turn enum into string and vice versa
	static EVENTTYPE TypeForName( const char *name );
	static const char *NameForType( EVENTTYPE type );

private:

	float			GetBoundedAbsoluteTagTime( AbsTagType type, int tagnum );

	float			_GetIntensity( float time );

	// String bounds
	enum
	{
		MAX_CHOREOEVENT_NAME	= 128,
		MAX_PARAMETERS_STRING	= 128,
	};

	// Base initialization
	void			Init( CChoreoScene *scene );

	// Type of event
	EVENTTYPE		m_fType;

	// Name of event
	char			m_szName[ MAX_CHOREOEVENT_NAME ];

	// Event parameters
	char			m_szParameters[ MAX_PARAMETERS_STRING ];
	char			m_szParameters2[ MAX_PARAMETERS_STRING ];

	// Event start time
	float			m_flStartTime;

	// Event end time ( -1.0f means no ending, just leading edge triggered )
	float			m_flEndTime;

	// Duration of underlying gesture sequence
	float			m_flGestureSequenceDuration;

	// For CChoreoEvent::LOOP
	int				m_nNumLoops; // -1 == no limit
	int				m_nLoopsRemaining;

	bool			m_bFixedLength;

	// Event ramp
	CUtlVector< CExpressionSample > m_Ramp;

	// True if this event must be "finished" before the next section can be started
	//  after playback is paused from a globalevent
	bool			m_bResumeCondition;

	// Start time is computed based on length of item referenced by tagged name
	bool			m_bUsesTag;
	char			m_szTagName[ MAX_TAGNAME_STRING ];
	char			m_szTagWavName[ MAX_TAGNAME_STRING ];

	// Associated actor
	CChoreoActor	*m_pActor;
	// Associated channel
	CChoreoChannel	*m_pChannel;

	CUtlVector < CEventRelativeTag > m_RelativeTags;
	CUtlVector < CFlexTimingTag > m_TimingTags;
	CUtlVector < CEventAbsoluteTag > m_AbsoluteTags[ NUM_ABS_TAG_TYPES ];

	CUtlVector < CFlexAnimationTrack * > m_FlexAnimationTracks;

	bool			m_bTrackLookupSet;

	CChoreoScene	*m_pSubScene;
	bool			m_bProcessing;
	CAudioMixer		*m_pMixer;

	// Scene which owns this event
	CChoreoScene	*m_pScene;

	int				m_nPitch;
	int				m_nYaw;
};

#endif // CHOREOEVENT_H
