intro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
fastintro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6700
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
practice_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -3000
	highway_move_time = 2000
	button_ripple_start_time = -1800
	button_ripple_per_button_time = 100
	hud_start_time = -1400
	hud_move_time = 200
}
immediate_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = 0
	song_title_fade_time = 700
	song_title_on_time = 0
	highway_start_time = 0
	highway_move_time = 0
	button_ripple_start_time = 0
	button_ripple_per_button_time = 0
	hud_start_time = 0
	hud_move_time = 0
}
current_intro = fast_intro_sequence_props

script play_intro
	Printf \{ "Playing Intro" }
	PrintStruct <...>
	if ($show_boss_helper_screen = 1)
		return
	endif
	if ($is_attract_mode = 1)
		disable_bg_viewport
		return
	endif
	killspawnedscript \{ name = GuitarEvent_SongFailed_Spawned }
	if GotParam \{ FAST }
		Change \{ current_intro = fastintro_sequence_props }
	elseif GotParam \{ practice }
		Change \{ current_intro = practice_sequence_props }
	else
		Change \{ current_intro = intro_sequence_props }
	endif
	if ($game_mode != tutorial)
		spawnscriptnow \{ intro_song_info Id = intro_scripts }
	endif
	if NOT ($Cheat_PerformanceMode = 1 & $is_network_game = 0)
		spawnscriptnow \{ intro_highway_move Id = intro_scripts }
	endif
	Player = 1
	begin
		FormatText ChecksumName = player_status 'player%i_status' i = <Player>
		FormatText textname = player_text 'p%i' i = <Player>
		spawnscriptnow intro_buttonup_ripple Params = <...> Id = intro_scripts
		Player = (<Player> + 1)
	repeat $current_num_players
	if ($tutorial_disable_hud = 0)
		spawnscriptnow \{ intro_hud_move Id = intro_scripts }
	endif
endscript

script destroy_intro
	killspawnedscript \{ Id = intro_scripts }
	killspawnedscript \{ name = Song_Intro_Kick_SFX_Waiting }
	killspawnedscript \{ name = Song_Intro_Highway_Up_SFX_Waiting }
	killspawnedscript \{ name = move_highway_2d }
	killspawnedscript \{ name = intro_buttonup_ripple }
	killspawnedscript \{ name = intro_hud_move }
	DoScreenElementMorph \{ Id = intro_song_info_text Alpha = 0 }
	DoScreenElementMorph \{ Id = intro_artist_info_text Alpha = 0 }
	DoScreenElementMorph \{ Id = intro_performed_by_text Alpha = 0 }
	Player = 1
	begin
		FormatText ChecksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
		EnableInput controller = ($<player_status>.controller)
		Player = (<Player> + 1)
	repeat $current_num_players
endscript

script intro_buttonup_ripple
	EnableInput OFF controller = ($<player_status>.controller)
	begin
		GetSongTimeMS
		if ($current_intro.button_ripple_start_time + $current_starttime < <Time>)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	if ($current_intro.button_ripple_per_button_time = 0)
		return
	endif
	GetArraySize \{ $gem_colors }
	SoundEvent \{ Event = Notes_Ripple_Up_SFX }
	ExtendCRC button_up_pixel_array ($<player_status>.text)out = pixel_array
	buttonup_count = 0
	begin
		wait ($current_intro.button_ripple_per_button_time / 1000.0)seconds
		array_count = 0
		begin
			Color = ($gem_colors [ <array_count> ])
			if (<array_count> = <buttonup_count>)
				SetArrayElement ArrayName = <pixel_array> GlobalArray Index = <array_count> NewValue = $button_up_pixels
			endif
			array_count = (<array_count> + 1)
		repeat <array_Size>
		buttonup_count = (<buttonup_count> + 1)
	repeat (<array_Size> + 1)
	EnableInput controller = ($<player_status>.controller)
endscript

script intro_song_info
	begin
		GetSongTimeMS
		if ($current_intro.song_title_start_time + $current_starttime < <Time>)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	if ($current_intro.song_title_on_time = 0)
		return
	endif
	get_song_title song = ($current_song)
	GetUpperCaseString <song_title>
	intro_song_info_text ::SetProps text = <UpperCaseString>
	intro_song_info_text ::DoMorph Pos = ($current_intro.song_title_pos)
	get_song_artist song = ($current_song)
	GetUpperCaseString <song_artist>
	intro_artist_info_text ::SetProps text = <UpperCaseString>
	intro_artist_info_text ::DoMorph Pos = ($current_intro.song_artist_pos)
	get_song_artist_text song = ($current_song)
	GetUpperCaseString <song_artist_text>
	intro_performed_by_text ::SetProps text = <UpperCaseString>
	intro_performed_by_text ::DoMorph Pos = ($current_intro.performed_by_pos)
	intro_song_info_text ::SetProps \{ z_priority = 5.0 }
	intro_artist_info_text ::SetProps \{ z_priority = 5.0 }
	intro_performed_by_text ::SetProps \{ z_priority = 5.0 }
	DoScreenElementMorph Id = intro_song_info_text Alpha = 1 Time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph Id = intro_performed_by_text Alpha = 1 Time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph Id = intro_artist_info_text Alpha = 1 Time = ($current_intro.song_title_fade_time / 1000.0)
	wait ($current_intro.song_title_on_time / 1000.0)seconds
	DoScreenElementMorph Id = intro_song_info_text Alpha = 0 Time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph Id = intro_artist_info_text Alpha = 0 Time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph Id = intro_performed_by_text Alpha = 0 Time = ($current_intro.song_title_fade_time / 1000.0)
endscript

script intro_highway_move
	begin
		GetSongTimeMS
		if ($current_intro.highway_start_time + $current_starttime < <Time>)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	spawnscriptnow \{ Song_Intro_Highway_Up_SFX_Waiting }
	Player = 1
	begin
		FormatText ChecksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
		FormatText textname = player_text 'p%i' i = <Player> AddToStringLookup
		move_highway_camera_to_default <...> Time = ($current_intro.highway_move_time / 1000.0)
		Player = (<Player> + 1)
	repeat $current_num_players
endscript

script intro_hud_move
	begin
		GetSongTimeMS
		if ($current_intro.hud_start_time + $current_starttime < <Time>)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	get_num_players_by_gamemode
	Player = 1
	begin
		FormatText ChecksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
		FormatText textname = player_text 'p%i' i = <Player> AddToStringLookup
		move_hud_to_default <...> Time = ($current_intro.hud_move_time / 1000.0)
		Player = (<Player> + 1)
	repeat <num_players>
	if ($game_mode = p2_battle & $battle_sudden_death = 1)
		restore_saved_powerups
	endif
	spawnscriptnow \{ Song_Intro_Kick_SFX_Waiting }
endscript

script play_outro
	SongUnLoadFSBIfDownloaded
	Kill_StarPower_Camera \{ changecamera = 0 }
	Kill_Walk_Camera \{ changecamera = 0 }
	Change \{ StructureName = player1_status star_power_amount = 0 }
	Change \{ StructureName = player2_status star_power_amount = 0 }
	Kill_StarPower_StageFX player_text = ($player1_status.text)player_status = $player1_status IfEmpty = 0
	Kill_StarPower_StageFX player_text = ($player2_status.text)player_status = $player2_status IfEmpty = 0
	Change \{ showing_raise_axe = 0 }
	Destroy2DParticleSystem \{ Id = All }
	LaunchGemEvent \{ Event = kill_objects }
	Player = 1
	begin
		FormatText ChecksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
		FormatText textname = player_text 'p%i' i = <Player> AddToStringLookup
		GuitarEvent_KillSong <...>
		destroy_hud <...>
		battlemode_deinit <...>
		bossbattle_deinit <...>
		faceoff_deinit <...>
		faceoff_volumes_deinit <...>
		Player = (<Player> + 1)
	repeat $max_num_players
	practicemode_deinit
	notemap_deinit
	kill_startup_script <...>
	killspawnedscript \{ name = GuitarEvent_MissedNote }
	killspawnedscript \{ name = GuitarEvent_UnnecessaryNote }
	killspawnedscript \{ name = GuitarEvent_HitNotes }
	killspawnedscript \{ name = GuitarEvent_HitNote }
	killspawnedscript \{ name = GuitarEvent_StarPowerOn }
	killspawnedscript \{ name = GuitarEvent_StarPowerOff }
	killspawnedscript \{ name = GuitarEvent_StarHitNote }
	killspawnedscript \{ name = GuitarEvent_StarSequenceBonus }
	killspawnedscript \{ name = GuitarEvent_StarMissNote }
	killspawnedscript \{ name = GuitarEvent_WhammyOn }
	killspawnedscript \{ name = GuitarEvent_WhammyOff }
	killspawnedscript \{ name = GuitarEvent_StarWhammyOn }
	killspawnedscript \{ name = GuitarEvent_StarWhammyOff }
	killspawnedscript \{ name = GuitarEvent_Note_Window_Open }
	killspawnedscript \{ name = GuitarEvent_Note_Window_Close }
	killspawnedscript \{ name = GuitarEvent_crowd_poor_medium }
	killspawnedscript \{ name = GuitarEvent_crowd_medium_good }
	killspawnedscript \{ name = GuitarEvent_crowd_medium_poor }
	killspawnedscript \{ name = GuitarEvent_crowd_good_medium }
	killspawnedscript \{ name = GuitarEvent_CreateFirstGem }
	killspawnedscript \{ name = highway_pulse_black }
	killspawnedscript \{ name = GuitarEvent_HitNote_Spawned }
	killspawnedscript \{ name = hit_note_fx }
	killspawnedscript \{ name = Do_StarPower_StageFX }
	killspawnedscript \{ name = Do_StarPower_Camera }
	killspawnedscript \{ name = first_gem_fx }
	killspawnedscript \{ name = gem_iterator }
	killspawnedscript \{ name = gem_array_stepper }
	killspawnedscript \{ name = gem_array_events }
	killspawnedscript \{ name = gem_step }
	killspawnedscript \{ name = gem_step_end }
	killspawnedscript \{ name = fretbar_iterator }
	killspawnedscript \{ name = Strum_iterator }
	killspawnedscript \{ name = FretPos_iterator }
	killspawnedscript \{ name = FretFingers_iterator }
	killspawnedscript \{ name = Drum_iterator }
	killspawnedscript \{ name = Drum_cymbal_iterator }
	killspawnedscript \{ name = WatchForStartPlaying_iterator }
	killspawnedscript \{ name = gem_scroller }
	killspawnedscript \{ name = button_checker }
	killspawnedscript \{ name = check_buttons }
	killspawnedscript \{ name = check_buttons_fast }
	killspawnedscript \{ name = fretbar_update_tempo }
	killspawnedscript \{ name = fretbar_update_hammer_on_tolerance }
	killspawnedscript \{ name = move_whammy }
	killspawnedscript \{ name = create_fretbar }
	killspawnedscript \{ name = move_highway_2d }
	killspawnedscript \{ name = update_score_fast }
	killspawnedscript \{ name = check_for_star_power }
	killspawnedscript \{ name = wait_for_inactive }
	killspawnedscript \{ name = GuitarEvent_PreFretbar }
	killspawnedscript \{ name = GuitarEvent_Fretbar }
	killspawnedscript \{ name = check_note_hold }
	killspawnedscript \{ name = star_power_whammy }
	killspawnedscript \{ name = show_star_power_ready }
	killspawnedscript \{ name = hud_glowburst_alert }
	Change \{ star_power_ready_on_p1 = 0 }
	Change \{ star_power_ready_on_p2 = 0 }
	killspawnedscript \{ name = event_iterator }
	killspawnedscript \{ name = win_song }
	killspawnedscript \{ name = hand_note_iterator }
	killspawnedscript \{ name = kill_object_later }
	killspawnedscript \{ name = show_coop_raise_axe_for_starpower }
	killspawnedscript \{ name = net_whammy_pitch_shift }
	killspawnedscript \{ name = Crowd_AllPlayAnim }
	killspawnedscript \{ name = hud_activated_star_power_spawned }
	killspawnedscript \{ name = pulsate_all_star_power_bulbs }
	killspawnedscript \{ name = pulsate_star_power_bulb }
	killspawnedscript \{ name = rock_meter_star_power_on }
	killspawnedscript \{ name = rock_meter_star_power_off }
	killspawnedscript \{ name = hud_activated_star_power }
	killspawnedscript \{ name = hud_move_note_scorebar }
	killspawnedscript \{ name = hud_flash_red_bg_p1 }
	killspawnedscript \{ name = hud_flash_red_bg_p2 }
	killspawnedscript \{ name = hud_flash_red_bg_kill }
	killspawnedscript \{ name = hud_lightning_alert }
	killspawnedscript \{ name = hud_show_note_streak_combo }
	killspawnedscript \{ name = play_intro }
	killspawnedscript \{ name = begin_song_after_intro }
	if GotParam \{ kill_cameracuts_iterator }
		killspawnedscript \{ name = cameracuts_iterator }
	endif
	Printf \{ "kill_gem_scroller - Killing Event Scripts" }
	killspawnedscript \{ Id = song_event_scripts }
	Printf \{ "kill_gem_scroller - Killing Event Scripts Finished" }
	Destroy_AllWhammyFX
	destroy_intro
	end_song <...>
endscript
