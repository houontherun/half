#include "cbase.h"


#include "movie_explosion.h"


#define MOVIEEXPLOSION_ENTITYNAME	"env_movieexplosion"


IMPLEMENT_SERVERCLASS_ST(MovieExplosion, DT_MovieExplosion)
END_SEND_TABLE()

LINK_ENTITY_TO_CLASS(env_movieexplosion, MovieExplosion);


MovieExplosion* MovieExplosion::CreateMovieExplosion(const Vector &pos)
{
	CBaseEntity *pEnt = CreateEntityByName(MOVIEEXPLOSION_ENTITYNAME);
	if(pEnt)
	{
		MovieExplosion *pEffect = dynamic_cast<MovieExplosion*>(pEnt);
		if(pEffect && pEffect->pev)
		{
			pEffect->SetLocalOrigin( pos );
			pEffect->Activate();
			return pEffect;
		}
		else
		{
			UTIL_Remove(pEnt);
		}
	}

	return NULL;
}


