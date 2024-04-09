debug_igc_camera = 0
igc_camera_show_frame_info = 0
cinematic_camera_default_lerp_params = {
	Type = All
	ON = 1
	slow_lerp_factor = 0.6
	fast_lerp_factor = 0.0
	lerp_dropoff = 16.0
}
cinematic_camera_default_handcam_params = {
	motionX = {
		amplitude = 0.034
		center = 0.0
		periodBase = 0.013
		periodMultiples = [ 1 3 4 ]
	}
	motionY = {
		amplitude = 0.04
		center = 0.0
		periodBase = 0.017
		periodMultiples = [ 1 3 4 ]
	}
	amplitudePosition = {
		amplitude = 0.2
		center = 0.0
		periodBase = 0.0023
		periodMultiples = [ 1 16 ]
	}
	amplitudeRotation = {
		amplitude = -0.3
		center = 0.0
		periodBase = 0.0023
		periodMultiples = [ 1 ]
	}
	zoomStabilityMap = [ (1.2999999523162842, 0.699999988079071) (30.0, 100.0) ]
	driftSlerpMap = [ (0.0, 0.800000011920929) (0.05000000074505806, 1.0) ]
	zoomDriftMap = [ (1.2000000476837158, 0.6000000238418579) (30.0, 100.0) ]
	driftAllowedAmplitude = {
		amplitude = 0.4
		center = 1.0
		periodBase = 0.02
		periodMultiples = [ 1 ]
	}
}

script IGC_RunCameraScript
	CCam_On
	if GotParam \{ ControlScript }
		<ControlScript> <Params>
	else
		CCam_SetSmoothing \{ Type = All ON = 1 fast_lerp_factor = 0.6 }
		<cam_params> = <...>
		RemoveComponent \{ structure_name = cam_params name = Time }
		CCam_DoMorph <cam_params>
		if GotParam \{ frames }
			ScriptAssert \{ "PlayIGCCam frames is deprecated; please use time= in seconds instead" }
		endif
		if GotParam \{ Time }
			wait <Time> seconds
		endif
	endif
	if GotParam \{ Play_hold }
		play_hold_value = <Play_hold>
		if GotParam \{ play_hold_value }
			if NOT (<play_hold_value> = 1)
				RemoveParameter \{ Play_hold }
			endif
		endif
		if GotParam \{ Play_hold }
			begin
				wait \{ 1 gameframes }
			repeat
		endif
	endif
endscript

script igc_camera_update_frame_count
	if NOT ScreenElementExists \{ Id = igc_camera_frame_info }
		SetScreenElementLock \{ Id = root_window OFF }
		CreateScreenElement \{ PARENT = root_window Id = igc_camera_frame_info Type = ContainerElement z_priority = 10000 }
		CreateScreenElement \{Type = TextElement PARENT = igc_camera_frame_info local_id = counter1 Pos = (25.0, 400.0) text = "" font = text_a1 rgba = [ 60 60 100 100 ] just = [ Left center ] Scale = 0.8}
		CreateScreenElement \{Type = TextElement PARENT = igc_camera_frame_info local_id = counter2 Pos = (25.0, 418.0) text = "" font = text_a1 rgba = [ 60 60 100 100 ] just = [ Left center ] Scale = 0.8}
	endif
	FormatText {
		textname = text1
		"Frame %f"
		f = <frames>
	}
	FormatText {
		textname = text2
		"%m:%s:%p"
		m = <minutes>
		s = <seconds>
		p = <pct>
		integer_width = 2
	}
	SetScreenElementProps Id = { igc_camera_frame_info child = counter1 }text = <text1>
	SetScreenElementProps Id = { igc_camera_frame_info child = counter2 }text = <text2>
endscript

script igc_camera_frame_counter_kill
	if ScreenElementExists \{ Id = igc_camera_frame_info }
		DestroyScreenElement \{ Id = igc_camera_frame_info }
	endif
endscript
