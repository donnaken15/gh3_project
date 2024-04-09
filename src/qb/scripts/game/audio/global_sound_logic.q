
script stars
	Printf \{ channel = SFX "*******************************************************" }
	Printf \{ channel = SFX "*******************************************************" }
	Printf \{ channel = SFX "*******************************************************" }
	Printf \{ channel = SFX "*******************************************************" }
	Printf \{ channel = SFX "*******************************************************" }
endscript
InteriorPanningRadius = 10
Global_User_SFX_Number = 10
Guitar_Always_Volume_100 = 0
Star_power_verb_is_on = 0
sfx_adjusted_guitar_volume = 100
highpass_cutoff_freq_modulated = 2000
lowpass_cutoff_freq_modulated = 1000
phaser_delay_time_modulated = 10
auto_wah_is_on = 0
wah_cutoff_freq_modulated = 900
current_audio_effect_type = HighPass
guitar_audio_effects_are_on = 0
guitar_audio_effects_are_on_p1 = 0
guitar_audio_effects_are_on_p2 = 0
Debug_Audible_Downbeat = 0
Debug_Audible_Open = 0
Debug_Audible_Close = 0
Debug_Audible_HitNote = 0
CrowdListenerStateClapOn1234 = 0
CrowdLevelForSurges = 1.66
temp_language_hack = lang_english
StreamPriorityLow = 10
StreamPriorityLowMid = 30
StreamPriorityMid = 50
StreamPriorityMidHigh = 70
StreamPriorityHigh = 90
StreamPriorityHighest = 95
StreamPrioritySystem = 109
Global_SoundEvent_Default_Priority = 50
Global_SoundEvent_Default_Buss = Default
Global_SoundEvent_NoRepeatFor = 0.1
Global_SoundEvent_InstanceManagement = stop_furthest
Global_SoundEvent_InstanceLimit = 1
GuitarVolumeFullStereoLevel = 100
GuitarVolumePartialStereoLevel = 85
GuitarVolumeRamptimeUp = 0.0
GuitarVolumeRamptimeDown = 0.02
Player1Pan = { panLCR1 = -100 panLCR2 = -100 }
Player2Pan = { panLCR1 = 100 panLCR2 = 100 }

script SoundEvent
	SoundEventFast <...>
endscript

script RegisterSoundEvent
	AddSoundEventScript SoundEvent_EventID = <SoundEvent_EventID>
	OnExitRun DeRegisterSoundEvent Params = { SoundEvent_EventID = <SoundEvent_EventID> }
	<Event> <...>
endscript

script DeRegisterSoundEvent
	RemoveSoundEventScript SoundEvent_EventID = <SoundEvent_EventID>
endscript

script Master_SFX_Adding_Sound_Busses
	CreateBussSystem \{ $BussTree }
	SetSoundBussParams \{ $Default_BussSet }
	SetSoundBussParams \{ $Default_BussSet Time = 0.5 }
	SoundBussLock \{ Master }
	SoundBussLock \{ User_Guitar }
	SoundBussLock \{ User_Band }
	SoundBussLock \{ User_SFX }
	SoundBussLock \{ User_Music }
	SoundBussLock \{ Crowd_Beds }
	SoundBussLock \{ Crowd_Singalong }
	SoundBussLock \{ Band_Balance }
	SoundBussLock \{ Guitar_Balance }
	SoundBussLock \{ Music_Setlist }
	createsoundbusseffects \{Guitar_Balance = { effect = $Echo_Guitar_Buss_Dry effect2 = $Reverb_Guitar_Buss_Dry }}
	createsoundbusseffects \{Crowd_W_Reverb = { effect = $Echo_Crowd_Buss effect2 = $Reverb_Crowd_Buss }}
endscript

script GH3_Change_crowd_reverb_settings_by_Venue
	GetPakManCurrent \{ map = Zones }
	Printf channel = SFX "*************************************changing reverb settings to %s zone" s = <pak>
	switch <pak>
		case Z_Party
			SetSoundBussEffects \{ effect = $Reverb_Crowd_Buss_z_party }
			SetSoundBussEffects \{ effect = $Echo_Crowd_Buss_z_party }
		case Z_Dive
			SetSoundBussEffects \{ effect = $Reverb_Crowd_Buss_z_dive }
			SetSoundBussEffects \{ effect = $Echo_Crowd_Buss_z_dive }
		case Z_Soundcheck
			SetSoundBussEffects \{ effect = $Reverb_Crowd_Buss_z_dive }
			SetSoundBussEffects \{ effect = $Echo_Crowd_Buss_z_dive }
		case Z_Prison
			SetSoundBussEffects \{ effect = $Reverb_Crowd_Buss_z_prison }
			SetSoundBussEffects \{ effect = $Echo_Crowd_Buss_z_prison }
		case Z_ArtDeco
			SetSoundBussEffects \{ effect = $Reverb_Crowd_Buss_z_artdeco }
			SetSoundBussEffects \{ effect = $Echo_Crowd_Buss_z_artdeco }
		case Z_Video
			SetSoundBussEffects \{ effect = $Reverb_Crowd_Buss_z_video }
			SetSoundBussEffects \{ effect = $Echo_Crowd_Buss_z_video }
		case Z_Wikker
			SetSoundBussEffects \{ effect = $Reverb_Crowd_Buss_z_wikker }
			SetSoundBussEffects \{ effect = $Echo_Crowd_Buss_z_wikker }
		case Z_Budokan
			SetSoundBussEffects \{ effect = $Reverb_Crowd_Buss_z_budokan }
			SetSoundBussEffects \{ effect = $Echo_Crowd_Buss_z_budokan }
		case Z_Hell
			SetSoundBussEffects \{ effect = $Reverb_Crowd_Buss_z_hell }
			SetSoundBussEffects \{ effect = $Echo_Crowd_Buss_z_hell }
		default
			SetSoundBussEffects \{ effect = $Reverb_Crowd_Buss }
			SetSoundBussEffects \{ effect = $Echo_Crowd_Buss }
	endswitch
endscript

script PrintPushPopDebugInfo
	if NOT GotParam \{ push }
		if NOT GotParam \{ pop }
			Printf \{ "Did not specify push or pop!" }
			return
		endif
	endif
	if GotParam \{ push }
		pushPop = "push"
	else
		pushPop = "pop"
	endif
	if NOT GotParam \{ name }
		Printf \{ "Did not specify script name!" }
		return
	endif
	Printf "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= %a %b" a = <name> b = <pushPop>
endscript

script Generic_Reverb_Functionality_Script \{ NewEchoSettings = $Echo_Generic_Outside_Slap EchoFadeTime = 0.5 NewReverbSettings = $Reverb_Generic_Outside_Verb ReverbFadeTime = 0.5 }
	if inside
		if GotParam \{ NewEchoSettings }
			if GotParam \{ EchoFadeTime }
				SetSoundBussEffects effect = <NewEchoSettings> Time = <EchoFadeTime>
			else
				SetSoundBussEffects effect = <NewEchoSettings>
			endif
		endif
		if GotParam \{ NewReverbSettings }
			if GotParam \{ ReverbFadeTime }
				SetSoundBussEffects effect = <NewReverbSettings> Time = <ReverbFadeTime>
			else
				SetSoundBussEffects effect = <NewReverbSettings>
			endif
		endif
	else
		if GotParam \{ Destroyed }
		else
			if GotParam \{ Created }
			else
				if GotParam \{ ExitEchoSettings }
					if GotParam \{ ExitEchoFadeTime }
						SetSoundBussEffects effect = <ExitEchoSettings> Time = <ExitEchoFadeTime>
					else
						SetSoundBussEffects effect = <ExitEchoSettings>
					endif
				endif
				if GotParam \{ ExitReverbSettings }
					if GotParam \{ ExitReverbFadeTime }
						SetSoundBussEffects effect = <ExitReverbSettings> Time = <ExitReverbFadeTime>
					else
						SetSoundBussEffects effect = <ExitReverbSettings>
					endif
				endif
			endif
		endif
	endif
endscript

script GH_Guitar_Battle_DSP_Effects_Player1
	switch <attack_effect>
		case double_note_flange
			Printf \{ channel = SFX "setting to doublenote flange" }
			SetSoundBussEffects \{ effect = $Flange_DoubleNotes1 }
			Printf \{ channel = SFX "changing p1 balance buss" }
			SetSoundBussParams \{Guitar_Balance_First_Player = { vol = 2 }}
		case overload_highpass
			Printf \{ channel = SFX "setting to overload highpass" }
			SetSoundBussEffects \{ effect = $HighPass_Thin1 }
			Printf \{ channel = SFX "changing p1 balance buss" }
			SetSoundBussParams \{Guitar_Balance_First_Player = { vol = 3 }}
		case brokenstring_chorus
			Printf \{ channel = SFX "setting to broken string chorus" }
			SetSoundBussEffects \{ effect = $Chorus_Generic1 }
			Printf \{ channel = SFX "changing p1 balance buss" }
			SetSoundBussParams \{Guitar_Balance_First_Player = { vol = 0 }}
		case lefty_eq
			Printf \{ channel = SFX "setting to lefty eq" }
			SetSoundBussEffects \{ effect = $LowPass_Muffled1 }
			Printf \{ channel = SFX "changing p1 balance buss" }
			SetSoundBussParams \{Guitar_Balance_First_Player = { vol = 6 }}
		case diffup_eq
			Printf \{ channel = SFX "setting to diffup eq" }
			SetSoundBussEffects \{ effect = $EQ_Wah1 }
			Printf \{ channel = SFX "changing p1 balance buss" }
			SetSoundBussParams \{Guitar_Balance_First_Player = { vol = -6 }}
		default
			Printf \{ channel = SFX "default" }
	endswitch
endscript

script GH_Guitar_Battle_DSP_Effects_Player2
	switch <attack_effect>
		case double_note_flange
			Printf \{ channel = SFX "setting to doublenote flange" }
			SetSoundBussEffects \{ effect = $Flange_DoubleNotes2 }
			Printf \{ channel = SFX "changing p2 balance buss" }
			SetSoundBussParams \{Guitar_Balance_Second_Player = { vol = 2 }}
		case overload_highpass
			Printf \{ channel = SFX "setting to overload highpass" }
			SetSoundBussEffects \{ effect = $HighPass_Thin2 }
			Printf \{ channel = SFX "changing p2 balance buss" }
			SetSoundBussParams \{Guitar_Balance_Second_Player = { vol = 3 }}
		case brokenstring_chorus
			Printf \{ channel = SFX "setting to broken string chorus" }
			SetSoundBussEffects \{ effect = $Chorus_Generic2 }
			Printf \{ channel = SFX "changing p2 balance buss" }
			SetSoundBussParams \{Guitar_Balance_Second_Player = { vol = 0 }}
		case lefty_eq
			Printf \{ channel = SFX "setting to lefty eq" }
			SetSoundBussEffects \{ effect = $LowPass_Muffled2 }
			Printf \{ channel = SFX "changing p2 balance buss" }
			SetSoundBussParams \{Guitar_Balance_Second_Player = { vol = 6 }}
		case diffup_eq
			Printf \{ channel = SFX "setting to diffup eq" }
			SetSoundBussEffects \{ effect = $EQ_Wah2 }
			Printf \{ channel = SFX "changing p2 balance buss" }
			SetSoundBussParams \{Guitar_Balance_Second_Player = { vol = -6 }}
		default
			Printf \{ channel = SFX "default" }
	endswitch
endscript

script GH3_Change_Guitar_Audio_Effects_Guitar_Single_Player \{ effect_type = Default }
endscript

script GH3_Guitar_Effects_Wait
endscript

script GH3_Battle_Attack_Finished_SFX
	if (<Player> = 1)
		SoundEvent \{ Event = GH_SFX_BattleMode_Attack_Over_P1 }
	else
		SoundEvent \{ Event = GH_SFX_BattleMode_Attack_Over_P2 }
	endif
endscript

script Reset_Battle_DSP_Effects
	if (<Player> = 1)
		Reset_Battle_DSP_Effects_Player1
	else
		Reset_Battle_DSP_Effects_Player2
	endif
endscript

script Reset_Battle_DSP_Effects_Player1
	SetSoundBussEffects \{ effect = $LowPass_Default1 Time = 0.15 }
	SetSoundBussEffects \{ effect = $HighPass_Default1 Time = 0.15 }
	SetSoundBussEffects \{ effect = $Flange_Default1 Time = 0.15 }
	SetSoundBussEffects \{ effect = $Chorus_Default1 Time = 0.15 }
	SetSoundBussEffects \{ effect = $EQ_Default1 Time = 0.15 }
	Printf \{ channel = SFX "RESTTING p1 balance buss" }
	SetSoundBussParams \{Guitar_Balance_First_Player = { vol = 0 }}
endscript

script Reset_Battle_DSP_Effects_Player2
	SetSoundBussEffects \{ effect = $LowPass_Default2 Time = 0.15 }
	SetSoundBussEffects \{ effect = $HighPass_Default2 Time = 0.15 }
	SetSoundBussEffects \{ effect = $Flange_Default2 Time = 0.15 }
	SetSoundBussEffects \{ effect = $Chorus_Default2 Time = 0.15 }
	SetSoundBussEffects \{ effect = $EQ_Default2 Time = 0.15 }
	Printf \{ channel = SFX "RESTTING p2 balance buss" }
	SetSoundBussParams \{Guitar_Balance_Second_Player = { vol = 0 }}
endscript

script Check_And_Reset_Effects
endscript

script cleanup_spawned_scripts_for_effects
endscript

script turn_off_current_audio_effect
endscript

script Profiling_FMOD_EFFECTS
endscript

script GH_Star_Power_Verb_On
	if ($Star_power_verb_is_on = 1)
		return
	endif
	Change \{ Star_power_verb_is_on = 1 }
	SoundEvent \{ Event = Star_Power_Deployed_SFX }
	if ($game_mode != tutorial)
		SoundEvent \{ Event = Star_Power_Deployed_Cheer_SFX }
	endif
	PushSoundBussParams
	SetSoundBussParams \{ $Star_Power_BussSet Time = 0.5 }
	get_song_tempo_cfunc
	if (<beat_duration> > 400)
		beat_duration = (<beat_duration> / 2)
	endif
	if (<beat_duration> > 400)
		beat_duration = (<beat_duration> / 2)
	endif
	if (<beat_duration> > 400)
		beat_duration = (<beat_duration> / 2)
	endif
	if (<beat_duration> > 400)
		beat_duration = 400
	endif
	SetSoundBussEffects effect = {effect = echo name = GuitarEcho1 Delay = <beat_duration>}
	SetSoundBussEffects \{effect = { effect = echo name = GuitarEcho1 Drymix = 1.0 Wetmix = 0.5 }Time = 0.1}
	SetSoundBussEffects \{effect = { effect = sfxreverb name = GuitarReverb1 ReflectionsLevel = -1200.0 ReverbLevel = -550.0 }Time = 0.1}
endscript

script GH_Star_Power_Verb_Off
	if ($Star_power_verb_is_on = 1)
		PopSoundBussParams
	endif
	SetSoundBussEffects \{effect = { effect = echo name = GuitarEcho1 Wetmix = 0.0 }Time = 0.1}
	SetSoundBussEffects \{effect = { effect = sfxreverb name = GuitarReverb1 ReflectionsLevel = -10000.0 ReverbLevel = -10000.0 }Time = 0.5}
	Change \{ Star_power_verb_is_on = 0 }
endscript

script GH3_Set_Guitar_Verb_And_Echo_to_Dry
	SetSoundBussEffects \{ effect = $Echo_Guitar_Buss_Dry }
	SetSoundBussEffects \{ effect = $Reverb_Guitar_Buss_Dry }
endscript

script GH_SFX_Overloaded_Static_Player1
endscript

script GH_SFX_wait_then_kill_Overloaded_Static_Player1
endscript

script GH_SFX_Overloaded_Static_Player2
endscript

script GH_SFX_wait_then_kill_Overloaded_Static_Player2
endscript

script GH_BattleMode_Modulate_HPF_Cutoff
endscript

script gh_battlemode_modulate_HPF_value
endscript

script GH_BattleMode_Modulate_LPF_Cutoff
endscript

script gh_battlemode_modulate_LPF_value
endscript

script GH_BattleMode_Modulate_Phaser_Delay
endscript

script gh_modulate_Phaser_Delay_Value
endscript

script gh_battlemode_modulate_Wah_value
endscript

script GH_BattleMode_Player1_SFX_DiffUp_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_DiffUp_P1 }
endscript

script GH_BattleMode_Player2_SFX_DiffUp_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_DiffUp_P2 }
endscript

script GH_BattleMode_Player1_SFX_DoubleNotes_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_DoubleNote_P1 }
endscript

script GH_BattleMode_Player2_SFX_DoubleNotes_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_DoubleNote_P2 }
endscript

script GH_BattleMode_Player1_SFX_Shake_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_Lightning_Player1 }
endscript

script GH_BattleMode_Player2_SFX_Shake_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_Lightning_Player2 }
endscript

script GH_BattleMode_Player1_SFX_LeftyNotes_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_Lefty_P1 }
endscript

script GH_BattleMode_Player2_SFX_LeftyNotes_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_Lefty_P2 }
endscript

script GH_BattleMode_Player1_SFX_BrokenString_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_StringBreak_P1 }
endscript

script GH_BattleMode_Player2_SFX_BrokenString_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_StringBreak_P2 }
endscript

script GH_BattleMode_Player1_SFX_Steal
	SoundEvent \{ Event = GH_SFX_BattleMode_Steal_P1 }
endscript

script GH_BattleMode_Player2_SFX_Steal
	SoundEvent \{ Event = GH_SFX_BattleMode_Steal_P2 }
endscript

script GH_BattleMode_Player1_SFX_Whammy_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_WhammyAttack_P1 }
endscript

script GH_BattleMode_Player2_SFX_Whammy_Start
	SoundEvent \{ Event = GH_SFX_BattleMode_WhammyAttack_P2 }
endscript

script GH_BattleMode_Player1_SFX_Death_Drain
	SoundEvent \{ Event = GH_SFX_BattleMode_Death_Drain_P1 }
endscript

script GH_BattleMode_Player2_SFX_Death_Drain
	SoundEvent \{ Event = GH_SFX_BattleMode_Death_Drain_P2 }
endscript

script GH_BattleMode_Start_Heartbeat_P1
	SoundEvent \{ Event = Battlemode_HeartBeat_P1 }
endscript

script GH_BattleMode_Stop_Heartbeat_P1
	StopSoundEvent \{ Battlemode_HeartBeat_P1 }
endscript

script GH_BattleMode_Start_Heartbeat_P2
	SoundEvent \{ Event = Battlemode_HeartBeat_P2 }
endscript

script GH_BattleMode_Stop_Heartbeat_P2
	StopSoundEvent \{ Battlemode_HeartBeat_P2 }
endscript

script GH_BattleMode_SFX_Sudden_Death
	SoundEvent \{ Event = GH_SFX_BattleMode_Sudden_Death }
endscript

script GH3_Battle_Play_Crowd_Reaction_SFX
	if (<receiving_player> = 1)
		Battle_Attack_Cheer_Based_On_Venue_P2
	else
		Battle_Attack_Cheer_Based_On_Venue_P1
	endif
endscript

script Battle_Attack_Cheer_Based_On_Venue_P1
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Battle_Attack_Small_Crowd_Cheer_P1 }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Battle_Attack_Medium_Crowd_Cheer_P1 }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Battle_Attack_Large_Crowd_Cheer_P1 }
		case Z_Hell
			SoundEvent \{ Event = Battle_Attack_Hell_Crowd_Cheer_P1 }
		default
			SoundEvent \{ Event = Battle_Attack_Medium_Crowd_Cheer_P1 }
	endswitch
endscript

script Battle_Attack_Cheer_Based_On_Venue_P2
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Battle_Attack_Small_Crowd_Cheer_P2 }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Battle_Attack_Medium_Crowd_Cheer_P2 }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Battle_Attack_Large_Crowd_Cheer_P2 }
		case Z_Hell
			SoundEvent \{ Event = Battle_Attack_Hell_Crowd_Cheer_P2 }
		default
			SoundEvent \{ Event = Battle_Attack_Medium_Crowd_Cheer_P2 }
	endswitch
endscript

script GH3_Battle_Play_Whammy_Pitch_Up_Sound
	num_strums = ($<other_player_status>.whammy_attack)
	player_pan = ($<other_player_status>.Player)
	if (<player_pan> = 1)
		<pan1x> = -0.762
		<pan1y> = 0.647
		<pan2x> = -0.448
		<pan2y> = 0.894
	else
		<pan1x> = 0.47
		<pan1y> = 0.883
		<pan2x> = 0.728
		<pan2y> = 0.685
	endif
	switch <difficulty>
		case easy
			<total_strums> = ($battlemode_powerups [ 6 ].easy_repair)
		case medium
			<total_strums> = ($battlemode_powerups [ 6 ].medium_repair)
		case hard
			<total_strums> = ($battlemode_powerups [ 6 ].hard_repair)
		case expert
			<total_strums> = ($battlemode_powerups [ 6 ].expert_repair)
		default
			Printf \{ "moron" }
	endswitch
	<change_pitch> = (1.3 * <num_strums> / <total_strums>)
	<local_pitch> = (100.0 - (10.0 * <change_pitch>))
	PlaySound GH3_BattleMode_WhammyAttack_Received vol = 50 pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script GH3_Crowd_Manipulate_SFX
endscript

script GH3_Crowd_Event_Listener \{ event_type = surge_fast }
	if NOT ($game_mode = training)
		if GotParam \{ event_type }
			if ($current_crowd > $CrowdLevelForSurges)
				switch <event_type>
					case sing
						Printf \{ " " }
						spawnscriptnow \{ GH3_AdjustCrowdSingingVolumeUp }
					case surge_fast
						GH3_AdjustCrowdFastSurge <...>
					case surge_slow
						GH3_AdjustCrowdSlowSurge <...>
					case applause
						GH3_Play_A_Crowd_Applause_Based_On_Venue
					default
						Printf \{ "idiot" }
				endswitch
			else
				if GotParam \{ override_state }
					switch <event_type>
						case sing
							Printf \{ " " }
							spawnscriptnow \{ GH3_AdjustCrowdSingingVolumeUp }
						case surge_fast
							GH3_Play_A_Fast_Crowd_Swell_Based_On_Venue
						case surge_slow
							GH3_Play_A_Crowd_Applause_Based_On_Venue
							GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue
						case applause
							GH3_Play_A_Crowd_Applause_Based_On_Venue
						default
							Printf \{ "idiot" }
					endswitch
				endif
			endif
		endif
	endif
endscript

script GH3_Play_A_Fast_Crowd_Swell_Based_On_Venue
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Party
		case Z_Dive
		case Z_Soundcheck
			SoundEvent \{ Event = Small_Crowd_Swell }
		case Z_Prison
		case Z_ArtDeco
		case Z_Video
			SoundEvent \{ Event = Medium_Crowd_Swell }
		case Z_Wikker
		case Z_Budokan
			SoundEvent \{ Event = Crowd_Fast_Surge_Cheer }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Swell }
		default
			SoundEvent \{ Event = Medium_Crowd_Swell }
	endswitch
endscript

script GH3_Play_A_Crowd_Applause_Based_On_Venue
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Party
		case Z_Dive
		case Z_Soundcheck
			SoundEvent \{ Event = Small_Crowd_Applause_SE }
		case Z_Prison
		case Z_ArtDeco
		case Z_Video
			SoundEvent \{ Event = Medium_Crowd_Applause }
		case Z_Wikker
		case Z_Budokan
			SoundEvent \{ Event = Large_Crowd_Applause_SFX }
		case Z_Hell
			SoundEvent \{ Event = Medium_Crowd_Applause }
		default
			SoundEvent \{ Event = Medium_Crowd_Applause }
	endswitch
endscript

script GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Party
		case Z_Dive
		case Z_Soundcheck
			SoundEvent \{ Event = Crowd_OneShots_Cheer_Close }
		case Z_Prison
		case Z_ArtDeco
		case Z_Video
			SoundEvent \{ Event = Crowd_OneShots_Cheer_Close }
		case Z_Wikker
		case Z_Budokan
			SoundEvent \{ Event = Crowd_OneShots_Cheer_Close }
		case Z_Hell
			SoundEvent \{ Event = Crowd_OneShots_Cheer_Close }
		default
			SoundEvent \{ Event = Crowd_OneShots_Cheer_Close }
	endswitch
endscript

script GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Party
		case Z_Dive
		case Z_Soundcheck
			SoundEvent \{ Event = Crowd_OneShots_Boo_Close }
		case Z_Prison
		case Z_ArtDeco
		case Z_Video
			SoundEvent \{ Event = Crowd_OneShots_Boo_Close }
		case Z_Wikker
		case Z_Budokan
			SoundEvent \{ Event = Crowd_OneShots_Boo_Close }
		case Z_Hell
			SoundEvent \{ Event = Crowd_OneShots_Boo_Close }
		default
			SoundEvent \{ Event = Crowd_OneShots_Boo_Close }
	endswitch
endscript

script GH3_SFX_Encore_Accept
	Do_Actual_Transition_SFX_Medium_To_Good
	GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue
endscript

script GH3_SFX_Encore_Decline
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Encore_Decline_Small_Crowd_Med_To_Bad_SFX }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Encore_Decline_Medium_Crowd_Med_To_Bad_SFX }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Encore_Decline_Crowd_Med_To_Bad_SFX }
		case Z_Hell
			SoundEvent \{ Event = Encore_Decline_Hell_Crowd_Med_To_Bad_SFX }
		default
			SoundEvent \{ Event = Encore_Decline_Medium_Crowd_Med_To_Bad_SFX }
	endswitch
	GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue
endscript

script GH3_AdjustCrowdSingingVolumeUp
endscript

script GH3_AdjustCrowdSingingVolumeDown
endscript

script GH3_AdjustCrowdFastSurge
	SoundBussUnlock \{ Crowd_Beds }
	SetSoundBussParams \{ $CrowdSurgeBig_BussSet Time = 1.2 }
	SoundBussLock \{ Crowd_Beds }
	wait \{ 1.5 seconds }
	SoundBussUnlock \{ Crowd_Beds }
	SetSoundBussParams \{ $CrowdNormal_BussSet Time = 4 }
	SoundBussLock \{ Crowd_Beds }
endscript

script GH3_AdjustCrowdSlowSurge
	SoundBussUnlock \{ Crowd_Beds }
	SetSoundBussParams \{ $CrowdSurgeSmall_BussSet Time = 4 }
	SoundBussLock \{ Crowd_Beds }
	wait \{ 8 seconds }
	SoundBussUnlock \{ Crowd_Beds }
	SetSoundBussParams \{ $CrowdNormal_BussSet Time = 4 }
	SoundBussLock \{ Crowd_Beds }
endscript

script Crowd_Singalong_Volume_Up
	SoundBussUnlock \{ Crowd_Singalong }
	SetSoundBussParams \{ $CrowdSingingVolUp_BussSet Time = 4 }
	SoundBussLock \{ Crowd_Singalong }
endscript

script Crowd_Singalong_Volume_Down
	SoundBussUnlock \{ Crowd_Singalong }
	SetSoundBussParams \{ $CrowdSingingVolDown_BussSet Time = 1 }
	SoundBussLock \{ Crowd_Singalong }
endscript

script Menu_Music_On
	SetSpawnInstanceLimits \{ Max = 1 management = ignore_spawn_request }
	if GotParam \{ waitforguitarlick }
		wait \{ 3 seconds }
	endif
	EnableUserMusic
	begin
		SoundEvent \{ Event = Menu_Music_SE }
		wait \{ 3 seconds }
		Menu_music_Checking
		wait \{ 1 Second }
	repeat
endscript

script Menu_music_Checking
	begin
		if NOT IsSoundEventPlaying \{ Menu_Music_SE }
			break
		endif
		wait \{ 1 Second }
	repeat
endscript

script Menu_Music_Off
	EnableUserMusic \{ disable }
	killspawnedscript \{ name = Menu_Music_On }
	StopSoundEvent \{ Menu_Music_SE }
endscript

script PlayEncoreStreamSFX
endscript

script Song_Intro_Kick_SFX_Waiting
	printingtext = ($current_intro.hud_move_time)
	wait ($current_intro.hud_move_time / 1000.0)seconds
	SoundEvent \{ Event = Song_Intro_Kick_SFX }
endscript

script Song_Intro_Highway_Up_SFX_Waiting
	printingtext = ($current_intro.highway_move_time)
	waitTime = (($current_intro.highway_move_time / 1000.0)- 1.5)
	if (<waitTime> < 0)
		waitTime = 0
	endif
	wait <waitTime> seconds
	SoundEvent \{ Event = Song_Intro_Highway_Up }
endscript

script Change_Crowd_Looping_SFX \{ crowd_looping_state = Good Player = 1 }
	Printf channel = SFX "changing crowd looping to %s" s = <crowd_looping_state>
	if ($boss_battle = 1)
		Printf \{ channel = SFX "we're in boss battle - see who requested this crowd loop change - p1 or p2" }
		if (<Player> = 1)
			do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
		else
			Printf \{ channel = SFX "do nothing, since it's the boss's health that was requesting a change" }
		endif
	else
		Printf \{ channel = SFX "we're not in boss battle" }
		if (($game_mode = p2_battle)|| ($game_mode = p2_faceoff)|| ($game_mode = p2_pro_faceoff))
			do_actual_changing_of_looping_sound \{ crowd_looping_state = Good }
		else
			do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
		endif
	endif
endscript

script do_actual_changing_of_looping_sound
	if GotParam \{ crowd_looping_state }
		switch <crowd_looping_state>
			case Bad
				Change_Crowd_Looping_SFX_Bad
			case neutral
				Change_Crowd_Looping_SFX_Neutral
			case Good
				Change_Crowd_Looping_SFX_Good
			default
				Change_Crowd_Looping_SFX_Good
		endswitch
	endif
endscript

script Change_Crowd_Looping_SFX_Bad
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			BG_Crowd_Small_Bad
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			BG_Crowd_Medium_Bad
		case Z_Budokan
		case Z_Wikker
			BG_Crowd_Large_Bad
		case Z_Hell
			BG_Crowd_Hell_Bad
		default
			BG_Crowd_Medium_Bad
	endswitch
endscript

script Change_Crowd_Looping_SFX_Neutral
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			BG_Crowd_Small_Neutral
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			BG_Crowd_Medium_Neutral
		case Z_Budokan
		case Z_Wikker
			BG_Crowd_Large_Neutral
		case Z_Hell
			BG_Crowd_Hell_Neutral
		default
			BG_Crowd_Medium_Neutral
	endswitch
endscript

script Change_Crowd_Looping_SFX_Good
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			BG_Crowd_Small_Good
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			BG_Crowd_Medium_Good
		case Z_Budokan
		case Z_Wikker
		case Z_Credits
			BG_Crowd_Large_Good
		case Z_Hell
			BG_Crowd_Hell_Good
		default
			BG_Crowd_Medium_Good
	endswitch
endscript

script Crowd_Transition_SFX_Poor_To_Medium
	Printf \{ channel = SFX "poor to med" }
	if GotParam \{ Player }
		Crowd_generic_transition_sfx state = poor_to_med Player = <Player>
	endif
endscript

script Crowd_Transition_SFX_Medium_To_Good
	Printf \{ channel = SFX "med to good" }
	if GotParam \{ Player }
		Crowd_generic_transition_sfx state = med_to_good Player = <Player>
	endif
endscript

script Crowd_Transition_SFX_Medium_To_Poor
	Printf \{ channel = SFX "med to poor" }
	if GotParam \{ Player }
		Crowd_generic_transition_sfx state = med_to_poor Player = <Player>
	endif
endscript

script Crowd_Transition_SFX_Good_To_Medium
	Printf \{ channel = SFX "good to med" }
	if GotParam \{ Player }
		Crowd_generic_transition_sfx state = good_to_med Player = <Player>
	endif
endscript

script Crowd_generic_transition_sfx \{ state = med_to_good }
	if ($game_mode = p2_battle)
	else
		if ($boss_battle = 1)
			if (<Player> = 1)
				transition_sfx_left_side state = <state>
			else
			endif
		else
			if (($game_mode = p2_faceoff)|| ($game_mode = p2_pro_faceoff))
			else
				transition_sfx_both_sides state = <state>
			endif
		endif
	endif
endscript

script transition_sfx_left_side
	if GotParam \{ state }
		if (<state> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium_P1
		endif
		if (<state> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor_P1
		endif
		if (<state> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good_P1
		endif
		if (<state> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium_P1
		endif
	endif
endscript

script transition_sfx_right_side
	if GotParam \{ state }
		if (<state> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium_P2
		endif
		if (<state> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor_P2
		endif
		if (<state> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good_P2
		endif
		if (<state> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium_P2
		endif
	endif
endscript

script transition_sfx_both_sides
	if GotParam \{ state }
		if (<state> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium
		endif
		if (<state> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor
		endif
		if (<state> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good
		endif
		if (<state> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium
		endif
	endif
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Bad_To_Med_SFX }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Bad_To_Med_SFX }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Bad_To_Med_SFX }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Bad_To_Med_SFX }
		default
			SoundEvent \{ Event = Medium_Crowd_Bad_To_Med_SFX }
	endswitch
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium_P1
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Bad_To_Med_SFX_P1 }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Bad_To_Med_SFX_P1 }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Bad_To_Med_SFX_P1 }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Bad_To_Med_SFX_P1 }
		default
			SoundEvent \{ Event = Medium_Crowd_Bad_To_Med_SFX_P1 }
	endswitch
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium_P2
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Bad_To_Med_SFX_P2 }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Bad_To_Med_SFX_P2 }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Bad_To_Med_SFX_P2 }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Bad_To_Med_SFX_P2 }
		default
			SoundEvent \{ Event = Medium_Crowd_Bad_To_Med_SFX_P2 }
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Med_To_Good_SFX }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Med_To_Good_SFX }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Med_To_Good_SFX }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Med_To_Good_SFX }
		default
			SoundEvent \{ Event = Medium_Crowd_Med_To_Good_SFX }
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good_P1
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Med_To_Good_SFX_P1 }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Med_To_Good_SFX_P1 }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Med_To_Good_SFX_P1 }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Med_To_Good_SFX_P1 }
		default
			SoundEvent \{ Event = Medium_Crowd_Med_To_Good_SFX_P1 }
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good_P2
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Med_To_Good_SFX_P2 }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Med_To_Good_SFX_P2 }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Med_To_Good_SFX_P2 }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Med_To_Good_SFX_P2 }
		default
			SoundEvent \{ Event = Medium_Crowd_Med_To_Good_SFX_P2 }
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Med_To_Bad_SFX }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Med_To_Bad_SFX }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Med_To_Bad_SFX }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Med_To_Bad_SFX }
		default
			SoundEvent \{ Event = Medium_Crowd_Med_To_Bad_SFX }
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor_P1
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Med_To_Bad_SFX_P1 }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Med_To_Bad_SFX_P1 }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Med_To_Bad_SFX_P1 }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Med_To_Bad_SFX_P1 }
		default
			SoundEvent \{ Event = Medium_Crowd_Med_To_Bad_SFX_P1 }
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor_P2
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Med_To_Bad_SFX_P2 }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Med_To_Bad_SFX_P2 }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Med_To_Bad_SFX_P2 }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Med_To_Bad_SFX_P2 }
		default
			SoundEvent \{ Event = Medium_Crowd_Med_To_Bad_SFX_P2 }
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Good_To_Med_SFX }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Good_To_Med_SFX }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Good_To_Med_SFX }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Good_To_Med_SFX }
		default
			SoundEvent \{ Event = Medium_Crowd_Good_To_Med_SFX }
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium_P1
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Good_To_Med_SFX_P1 }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Good_To_Med_SFX_P1 }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Good_To_Med_SFX_P1 }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Good_To_Med_SFX_P1 }
		default
			SoundEvent \{ Event = Medium_Crowd_Good_To_Med_SFX_P1 }
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium_P2
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
		case Z_Party
			SoundEvent \{ Event = Small_Crowd_Good_To_Med_SFX_P2 }
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
			SoundEvent \{ Event = Medium_Crowd_Good_To_Med_SFX_P2 }
		case Z_Budokan
		case Z_Wikker
			SoundEvent \{ Event = Crowd_Good_To_Med_SFX_P2 }
		case Z_Hell
			SoundEvent \{ Event = Hell_Crowd_Good_To_Med_SFX_P2 }
		default
			SoundEvent \{ Event = Medium_Crowd_Good_To_Med_SFX_P2 }
	endswitch
endscript

script You_Rock_Waiting_Crowd_SFX
	wait \{ 2 seconds }
	SoundEvent \{ Event = Crowd_Fast_Surge_Cheer }
	SoundEvent \{ Event = Medium_Crowd_Applause }
endscript
save_check_time_early = 0.0
save_check_time_late = 0.0

script Audio_Sync_Test_Disable_Highway
	disable_bg_viewport
	Change \{ save_check_time_early = $check_time_early }
	Change \{ save_check_time_late = $check_time_late }
	Change \{ check_time_early = 1.0 }
	Change \{ check_time_late = 1.0 }
endscript

script Audio_Sync_Test_Enable_Highway
	enable_bg_viewport
	Change \{ check_time_early = $save_check_time_early }
	Change \{ check_time_late = $save_check_time_late }
endscript

script GH_SFX_Intro_WarmUp
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Party
			PlaySound \{ z_party_intro vol = 100 buss = Crowd_PreSong_Intro }
		case Z_Dive
			PlaySound \{ z_dive_intro vol = 100 buss = Crowd_PreSong_Intro }
		case Z_ArtDeco
			PlaySound \{ z_artdeco_intro vol = 100 buss = Crowd_PreSong_Intro }
		case Z_Video
			PlaySound \{ z_video_intro vol = 100 buss = Crowd_PreSong_Intro }
		case Z_Prison
			PlaySound \{ z_prison_intro vol = 100 buss = Crowd_PreSong_Intro }
		case Z_Budokan
			PlaySound \{ z_budokan_intro vol = 100 buss = Crowd_PreSong_Intro }
		case Z_Wikker
			PlaySound \{ z_wikker_intro vol = 100 buss = Crowd_PreSong_Intro }
		case Z_Hell
			PlaySound \{ z_hell_intro vol = 45 buss = Crowd_PreSong_Intro }
		case Z_Soundcheck
			PlaySound \{ z_party_intro vol = 100 buss = Crowd_PreSong_Intro }
		default
			PlaySound \{ z_party_intro vol = 100 buss = Crowd_PreSong_Intro }
	endswitch
endscript

script PreEncore_Crowd_Build_SFX
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Party
			Printf \{ channel = SFX "playing party build" }
			SoundEvent \{ Event = PreEncore_Crowd_Build_SFX_Backyard }
		case Z_Dive
			SoundEvent \{ Event = PreEncore_Crowd_Build_SFX_Dive }
		case Z_ArtDeco
			SoundEvent \{ Event = PreEncore_Crowd_Build_SFX_Deco }
		case Z_Video
			SoundEvent \{ Event = PreEncore_Crowd_Build_SFX_Video }
		case Z_Prison
			SoundEvent \{ Event = PreEncore_Crowd_Build_SFX_Prison }
		case Z_Budokan
			SoundEvent \{ Event = PreEncore_Crowd_Build_SFX_Budokan }
		case Z_Wikker
			SoundEvent \{ Event = PreEncore_Crowd_Build_SFX_Wikker }
		case Z_Hell
			SoundEvent \{ Event = PreEncore_Crowd_Build_SFX_Hell }
		case Z_Soundcheck
			SoundEvent \{ Event = PreEncore_Crowd_Build_SFX_Backyard }
		default
			SoundEvent \{ Event = PreEncore_Crowd_Build_SFX_Backyard }
	endswitch
endscript

script PreEncore_Crowd_Build_SFX_STOP
	StopSoundEvent \{ PreEncore_Crowd_Build_SFX_Backyard }
	StopSoundEvent \{ PreEncore_Crowd_Build_SFX_Dive }
	StopSoundEvent \{ PreEncore_Crowd_Build_SFX_Deco }
	StopSoundEvent \{ PreEncore_Crowd_Build_SFX_Video }
	StopSoundEvent \{ PreEncore_Crowd_Build_SFX_Prison }
	StopSoundEvent \{ PreEncore_Crowd_Build_SFX_Budokan }
	StopSoundEvent \{ PreEncore_Crowd_Build_SFX_Wikker }
	StopSoundEvent \{ PreEncore_Crowd_Build_SFX_Hell }
	StopSoundEvent \{ PreEncore_Crowd_Build_SFX_Backyard }
	StopSoundEvent \{ PreEncore_Crowd_Build_SFX_Backyard }
endscript

script GH_BossDevil_Death_Transition_SFX
	SoundEvent \{ Event = Devil_Die_Transition_SFX }
endscript

script Battle_SFX_Repair_Broken_String
	if GotParam \{ num_strums }
		if GotParam \{ player_pan }
			if GotParam \{ difficulty }
				if (<player_pan> = 1)
					<pan1x> = -0.762
					<pan1y> = 0.647
					<pan2x> = -0.448
					<pan2y> = 0.894
				else
					<pan1x> = 0.47
					<pan1y> = 0.883
					<pan2x> = 0.728
					<pan2y> = 0.685
				endif
				switch <difficulty>
					case easy
						<total_strums> = ($battlemode_powerups [ 5 ].easy_repair)
					case medium
						<total_strums> = ($battlemode_powerups [ 5 ].medium_repair)
					case hard
						<total_strums> = ($battlemode_powerups [ 5 ].hard_repair)
					case expert
						<total_strums> = ($battlemode_powerups [ 5 ].expert_repair)
					default
						Printf \{ "moron" }
				endswitch
				<change_pitch> = (1.0 * <num_strums> / <total_strums>)
				<local_pitch> = (100.0 - (10.0 * <change_pitch>))
				PlaySound GH3_Battlemode_StringTune_2 vol = 50 pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endif
		endif
	endif
endscript

script GH_SFX_Play_Encore_Audio_From_Zone_Memory
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Party
			PlaySound \{z_party_encore_L vol = 130 buss = BinkCutScenes pan1x = -0.5 pan1y = 0.866025}
			PlaySound \{z_party_encore_R vol = 130 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.866025}
			PlaySound \{z_party_encore_LS vol = 130 buss = BinkCutScenes pan1x = -0.866025 pan1y = -0.5}
			PlaySound \{z_party_encore_RS vol = 130 buss = BinkCutScenes pan1x = 0.866025 pan1y = -0.5}
		case Z_Dive
			PlaySound \{z_dive_encore_L vol = 130 buss = BinkCutScenes pan1x = -0.5 pan1y = 0.866025}
			PlaySound \{z_dive_encore_R vol = 130 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.866025}
			PlaySound \{z_dive_encore_LS vol = 130 buss = BinkCutScenes pan1x = -0.866025 pan1y = -0.5}
			PlaySound \{z_dive_encore_RS vol = 130 buss = BinkCutScenes pan1x = 0.866025 pan1y = -0.5}
		case Z_Video
			PlaySound \{z_video_encore_L vol = 150 buss = BinkCutScenes pan1x = -0.5 pan1y = 0.866025}
			PlaySound \{z_video_encore_R vol = 150 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.866025}
			PlaySound \{z_video_encore_LS vol = 150 buss = BinkCutScenes pan1x = -0.866025 pan1y = -0.5}
			PlaySound \{z_video_encore_RS vol = 150 buss = BinkCutScenes pan1x = 0.866025 pan1y = -0.5}
		case Z_ArtDeco
			PlaySound \{z_artdeco_encore_L vol = 150 buss = BinkCutScenes pan1x = -0.5 pan1y = 0.866025}
			PlaySound \{z_artdeco_encore_R vol = 150 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.866025}
			PlaySound \{z_artdeco_encore_LS vol = 150 buss = BinkCutScenes pan1x = -0.866025 pan1y = -0.5}
			PlaySound \{z_artdeco_encore_RS vol = 150 buss = BinkCutScenes pan1x = 0.866025 pan1y = -0.5}
		case Z_Prison
			PlaySound \{z_prison_encore_L vol = 150 buss = BinkCutScenes pan1x = -0.5 pan1y = 0.866025}
			PlaySound \{z_prison_encore_R vol = 150 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.866025}
			PlaySound \{z_prison_encore_LS vol = 150 buss = BinkCutScenes pan1x = -0.866025 pan1y = -0.5}
			PlaySound \{z_prison_encore_RS vol = 150 buss = BinkCutScenes pan1x = 0.866025 pan1y = -0.5}
		case Z_Wikker
			PlaySound \{z_wikker_encore_L vol = 140 buss = BinkCutScenes pan1x = -0.5 pan1y = 0.866025}
			PlaySound \{z_wikker_encore_R vol = 140 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.866025}
			PlaySound \{z_wikker_encore_LS vol = 140 buss = BinkCutScenes pan1x = -0.866025 pan1y = -0.5}
			PlaySound \{z_wikker_encore_RS vol = 140 buss = BinkCutScenes pan1x = 0.866025 pan1y = -0.5}
		case Z_Budokan
			PlaySound \{z_budokan_encore_L vol = 130 buss = BinkCutScenes pan1x = -0.5 pan1y = 0.866025}
			PlaySound \{z_budokan_encore_R vol = 130 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.866025}
			PlaySound \{z_budokan_encore_LS vol = 130 buss = BinkCutScenes pan1x = -0.866025 pan1y = -0.5}
			PlaySound \{z_budokan_encore_RS vol = 130 buss = BinkCutScenes pan1x = 0.866025 pan1y = -0.5}
		default
			Printf \{ "do nothing - default case" }
	endswitch
endscript
Tom_Intro_Front_Speakers_unique_id = NULL
Tom_Intro_Back_Speakers_unique_id = NULL
Slash_Intro_Front_Speakers_unique_id = NULL
Slash_Intro_Back_Speakers_unique_id = NULL
Lou_Intro_Front_Speakers_unique_id = NULL
Lou_Intro_Back_Speakers_unique_id = NULL

script GH_SFX_Preload_Boss_Intro_Audio
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Dive
			if ($current_song = bosstom)
				Printf \{ channel = SFX "Preload z_dive intro boss sounds" }
				Change \{ Tom_Intro_Front_Speakers_unique_id = NULL }
				Change \{ Tom_Intro_Back_Speakers_unique_id = NULL }
				if PreloadStream \{ Tom_Intro_Front_Speakers buss = Master }
					Change Tom_Intro_Front_Speakers_unique_id = <unique_id>
					waitforpreload_stream \{ Stream = Tom_Intro_Front_Speakers_unique_id }
				else
					Printf \{ channel = SFX "Failed preload Tom_Intro_Front_Speakers" }
				endif
				if PreloadStream \{ Tom_Intro_Back_Speakers buss = Master }
					Change Tom_Intro_Back_Speakers_unique_id = <unique_id>
					waitforpreload_stream \{ Stream = Tom_Intro_Back_Speakers_unique_id }
				else
					Printf \{ channel = SFX "Failed preload Tom_Intro_Back_Speakers" }
				endif
				StartPreLoadedStream \{startpaused = 1 $Tom_Intro_Front_Speakers_unique_id vol = 80 pan1x = -0.5 pan1y = 0.86 pan2x = 0.5 pan2y = 0.86 buss = Encore_Events}
				StartPreLoadedStream \{startpaused = 1 $Tom_Intro_Back_Speakers_unique_id vol = 80 pan1x = -0.86 pan1y = -0.49 pan2x = 0.86 pan2y = -0.5 buss = Encore_Events}
			endif
		case Z_Prison
			if ($current_song = bossslash)
				Printf \{ channel = SFX "Preload z_prison intro boss sounds" }
				Change \{ Slash_Intro_Front_Speakers_unique_id = NULL }
				Change \{ Slash_Intro_Back_Speakers_unique_id = NULL }
				if PreloadStream \{ Slash_Intro_Front_Speakers buss = Master }
					Change Slash_Intro_Front_Speakers_unique_id = <unique_id>
					waitforpreload_stream \{ Stream = Slash_Intro_Front_Speakers_unique_id }
				else
					Printf \{ channel = SFX "Failed preload Slash_Intro_Back_Speakers" }
				endif
				if PreloadStream \{ Slash_Intro_Back_Speakers buss = Master }
					Change Slash_Intro_Back_Speakers_unique_id = <unique_id>
					waitforpreload_stream \{ Stream = Slash_Intro_Back_Speakers_unique_id }
				else
					Printf \{ channel = SFX "Failed preload Slash_Intro_Back_Speakers" }
				endif
				StartPreLoadedStream \{startpaused = 1 $Slash_Intro_Front_Speakers_unique_id vol = 80 pan1x = -0.5 pan1y = 0.86 pan2x = 0.5 pan2y = 0.86 buss = Encore_Events}
				StartPreLoadedStream \{startpaused = 1 $Slash_Intro_Back_Speakers_unique_id vol = 80 pan1x = -0.86 pan1y = -0.49 pan2x = 0.86 pan2y = -0.5 buss = Encore_Events}
			endif
		case Z_Hell
			if ($current_song = bossdevil)
				Printf \{ channel = SFX "Preload z_hell intro boss sounds" }
				Change \{ Lou_Intro_Front_Speakers_unique_id = NULL }
				Change \{ Lou_Intro_Back_Speakers_unique_id = NULL }
				if PreloadStream \{ Lou_Intro_Front_Speakers buss = Master }
					Change Lou_Intro_Front_Speakers_unique_id = <unique_id>
					waitforpreload_stream \{ Stream = Lou_Intro_Front_Speakers_unique_id }
				else
					Printf \{ channel = SFX "Failed preload Lou_Intro_Front_Speakers" }
				endif
				if PreloadStream \{ Lou_Intro_Back_Speakers buss = Master }
					Change Lou_Intro_Back_Speakers_unique_id = <unique_id>
					waitforpreload_stream \{ Stream = Lou_Intro_Back_Speakers_unique_id }
				else
					Printf \{ channel = SFX "Failed preload Lou_Intro_Back_Speakers" }
				endif
				StartPreLoadedStream \{startpaused = 1 $Lou_Intro_Front_Speakers_unique_id vol = 120 pan1x = -0.5 pan1y = 0.86 pan2x = 0.5 pan2y = 0.86 buss = Encore_Events}
				StartPreLoadedStream \{startpaused = 1 $Lou_Intro_Back_Speakers_unique_id vol = 120 pan1x = -0.86 pan1y = -0.49 pan2x = 0.86 pan2y = -0.5 buss = Encore_Events}
			endif
		default
			Printf \{ "do nothing - default case" }
	endswitch
endscript

script GH_SFX_Play_Boss_Audio_From_Zone_Memory
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		default
			Printf \{ "do nothing - default case" }
	endswitch
endscript

script GH3_SFX_fail_song_stop_sounds
	StopSoundsByBuss \{ Crowd }
	StopSoundsByBuss \{ UI_Star_Power }
	StopSoundsByBuss \{ UI_Battle_Mode }
	StopSoundsByBuss \{ Wrong_Notes_Player1 }
	StopSoundsByBuss \{ Wrong_Notes_Player2 }
	StopSoundsByBuss \{ Practice_Band_Playback }
	StopSoundsByBuss \{ BinkCutScenes }
	BG_Crowd_Front_End_Silence \{ immediate = 1 }
endscript

script GH3_SFX_Stop_Sounds_For_KillSong
	StopSoundEvent \{ Song_Intro_Kick_SFX }
	StopSoundEvent \{ Notes_Ripple_Up_SFX }
	StopSoundEvent \{ Song_Intro_Highway_Up }
	StopSoundEvent \{ Crowd_Low_To_Med_SFX }
	StopSoundEvent \{ Crowd_Good_To_Med_SFX }
	StopSoundEvent \{ Crowd_Med_To_Bad_SFX }
	StopSoundEvent \{ Crowd_Med_To_Good_SFX }
	StopSoundEvent \{ Crowd_OneShots_Cheer_Close }
	StopSoundEvent \{ Crowd_Fast_Surge_Cheer }
	StopSoundEvent \{ Crowd_OneShots_Boo_Close }
	StopSoundEvent \{ Medium_Crowd_Bad_To_Med_SFX }
	StopSoundEvent \{ Medium_Crowd_Med_To_Bad_SFX }
	StopSoundEvent \{ Medium_Crowd_Swell }
	StopSoundEvent \{ Medium_Crowd_Applause }
	StopSoundEvent \{ Large_Crowd_Applause_SFX }
	StopSoundEvent \{ Small_Crowd_Bad_To_Med }
	StopSoundEvent \{ Small_Crowd_Med_To_Bad_SFX }
	StopSoundEvent \{ Small_Crowd_Med_To_Good }
	StopSoundEvent \{ Small_Crowd_Good_To_Med_SFX }
	StopSoundEvent \{ Small_Crowd_OneShots_Boo }
	StopSoundEvent \{ Small_Crowd_OneShots_Cheer }
	StopSoundEvent \{ Hell_Crowd_Good_To_Med }
	StopSoundEvent \{ Hell_Crowd_Good_To_Med_SFX }
	StopSoundEvent \{ Lose_Multiplier_Crowd }
	StopSoundEvent \{ Star_Power_Awarded_SFX }
	StopSoundEvent \{ Star_Power_Ready_SFX }
	StopSoundEvent \{ Star_Power_Deployed_SFX }
	StopSoundEvent \{ Star_Power_Deployed_Cheer_SFX }
	StopSoundEvent \{ Single_Player_Bad_Note_Guitar }
	StopSoundEvent \{ Midori_Win_1 }
	StopSoundEvent \{ Midori_Lose_1 }
	StopSoundEvent \{ Lars_Win_3 }
	StopSoundEvent \{ Lars_Lose_1 }
	StopSoundEvent \{ Johnny_Lose_1 }
	StopSoundEvent \{ Izzy_Lose_2 }
	StopSoundEvent \{ Izzy_Lose_1 }
	StopSoundEvent \{ Axel_Win_4 }
	StopSoundEvent \{ Axel_Win_1 }
	StopSoundEvent \{ Axel_Lose_2 }
	StopSoundEvent \{ Axel_Lose_1 }
	StopSoundEvent \{ Small_Crowd_Applause_SE }
	StopSoundEvent \{ Slash_Outro }
	StopSoundEvent \{ GH_SFX_BattleMode_Lightning_Player1 }
	StopSoundEvent \{ GH_SFX_BattleMode_Lightning_Player2 }
	StopSoundEvent \{ GH_SFX_BattleMode_DeathOf_P1 }
	StopSoundEvent \{ GH_SFX_BattleMode_DeathOf_P2 }
	StopSoundEvent \{ GH_SFX_BattleMode_DiffUp_P1 }
	StopSoundEvent \{ GH_SFX_BattleMode_DiffUp_P2 }
	StopSoundEvent \{ GH_SFX_BattleMode_DoubleNote_P1 }
	StopSoundEvent \{ GH_SFX_BattleMode_DoubleNote_P2 }
	StopSoundEvent \{ GH_SFX_BattleMode_Lefty_P1 }
	StopSoundEvent \{ GH_SFX_BattleMode_Lefty_P2 }
	StopSoundEvent \{ GH_SFX_BattleMode_Steal_P1 }
	StopSoundEvent \{ GH_SFX_BattleMode_Steal_P2 }
	StopSoundEvent \{ GH_SFX_BattleMode_StringBreak_P1 }
	StopSoundEvent \{ GH_SFX_BattleMode_StringBreak_P2 }
	StopSoundEvent \{ GH_SFX_BattleMode_WhammyAttack_P1 }
	StopSoundEvent \{ GH_SFX_BattleMode_WhammyAttack_P2 }
	StopSoundEvent \{ GH_SFX_BossBattle_PlayerDies }
	StopSoundEvent \{ GH_SFX_BattleMode_Attack_Over_P1 }
	StopSoundEvent \{ GH_SFX_BattleMode_Attack_Over_P2 }
	StopSoundEvent \{ Battle_Power_Awarded_SFX_P1 }
	StopSoundEvent \{ Battle_Power_Awarded_SFX_P2 }
	StopSoundEvent \{ GH_SFX_BattleMode_WhammyAttack_Received_P1 }
	StopSoundEvent \{ GH_SFX_BattleMode_WhammyAttack_Received_P2 }
	StopSoundEvent \{ GH_SFX_BattleMode_Death_Drain_P1 }
	StopSoundEvent \{ GH_SFX_BattleMode_Death_Drain_P2 }
	StopSoundEvent \{ Battle_Attack_Small_Crowd_Cheer_P1 }
	StopSoundEvent \{ Battle_Attack_Small_Crowd_Cheer_P2 }
	StopSoundEvent \{ Battle_Attack_Medium_Crowd_Cheer_P1 }
	StopSoundEvent \{ Battle_Attack_Medium_Crowd_Cheer_P2 }
	StopSoundEvent \{ Battle_Attack_Large_Crowd_Cheer_P1 }
	StopSoundEvent \{ Battle_Attack_Large_Crowd_Cheer_P2 }
	StopSoundEvent \{ Battle_Attack_Hell_Crowd_Cheer_P1 }
	StopSoundEvent \{ Battle_Attack_Hell_Crowd_Cheer_P2 }
	StopSoundEvent \{ Battlemode_HeartBeat_P1 }
	StopSoundEvent \{ Battlemode_HeartBeat_P2 }
	StopSoundsByBuss \{ Practice_Band_Playback }
	StopSoundEvent \{ UI_SFX_Lose_Multiplier_2X }
	StopSoundEvent \{ UI_SFX_Lose_Multiplier_3X }
	StopSoundEvent \{ UI_SFX_Lose_Multiplier_4X }
	StopSoundEvent \{ Lose_Multiplier_Crowd }
	stopsound \{ Tom_Intro_Front_Speakers }
	stopsound \{ Tom_Intro_Back_Speakers }
	stopsound \{ Slash_Intro_Front_Speakers }
	stopsound \{ Slash_Intro_Back_Speakers }
	stopsound \{ Lou_Intro_Front_Speakers }
	stopsound \{ Lou_Intro_Back_Speakers }
	if NOT (($current_transition = preencore)|| ($current_playing_transition = songlost))
		Printf \{ channel = SFX "changing bg to silence" }
		BG_Crowd_Front_End_Silence \{ immediate = 1 }
	endif
endscript

script GH_SFX_Countoff_Logic
	get_song_struct song = ($current_song)
	if StructureContains Structure = <song_struct> name = countoff
		countoff_sound = (<song_struct>.countoff)
	else
		countoff_sound = 'sticks_normal'
	endif
	if (<velocity> > 99)
		FormatText ChecksumName = sound_event_name 'Countoff_SFX_%s_Hard' s = <countoff_sound>
	else
		if (<velocity> > 74)
			FormatText ChecksumName = sound_event_name 'Countoff_SFX_%s_Med' s = <countoff_sound>
		else
			if (<velocity> > 49)
				FormatText ChecksumName = sound_event_name 'Countoff_SFX_%s_Soft' s = <countoff_sound>
			else
				FormatText ChecksumName = sound_event_name 'Countoff_SFX_%s_Soft' s = <countoff_sound>
			endif
		endif
	endif
	SoundEvent Event = <sound_event_name>
endscript

script GH_SFX_Training_Tuning_Strings
	switch <note_played>
		case 0
			switch <training_notes_strummed>
				case 1
					PlaySound \{ #"0xc29df532" vol = 90 pitch = 80 }
				case 2
					PlaySound \{ #"0xc29df532" vol = 90 pitch = 90 }
				case 3
					PlaySound \{ #"0xf837041d" vol = 90 pitch = 90 }
			endswitch
		case 1
			switch <training_notes_strummed>
				case 1
					PlaySound \{ #"0x46d7fbc8" vol = 90 pitch = 80 }
				case 2
					PlaySound \{ #"0x46d7fbc8" vol = 90 pitch = 90 }
				case 3
					PlaySound \{ #"0x7c7d0ae7" vol = 90 pitch = 90 }
			endswitch
		case 2
			switch <training_notes_strummed>
				case 1
					PlaySound \{ #"0x0e37f5ac" vol = 90 pitch = 80 }
				case 2
					PlaySound \{ #"0x0e37f5ac" vol = 90 pitch = 90 }
				case 3
					PlaySound \{ #"0x349d0483" vol = 90 pitch = 90 }
			endswitch
		case 3
			switch <training_notes_strummed>
				case 1
					PlaySound \{ #"0x80b8f24f" vol = 90 pitch = 80 }
				case 2
					PlaySound \{ #"0x80b8f24f" vol = 90 pitch = 90 }
				case 3
					PlaySound \{ #"0xba120360" vol = 90 pitch = 90 }
			endswitch
		case 4
			switch <training_notes_strummed>
				case 1
					PlaySound \{ #"0xc858fc2b" vol = 90 pitch = 80 }
				case 2
					PlaySound \{ #"0xc858fc2b" vol = 90 pitch = 90 }
				case 3
					PlaySound \{ #"0xf2f20d04" vol = 90 pitch = 90 }
			endswitch
	endswitch
endscript

script GH_SFX_Note_Streak_SinglePlayer
	if (<combo> = 50)
		SoundEvent \{ Event = UI_SFX_50_Note_Streak_SinglePlayer }
	else
		SoundEvent \{ Event = UI_SFX_100_Note_Streak_SinglePlayer }
	endif
endscript

script GH_SFX_Note_Streak_P1
	if (<combo> = 50)
		SoundEvent \{ Event = UI_SFX_50_Note_Streak_P1 }
	else
		SoundEvent \{ Event = UI_SFX_100_Note_Streak_P1 }
	endif
endscript

script GH_SFX_Note_Streak_P2
	if (<combo> = 50)
		SoundEvent \{ Event = UI_SFX_50_Note_Streak_P2 }
	else
		SoundEvent \{ Event = UI_SFX_100_Note_Streak_P2 }
	endif
endscript

script GH_SFX_Training_Hammer_On_Lesson_2
	switch <note_played>
		case 0
			switch <training_notes_strummed>
				case 1
					PlaySound \{ #"0xc29df532" vol = 90 pitch = 80 }
				case 2
					PlaySound \{ #"0xc29df532" vol = 90 pitch = 90 }
				case 3
					PlaySound \{ #"0xf837041d" vol = 90 pitch = 90 }
			endswitch
		case 1
			switch <training_notes_strummed>
				case 1
					PlaySound \{ #"0x46d7fbc8" vol = 90 pitch = 80 }
				case 2
					PlaySound \{ #"0x46d7fbc8" vol = 90 pitch = 90 }
				case 3
					PlaySound \{ #"0x7c7d0ae7" vol = 90 pitch = 90 }
			endswitch
		case 2
			switch <training_notes_strummed>
				case 1
					PlaySound \{ #"0x0e37f5ac" vol = 90 pitch = 80 }
				case 2
					PlaySound \{ #"0x0e37f5ac" vol = 90 pitch = 90 }
				case 3
					PlaySound \{ #"0x349d0483" vol = 90 pitch = 90 }
			endswitch
		case 3
			switch <training_notes_strummed>
				case 1
					PlaySound \{ #"0x80b8f24f" vol = 90 pitch = 80 }
				case 2
					PlaySound \{ #"0x80b8f24f" vol = 90 pitch = 90 }
				case 3
					PlaySound \{ #"0xba120360" vol = 90 pitch = 90 }
			endswitch
		case 4
			switch <training_notes_strummed>
				case 1
					PlaySound \{ #"0xc858fc2b" vol = 90 pitch = 80 }
				case 2
					PlaySound \{ #"0xc858fc2b" vol = 90 pitch = 90 }
				case 3
					PlaySound \{ #"0xf2f20d04" vol = 90 pitch = 90 }
			endswitch
	endswitch
endscript

script StopNotes_01
	if IsSoundEventPlaying \{ #"0xddb0e0c0" }
		SetSoundParams \{ #"0xddb0e0c0" vol = 100 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0xddb0e0c0" vol = 50 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0xddb0e0c0" vol = 10 }
		StopSoundEvent \{ #"0xddb0e0c0" }
	endif
endscript

script StopNotes_02
	if IsSoundEventPlaying \{ #"0x56867df9" }
		SetSoundParams \{ #"0x56867df9" vol = 100 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0x56867df9" vol = 50 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0x56867df9" vol = 10 }
		StopSoundEvent \{ #"0x56867df9" }
	endif
endscript

script StopNotes_03
	if IsSoundEventPlaying \{ #"0x9708a239" }
		SetSoundParams \{ #"0x9708a239" vol = 100 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0x9708a239" vol = 50 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0x9708a239" vol = 10 }
		StopSoundEvent \{ #"0x9708a239" }
	endif
endscript

script StopNotes_04
	if IsSoundEventPlaying \{ #"0x318b7e5f" }
		SetSoundParams \{ #"0x318b7e5f" vol = 100 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0x318b7e5f" vol = 50 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0x318b7e5f" vol = 10 }
		StopSoundEvent \{ #"0x318b7e5f" }
	endif
endscript

script StopNotes_05
	if IsSoundEventPlaying \{ #"0x56867df9" }
		SetSoundParams \{ #"0x56867df9" vol = 100 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0x56867df9" vol = 50 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0x56867df9" vol = 10 }
		StopSoundEvent \{ #"0x56867df9" }
	endif
endscript

script StopNotes_06
	if IsSoundEventPlaying \{ #"0xcf641bf8" }
		SetSoundParams \{ #"0xcf641bf8" vol = 100 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0xcf641bf8" vol = 50 }
		wait \{ 0.05 seconds }
		SetSoundParams \{ #"0xcf641bf8" vol = 10 }
		StopSoundEvent \{ #"0xcf641bf8" }
	endif
endscript

script Tutorial_Mode_Finish_Chord_02
	wait \{ 1 seconds }
	SoundEvent \{ Event = Tutorial_Mode_Finish_Chord }
endscript

script Tutorial_Mode_Finish_Chord_03
	wait \{ 0.3 seconds }
	SoundEvent \{ Event = Tutorial_Mode_Finish_Chord }
endscript
