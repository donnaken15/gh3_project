curReviewLighting = 0

script CycleReviewLighting
	Change curReviewLighting = ($curReviewLighting + 1)
	if ($curReviewLighting = 7)
		Change \{ curReviewLighting = 0 }
	endif
	GetPakManCurrentName \{ map = Zones }
	FormatText ChecksumName = lightPrefix '%p_GFX_L' p = <pakname>
	CallScriptOnNode prefix = <lightPrefix> callBack_Script = CB_CycleReviewLighting Params = {}
endscript

script CB_CycleReviewLighting
	GetLightColor name = <nodeName>
	big = <r>
	if (<big> < <g>)
		big = <g>
	endif
	if (<big> < <b>)
		big = <b>
	endif
	switch $curReviewLighting
		case 0
			SetLightColor name = <nodeName> r = <big> g = <big> b = <big>
		case 1
			SetLightColor name = <nodeName> r = <big> g = (<big> / 6.0)b = (<big> / 6.0)
		case 2
			SetLightColor name = <nodeName> r = (<big> / 6.0)g = <big> b = (<big> / 6.0)
		case 3
			SetLightColor name = <nodeName> r = (<big> / 6.0)g = (<big> / 6.0)b = <big>
		case 4
			SetLightColor name = <nodeName> r = (<big> / 6.0)g = <big> b = <big>
		case 5
			SetLightColor name = <nodeName> r = <big> g = (<big> / 6.0)b = <big>
		case 6
			SetLightColor name = <nodeName> r = <big> g = <big> b = (<big> / 6.0)
	endswitch
endscript

script SafeCreate
	if IsInNodeArray <nodeName>
		if NOT IsCreated <nodeName>
			Create name = <nodeName>
		endif
	endif
endscript

script SafeKill
	if IsCreated <nodeName>
		Kill name = <nodeName>
	endif
endscript

script ScreenFlash \{ Time = 1 }
	killspawnedscript \{ Id = ScreenFlash }
	SpawnScriptLater ScreenFlashOn Id = ScreenFlash Params = { Time = <Time> }
endscript

script ScreenFlashOn
	if NOT ScreenFX_FXInstanceExists \{ viewport = bg_viewport name = FlashBS }
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			name = FlashBS
			($ScreenFlash_TOD_Manager.screen_FX [ 0 ])
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			name = FlashBS
			($ScreenFlash_TOD_Manager.screen_FX [ 0 ])
		}
	endif
	wait (0.1 * <Time>)seconds
	if ScreenFX_FXInstanceExists \{ viewport = bg_viewport name = FlashBS }
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			name = FlashBS
			Time = <Time>
			($ScreenFlash_TOD_Manager.screen_FX [ 0 ])
			Contrast = 1
			Brightness = 1
		}
	endif
	wait <Time> seconds
	SpawnScriptLater \{ ScreenFlashOff Id = ScreenFlash }
endscript

script ScreenFlashOff
	if ViewportExists \{ Id = bg_viewport }
		if ScreenFX_FXInstanceExists \{ viewport = bg_viewport name = FlashBS }
			ScreenFX_RemoveFXInstance \{ viewport = bg_viewport name = FlashBS }
		endif
	endif
endscript

script ScreenToBlack \{ Time = 0.4 viewport = UI }
	killspawnedscript \{ Id = ScreenToBlack }
	SpawnScriptLater Call_ScreenToBlack Id = ScreenToBlack Params = { <...>	 }
endscript

script Call_ScreenToBlack
	Time = (0.5 * <Time>)
	SpawnScriptLater Do_ScreenToBlack Id = ScreenToBlack Params = {ON Time = <Time> <...> }
	wait <Time> seconds
	SpawnScriptLater Do_ScreenToBlack Id = ScreenToBlack Params = {OFF Time = <Time> <...> }
endscript

script Do_ScreenToBlack
	if NOT (<viewport> = 0)
		if NOT ViewportExists Id = <viewport>
			return
		endif
	endif
	if GotParam \{ ON }
		if NOT ScreenFX_FXInstanceExists viewport = <viewport> name = blackFX
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				name = blackFX
				($ScreenToBlack_TOD_Manager.screen_FX [ 0 ])
			}
		endif
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			name = blackFX
			Time = <Time>
			($ScreenToBlack_TOD_Manager.screen_FX [ 0 ])
			Inner_Radius = 0
			Outer_Radius = 0
			Alpha = 1
		}
	else
		if ScreenFX_FXInstanceExists viewport = <viewport> name = blackFX
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				name = blackFX
				Time = <Time>
				($ScreenToBlack_TOD_Manager.screen_FX [ 0 ])
				Inner_Radius = 1
				Outer_Radius = 1.5
				Alpha = 0
			}
			if GotParam \{ OFF }
				wait <Time> seconds
				ScreenFX_RemoveFXInstance viewport = <viewport> name = blackFX
			endif
		endif
	endif
endscript
