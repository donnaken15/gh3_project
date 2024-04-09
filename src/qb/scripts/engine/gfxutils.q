ISOLATE_2D_RENDER = 0
pix_output = 0

script HiResScreenshot \{ Scale = 1 }
	if CutsceneFinished \{ name = cutscene }
		PauseGame
		GetCurrentCameraObject
	else
		PlayIGCCam \{ name = hires_cutscene_hack interrupt_current Play_hold }
		wait \{ 1 gameframes }
		GetSkaterCamAnimParams \{ name = hires_cutscene_hack }
		<cameraid> = <cam_object_id>
	endif
	<cameraid> = <camid>
	PrintStruct <...>
	<i> = 0
	wait \{ 30 frames IgnoreSlomo }
	Printf \{ "11111111111111111111111111111111111111" }
	begin
		<j> = 0
		begin
			Printf \{ "222222222222222222222222222222222" }
			FormatText textname = text 'hi_res_screen_%a_%b_' a = <i> b = <j>
			sub = ((<i> * <Scale>)+ <j>)
			<cameraid> ::SetSubFrustum res = <Scale> subImage = <sub>
			wait \{ 16 Frame IgnoreSlomo }
			ScreenShot FileName = <text>
			wait \{ 16 frames IgnoreSlomo }
			<j> = (<j> + 1)
		repeat <Scale>
		<i> = (<i> + 1)
	repeat <Scale>
	<cameraid> ::SetSubFrustum res = 1 subImage = 0
	root_window ::DoMorph \{ Alpha = 1 }
	if GotParam \{ Do2D }
		if IsXenon
			Change \{ ISOLATE_2D_RENDER = 1 }
			wait \{ 3 frames }
			<i> = 0
			begin
				<j> = 0
				begin
					FormatText textname = text 'hi_res_screen_2d_%a_%b_' a = <i> b = <j>
					sub = ((<i> * <Scale>)+ <j>)
					<cameraid> ::SetSubFrustum res = <Scale> subImage = <sub>
					wait \{ 16 frames }
					ScreenShot FileName = <text>
					wait \{ 16 frames }
					<j> = (<j> + 1)
				repeat <Scale>
				<i> = (<i> + 1)
			repeat <Scale>
			<cameraid> ::SetSubFrustum res = 1 subImage = 0
			Change \{ ISOLATE_2D_RENDER = 0 }
		endif
	endif
	if CutsceneFinished \{ name = cutscene }
		UnPauseGame
	else
		KillSkaterCamAnim \{ name = hires_cutscene_hack }
	endif
endscript

script SpawnHiResScreenshot
	SpawnScriptLater HiResScreenshot Params = <...>
endscript

script CubeMapScreenshots
	Change \{ Show_Zone_budget_Warnings = 0 }
	Change \{ no_render_metrics = 1 }
	root_window ::DoMorph \{ Alpha = 0 }
	if CompositeObjectExists \{ Skater }
		Skater ::Hide
	endif
	SetScreen \{ Aspect = 1.0 }
	lock_cam_cube_dir \{ Dir = (1.0, 0.0, 0.0) }
	wait \{ 16 gameframes }
	ScreenShot \{ FileName = 'cubemap_screen_A' }
	wait \{ 16 gameframes }
	lock_cam_cube_dir \{ Dir = (-1.0, 0.0, 0.0) }
	wait \{ 16 gameframes }
	ScreenShot \{ FileName = 'cubemap_screen_B' }
	wait \{ 16 gameframes }
	lock_cam_cube_dir \{ Dir = (0.0, 1.0, 0.0) }
	wait \{ 16 gameframes }
	ScreenShot \{ FileName = 'cubemap_screen_C' }
	wait \{ 16 gameframes }
	lock_cam_cube_dir \{ Dir = (0.0, -1.0, 0.0) }
	wait \{ 16 gameframes }
	ScreenShot \{ FileName = 'cubemap_screen_D' }
	wait \{ 16 gameframes }
	lock_cam_cube_dir \{ Dir = (0.0, 0.0, 1.0) }
	wait \{ 16 gameframes }
	ScreenShot \{ FileName = 'cubemap_screen_F' }
	wait \{ 16 gameframes }
	lock_cam_cube_dir \{ Dir = (0.0, 0.0, -1.0) }
	wait \{ 16 gameframes }
	ScreenShot \{ FileName = 'cubemap_screen_E' }
	wait \{ 16 gameframes }
	SetScreen \{ Aspect = 1.33333 }
	root_window ::DoMorph \{ Alpha = 1 }
	Skater ::Unhide
	KillSkaterCamAnim \{ All }
	Change \{ Show_Zone_budget_Warnings = 1 }
	Change \{ no_render_metrics = 0 }
endscript

script SpawnCubeMapScreenshots
	SpawnScriptLater CubeMapScreenshots Params = <...>
endscript

script lock_cam_top_down
	KillSkaterCamAnim \{ All }
	GetCurrentCameraObject
	<camid> ::Obj_GetPosition
	<camid> ::GetHFOV
	PlayIGCCam {
		Facing = (0.0, -1.0, 0.0)
		Pos = <Pos>
		FOV = <hFOV>
		Play_hold
	}
endscript

script lock_cam_cube_dir \{ Dir = (1.0, 0.0, 0.0) }
	KillSkaterCamAnim \{ All }
	GetCurrentCameraObject
	<camid> ::Obj_GetPosition
	<camid> ::GetHFOV
	PlayIGCCam {
		Facing = <Dir>
		Pos = <Pos>
		FOV = 90.0
		Play_hold
	}
endscript
