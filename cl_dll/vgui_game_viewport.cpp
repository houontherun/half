#include "cbase.h"
#include "clientmode.h"

//================================================================
// Global startup and shutdown functions for game code in the DLL.
//================================================================

class CViewportClientSystem : public IGameSystem
{
	// Init, shutdown
	bool Init()
	{
		g_pClientMode->Layout();
		return true;
	}

	void Shutdown() {}
	void LevelInitPreEntity() {}
	void LevelInitPostEntity() {}
	void LevelShutdownPreEntity() {}
	void LevelShutdownPostEntity() {}
	void PreRender() {}
	void Update( float frametime ) {}

	virtual void OnSave() {}
	virtual void OnRestore() {}
};



static CViewportClientSystem g_ViewportClientSystem;

IGameSystem *ViewportClientSystem()
{
	return &g_ViewportClientSystem;
}
