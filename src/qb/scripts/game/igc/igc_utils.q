igc_custom_camera_name = custom_igc_cam

script PlayIGCCamScene
	hide_all_hud_sprites
	PlayIGCCam {
		name = $igc_custom_camera_name
		<...>
		exitScript = show_all_hud_sprites
		allow_pause = 1
	}
endscript

script PlayIGCCamSceneWithHUD
	PlayIGCCam {
		<...>
		allow_pause = 1
	}
endscript

script freeze_skater_for_cinematic
	Skater ::SwitchOffAtomic \{ Board }
	Skater ::PausePhysics
	Skater ::Pause
	Skater ::DisablePlayerInput
	Skater ::SkaterLoopingSound_TurnOff
endscript

script unfreeze_skater_after_cinematic
	Skater ::UnPausePhysics
	Skater ::EnablePlayerInput
	Skater ::UnPause
	Skater ::Input_Debounce \{ X }
	if NOT Skater ::Walking
		Skater ::SkaterLoopingSound_TurnOn
	endif
endscript

script fadetoblack \{Time = 0.5 Alpha = 0.5 z_priority = 9000 rgba = [ 0 0 0 255 ] Scale = (600.0, 400.0) texture = black Id = screenfader Pos = (320.0, 240.0) PARENT = root_window}
	if GotParam \{ ON }
		if NOT ScreenElementExists Id = <Id>
			SetScreenElementLock OFF Id = <PARENT>
			if NOT GotParam \{ create_script }
				CreateScreenElement {
					Type = SpriteElement
					PARENT = <PARENT>
					Id = <Id>
					texture = <texture>
					Pos = <Pos>
					rgba = <rgba>
					just = [ center center ]
					Scale = <Scale>
					Alpha = 0
					z_priority = <z_priority>
					no_zwrite
				}
			else
				<create_script>
			endif
		else
			TerminateObjectsScripts Id = <Id>
			<Id> ::RemoveTags [ waiting_to_die ]
		endif
		DoScreenElementMorph Id = <Id> Time = <Time> Alpha = <Alpha>
	endif
	if GotParam \{ OFF }
		if ScreenElementExists Id = <Id>
			DoScreenElementMorph Id = <Id> Time = <Time> Alpha = 0
			if GotParam \{ no_wait }
				RunScriptOnScreenElement Id = <Id> fadetoblack_wait_and_die Params = { Time = <Time> }
			else
				<Id> ::SetTags waiting_to_die
				if (<Time> > 0.0)
					Printf \{ "waiting" }
					wait <Time> seconds
				endif
				if ScreenElementExists Id = <Id>
					if <Id> ::GetSingleTag waiting_to_die
						DestroyScreenElement Id = <Id>
					endif
				endif
			endif
		endif
	endif
endscript

script fadetoblack_wait_and_die
	if GotParam \{ Time }
		wait <Time> seconds
	endif
	DIE
endscript

script igc_fadeout \{ Time = 0.75 }
	fadetoblack ON Alpha = 1.0 Time = <Time>
	wait (<Time> + 0.1)seconds
endscript

script igc_fadeout_fast
	fadetoblack \{ ON Alpha = 1.0 Time = 0.0 }
endscript

script igc_fadein_fast
	fadetoblack \{ OFF Time = 0.0 }
endscript

script igc_fadein \{ Time = 0.75 }
	fadetoblack OFF Time = <Time> no_wait
endscript
