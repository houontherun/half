//========= Copyright � 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: 
//
// $NoKeywords: $
//=============================================================================

#ifndef KEYVALUES_H
#define KEYVALUES_H
#ifdef _WIN32
#pragma once
#endif

#ifndef NULL
#ifdef __cplusplus
#define NULL    0
#else
#define NULL    ((void *)0)
#endif
#endif

typedef struct _iobuf FILE;

//-----------------------------------------------------------------------------
// Purpose: Simple recursive data access class
//			Destructor deletes all child KeyValues nodes
//-----------------------------------------------------------------------------
class KeyValues
{
public:
	KeyValues( const char *SetName );

	// quick setup constructors
	KeyValues( const char *SetName, const char *firstKey, const char *firstValue );
	KeyValues( const char *SetName, const char *firstKey, int firstValue );
	KeyValues( const char *SetName, const char *firstKey, const char *firstValue, const char *secondKey, const char *secondValue );
	KeyValues( const char *SetName, const char *firstKey, int firstValue, const char *secondKey, int secondValue );

	~KeyValues();

	// section name
	const char *GetName( void );

	// file access
	bool LoadFromFile( const char *resourceName );
	bool SaveToFile( const char *resourceName );

	// returns a node
	// set bCreate to true to create the key if it doesn't already exist (which ensures a valid pointer will be returned)
	KeyValues *FindKey(const char *keyName, bool bCreate = false);
	KeyValues *CreateNewKey();		// creates a new key, with an autogenerated name.  name is guaranteed to be an integer, of value 1 higher than the highest other integer key name
	void RemoveSubKey(KeyValues *subKey);	// removes a subkey from the list, DOES NOT DELETE IT

	// key iteration
	KeyValues *GetFirstSubKey();	// returns the first subkey in the list
	KeyValues *GetNextKey();		// returns the next subkey

	// data access
	int GetInt( const char *keyName = NULL, int defaultValue = 0 );
	float GetFloat( const char *keyName = NULL, float defaultValue = 0.0f );
	const char *GetString( const char *keyName = NULL, const char *defaultValue = "" );
	void *GetPtr( const char *keyName = NULL, void *defaultValue = (void*)0 );
	bool IsEmpty(const char *keyName = NULL);

	// key writing
	void SetString( const char *keyName, const char *value );
	void SetInt( const char *keyName, int value );
	void SetFloat( const char *keyName, float value );
	void SetPtr( const char *keyName, void *value );

	// memory allocation (optimized)
	void *operator new( unsigned int iAllocSize );
	void operator delete( void *pMem );

	// allocates & creates a new copy of the keys
	KeyValues *MakeCopy( void );

	// clears out all subkeys, and the current value
	void Clear( void );

	// data type
	enum types_t
	{
		TYPE_NONE,
		TYPE_STRING,
		TYPE_INT,
		TYPE_FLOAT,
		TYPE_PTR,
	};
	types_t GetDataType(const char *keyName = NULL);

private:
	KeyValues( KeyValues& );	// prevent copy constructor being used

	void RecursiveLoadFromFile( FILE *f );
	void RecursiveSaveToFile( FILE *f, int indentLevel );

	void Init( const char *SetName );

	enum { KEYNAME_LENGTH = 32 };

	char m_sKeyName[KEYNAME_LENGTH];
	char *m_sValue;
	
	union
	{
		int m_iValue;
		float m_flValue;
		void *m_pValue;
	};
	
	types_t m_iDataType; 

	KeyValues *m_pPeer;	// pointer to next key in list
	KeyValues *m_pSub;	// pointer to Start of a new sub key list
};



#endif // KEYVALUES_H
