whammy_units_per_second = 6.35
default_gem_offset = 0
default_input_offset = 0
default_drums_offset = 0
default_practice_mode_geminput_offset = 0
default_practice_mode_pitchshift_offset_song = 0
default_practice_mode_pitchshift_offset_slow = 0
default_practice_mode_pitchshift_offset_slower = 0
default_practice_mode_pitchshift_offset_slowest = 0
current_startup_script = nothing
current_exit_script = nothing
num_song_columns = 3
gem_colors = [
	Green
	Red
	Yellow
	Blue
	Orange
]
gem_colors_text = [
	'green'
	'red'
	'yellow'
	'blue'
	'orange'
]
broken_strings = [
	broken_string_green
	broken_string_red
	broken_string_yellow
	broken_string_blue
	broken_string_orange
]
scripts_array = [
	{ name = 'scripts' lead_ms = 0 }
	{ name = 'anim' lead_ms = 0 }
	{ name = 'triggers' lead_ms = 0 }
	{ name = 'cameras' lead_ms = 0 }
	{ name = 'lightshow' lead_ms = $lightshow_offset_ms }
	{ name = 'crowd' lead_ms = 0 }
	{ name = 'drums' lead_ms = $default_drums_offset }
	{ name = 'performance' lead_ms = 0 }
]
fretbar_end_scale = 0.48
button_models = {
	Green = {
		gem_material = sys_Gem2D_Green_sys_Gem2D_Green
		gem_hammer_material = sys_Gem2D_Green_hammer_sys_Gem2D_Green_hammer
		star_material = sys_Star2D_Green_sys_Star2D_Green
		star_hammer_material = sys_Star2D_Green_Hammer_sys_Star2D_Green_Hammer
		battle_star_material = sys_BattleGEM_Green01_sys_BattleGEM_Green01
		battle_star_hammer_material = sys_BattleGEM_Hammer_Green01_sys_BattleGEM_Hammer_Green01
		whammy_material = sys_Whammy2D_Green_sys_Whammy2D_Green
		star_power_material = sys_Gem2D_StarPower_sys_Gem2D_StarPower
		star_power_hammer_material = sys_Gem2D_StarPower_hammer_sys_Gem2D_StarPower_hammer
		star_power_whammy_material = sys_Whammy2D_StarPower_sys_Whammy2D_StarPower
		dead_whammy = sys_Whammy2D_Dead_sys_Whammy2D_Dead
		name = button_g
	}
	Red = {
		gem_material = sys_Gem2D_Red_sys_Gem2D_Red
		gem_hammer_material = sys_Gem2D_Red_hammer_sys_Gem2D_Red_hammer
		star_material = sys_Star2D_Red_sys_Star2D_Red
		star_hammer_material = sys_Star2D_Red_Hammer_sys_Star2D_Red_Hammer
		battle_star_material = sys_BattleGEM_RED01_sys_BattleGEM_RED01
		battle_star_hammer_material = sys_BattleGEM_Hammer_RED01_sys_BattleGEM_Hammer_RED01
		whammy_material = sys_Whammy2D_Red_sys_Whammy2D_Red
		star_power_material = sys_Gem2D_StarPower_sys_Gem2D_StarPower
		star_power_hammer_material = sys_Gem2D_StarPower_hammer_sys_Gem2D_StarPower_hammer
		star_power_whammy_material = sys_Whammy2D_StarPower_sys_Whammy2D_StarPower
		dead_whammy = sys_Whammy2D_Dead_sys_Whammy2D_Dead
		name = button_r
	}
	Yellow = {
		gem_material = sys_Gem2D_Yellow_sys_Gem2D_Yellow
		gem_hammer_material = sys_Gem2D_Yellow_hammer_sys_Gem2D_Yellow_hammer
		star_material = sys_Star2D_Yellow_sys_Star2D_Yellow
		star_hammer_material = sys_Star2D_Yellow_Hammer_sys_Star2D_Yellow_Hammer
		battle_star_material = sys_BattleGEM_Yellow01_sys_BattleGEM_Yellow01
		battle_star_hammer_material = sys_BattleGEM_Hammer_Yellow01_sys_BattleGEM_Hammer_Yellow01
		whammy_material = sys_Whammy2D_Yellow_sys_Whammy2D_Yellow
		star_power_material = sys_Gem2D_StarPower_sys_Gem2D_StarPower
		star_power_hammer_material = sys_Gem2D_StarPower_hammer_sys_Gem2D_StarPower_hammer
		star_power_whammy_material = sys_Whammy2D_StarPower_sys_Whammy2D_StarPower
		dead_whammy = sys_Whammy2D_Dead_sys_Whammy2D_Dead
		name = button_y
	}
	Blue = {
		gem_material = sys_Gem2D_Blue_sys_Gem2D_Blue
		gem_hammer_material = sys_Gem2D_Blue_hammer_sys_Gem2D_Blue_hammer
		star_material = sys_Star2D_Blue_sys_Star2D_Blue
		star_hammer_material = sys_Star2D_Blue_Hammer_sys_Star2D_Blue_Hammer
		battle_star_material = sys_BattleGEM_Blue01_sys_BattleGEM_Blue01
		battle_star_hammer_material = sys_BattleGEM_Hammer_Blue01_sys_BattleGEM_Hammer_Blue01
		whammy_material = sys_Whammy2D_Blue_sys_Whammy2D_Blue
		star_power_material = sys_Gem2D_StarPower_sys_Gem2D_StarPower
		star_power_hammer_material = sys_Gem2D_StarPower_hammer_sys_Gem2D_StarPower_hammer
		star_power_whammy_material = sys_Whammy2D_StarPower_sys_Whammy2D_StarPower
		dead_whammy = sys_Whammy2D_Dead_sys_Whammy2D_Dead
		name = button_b
	}
	Orange = {
		gem_material = sys_Gem2D_Orange_sys_Gem2D_Orange
		gem_hammer_material = sys_Gem2D_Orange_hammer_sys_Gem2D_Orange_hammer
		star_material = sys_Star2D_Orange_sys_Star2D_Orange
		star_hammer_material = sys_Star2D_Orange_Hammer_sys_Star2D_Orange_Hammer
		battle_star_material = sys_BattleGEM_Orange01_sys_BattleGEM_Orange01
		battle_star_hammer_material = sys_BattleGEM_Hammer_Orange01_sys_BattleGEM_Hammer_Orange01
		whammy_material = sys_Whammy2D_Orange_sys_Whammy2D_Orange
		star_power_material = sys_Gem2D_StarPower_sys_Gem2D_StarPower
		star_power_hammer_material = sys_Gem2D_StarPower_hammer_sys_Gem2D_StarPower_hammer
		star_power_whammy_material = sys_Whammy2D_StarPower_sys_Whammy2D_StarPower
		dead_whammy = sys_Whammy2D_Dead_sys_Whammy2D_Dead
		name = button_o
	}
}

script setup_models
	tod_manager_create_perm_lights
	LightShow_CreatePermModels
endscript

script setup_gemarrays
	get_song_struct song = <song_name>
	if (($<player_status>.part)= rhythm)
		<part> = 'rhythm_'
	else
		<part> = ''
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop ||
		($game_mode = training & ($<player_status>.part = rhythm)))
		if StructureContains Structure = <song_struct> use_coop_notetracks
			if (($<player_status>.part)= rhythm)
				<part> = 'rhythmcoop_'
			else
				<part> = 'guitarcoop_'
			endif
		endif
	endif
	get_song_prefix song = <song_name>
	get_difficulty_text_nl difficulty = <difficulty>
	FormatText ChecksumName = gem_array '%s_%t_%p%d' s = <song_prefix> t = 'song' p = <part> d = <difficulty_text_nl> AddToStringLookup
	FormatText ChecksumName = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup
	Change StructureName = <player_status> current_song_gem_array = <gem_array>
	Change StructureName = <player_status> current_song_fretbar_array = <fretbar_array>
	Change StructureName = <player_status> current_song_beat_time = ($<fretbar_array> [ 1 ])
	Change StructureName = <player_status> playline_song_beat_time = ($<fretbar_array> [ 1 ])
	reset_star_array song_name = <song_name> difficulty = <difficulty> player_status = <player_status>
	return gem_array = <gem_array> fretbar_array = <fretbar_array> song_prefix = <song_prefix> part = <part> difficulty_text_nl = <difficulty_text_nl>
endscript

script calc_health_invincible_time
	get_song_end_time song = ($current_song)
	Change StructureName = <player_status> health_invincible_time = 0.0
	if ($game_mode = p1_quickplay ||
		$game_mode = p1_career ||
		$game_mode = p2_battle)
		if NOT ($battle_sudden_death)
			if (($<player_status>.Player = 1 & $current_difficulty = easy)||
				($<player_status>.Player = 2 & $current_difficulty2 = easy))
				Change StructureName = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_easy / 100.0)
			endif
			if (($<player_status>.Player = 1 & $current_difficulty = medium)||
				($<player_status>.Player = 2 & $current_difficulty2 = medium))
				Change StructureName = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_medium / 100.0)
			endif
		endif
	elseif ($game_mode = p2_coop ||
		$game_mode = p2_career)
		if ($current_difficulty = easy & $current_difficulty2 = easy)
			Change StructureName = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_easy / 100.0)
		elseif (($current_difficulty = easy & $current_difficulty2 = medium)||
			($current_difficulty = medium & $current_difficulty2 = easy))
			Change StructureName = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_medium / 100.0)
		endif
	endif
endscript

script gem_scroller \{ Player = 1 training_mode = 0 }
	setup_gemarrays song_name = <song_name> difficulty = <difficulty> player_status = <player_status>
	calc_health_invincible_time song = <song_name> player_status = <player_status>
	if ($Cheat_EasyExpert = 1)
		if ($is_network_game || $game_mode = p1_career || $game_mode = p2_coop)
			Change \{ check_time_early = $original_check_time_early }
			Change \{ check_time_late = $original_check_time_late }
		endif
	endif
	if ($Cheat_PrecisionMode = 1)
		if ($is_network_game)
			Change \{ check_time_early = $original_check_time_early }
			Change \{ check_time_late = $original_check_time_late }
		endif
	endif
	Change StructureName = <player_status> check_time_early = ($check_time_early * $current_speedfactor)
	Change StructureName = <player_status> check_time_late = ($check_time_late * $current_speedfactor)
	FormatText ChecksumName = input_array 'input_array%p' p = <player_text>
	Printf \{ "-----------------------------------" }
	Printf \{ "-----------------------------------" }
	Printf \{ "-----------------------------------" }
	Printf \{ "-----------------------------------" }
	Printf \{ "-----------------------------------" }
	Printf "Creating array for %p" p = <player_text>
	Printf \{ "-----------------------------------" }
	Printf \{ "-----------------------------------" }
	Printf \{ "-----------------------------------" }
	Printf \{ "-----------------------------------" }
	Printf \{ "-----------------------------------" }
	InputArrayCreate name = <input_array>
	if (<Player> = 1)
		if ($input_mode = record)
			ClearDataBuffer \{ name = replay }
			DataBufferPutChecksum name = replay value = <song_name>
			DataBufferPutChecksum name = replay value = ($current_transition)
			DataBufferPutInt \{ name = replay value = $current_num_players }
			DataBufferPutInt name = replay value = ($player1_status.controller)
			DataBufferPutInt name = replay value = ($player2_status.controller)
			DataBufferPutChecksum name = replay value = <difficulty> bytes = 16
			DataBufferPutChecksum name = replay value = <difficulty2> bytes = 16
			GetRandomSeeds
			DataBufferPutInt name = replay value = <seed1>
			DataBufferPutInt name = replay value = <seed2>
			DataBufferPutInt name = replay value = <seed3>
			DataBufferPutInt name = replay value = <seed4>
			DataBufferPutInt name = replay value = <seed5>
			DataBufferPutInt name = replay value = <seed6>
		endif
	endif
	<gem_offset> = ($time_gem_offset)
	<input_offset> = ($time_input_offset)
	GetGlobalTags \{ user_options }
	<input_offset> = (<input_offset> - <lag_calibration>)
	if (<training_mode> = 0)
		SpawnScriptLater Strum_iterator Params = {song_name = <song_name> difficulty = expert
			time_offset = (<gem_offset> + $strum_anim_lead_time)skipleadin = 0
			part = <part> Target = (<player_status>.band_Member)}
		SpawnScriptLater FretFingers_iterator Params = {song_name = <song_name> difficulty = expert
			time_offset = (<gem_offset> + $strum_anim_lead_time)skipleadin = 0
			part = <part> Target = (<player_status>.band_Member)}
		SpawnScriptLater FretPos_iterator Params = {song_name = <song_name>
			time_offset = (<gem_offset> + $strum_anim_lead_time)skipleadin = 0
			part = ($<player_status>.part)Target = (<player_status>.band_Member)}
		if (<Player> = 1)
			SpawnScriptLater Drum_iterator Params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> + $drum_anim_lead_time)skipleadin = 0
				Player = <Player> player_status = <player_status> player_text = <player_text>}
			SpawnScriptLater Drum_cymbal_iterator Params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = <gem_offset> skipleadin = 0
				Player = <Player> player_status = <player_status> player_text = <player_text>}
			if ($current_num_players = 1)
				bassist_song_part = 'rhythm_'
				bassist_part = rhythm
				get_song_struct song = <song_name>
				if StructureContains Structure = <song_struct> name = BASSIST
					if ((<song_struct>.BASSIST = 'Morello')|| (<song_struct>.BASSIST = 'slash'))
						bassist_song_part = ''
						bassist_part = guitar
					endif
				endif
				SpawnScriptLater Strum_iterator Params = {song_name = <song_name> difficulty = expert
					time_offset = (<gem_offset> + $strum_anim_lead_time)skipleadin = 0
					part = <bassist_song_part> Target = BASSIST}
				SpawnScriptLater FretFingers_iterator Params = {song_name = <song_name> difficulty = expert
					time_offset = (<gem_offset> + $strum_anim_lead_time)skipleadin = 0
					part = <bassist_song_part> Target = BASSIST}
				SpawnScriptLater FretPos_iterator Params = {song_name = <song_name> difficulty = <difficulty>
					time_offset = (<gem_offset> + $strum_anim_lead_time)skipleadin = 0
					part = <bassist_part> Target = BASSIST}
			endif
		endif
	endif
	FormatText ChecksumName = input_array 'input_array%p' p = <player_text>
	SpawnScriptLater gem_iterator Params = {iterator_text = 'fill_array' song_name = <song_name> difficulty = <difficulty> part = <part> input_array = <input_array>
		time_offset = ((($<player_status>.scroll_time - $destroy_time)* 1000.0)+ <gem_offset> + 1000.0)strum_function = fill_input_array skipleadin = ($<player_status>.scroll_time * 1000.0)
		Player = <Player> player_status = <player_status> player_text = <player_text>}
	if ($game_mode = p2_faceoff)
		SpawnScriptLater faceoff_init Params = {song_name = <song_name> difficulty = <difficulty> part = <part>
			time_offset = ((($<player_status>.scroll_time - $destroy_time)* 1000.0)+ <gem_offset> + 1000.0)skipleadin = ($<player_status>.scroll_time * 1000.0)
			Player = <Player> player_status = <player_status> player_text = <player_text>}
		SpawnScriptLater faceoff_volumes_init Params = {song_name = <song_name> difficulty = <difficulty> part = <part>
			time_offset = ((($<player_status>.check_time_early)* 1000.0)+ <input_offset>)skipleadin = ($<player_status>.scroll_time * 1000.0)
			Player = <Player> player_status = <player_status> player_text = <player_text>}
	endif
	<do_bot> = 0
	if ($boss_battle = 1)
		if (<Player> = 2)
			FormatText ChecksumName = bossresponse_array 'bossresponse_array%p' p = <player_text>
			InputArrayCreate name = <bossresponse_array>
			SpawnScriptLater gem_iterator Params = {iterator_text = 'fill_bossarray' song_name = <song_name> difficulty = <difficulty> part = <part> input_array = <bossresponse_array>
				time_offset = ((($<player_status>.scroll_time - $destroy_time)* 1000.0)+ <gem_offset> + 1000.0)strum_function = fill_input_array skipleadin = ($<player_status>.scroll_time * 1000.0)
				Player = <Player> player_status = <player_status> player_text = <player_text>}
			SpawnScriptLater gem_iterator Params = {iterator_text = 'boss' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'bossresponse_array'
				time_offset = ((($<player_status>.check_time_early)* 1000.0)+ <input_offset>)strum_function = check_buttons_boss skipleadin = ($<player_status>.scroll_time * 1000.0)
				Player = <Player> player_status = <player_status> player_text = <player_text>}
		elseif ($<player_status>.bot_play = 1)
			<do_bot> = 1
		endif
	elseif ($<player_status>.bot_play = 1)
		<do_bot> = 1
	endif
	if (<do_bot> = 1)
		SpawnScriptLater gem_iterator Params = {iterator_text = 'bot' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'input_array' one_event_per_frame
			time_offset = ((($<player_status>.check_time_early)* 1000.0)+ <input_offset>)strum_function = check_buttons_bot skipleadin = ($<player_status>.scroll_time * 1000.0)
			Player = <Player> player_status = <player_status> player_text = <player_text>}
		Printf \{ channel = log "Spawned bot!" }
	endif
	if ($new_net_logic)
		if (<Player> = 2)
			FormatText ChecksumName = bossresponse_array 'bossresponse_array%p' p = <player_text>
			InputArrayCreate name = <bossresponse_array>
			SpawnScriptLater gem_iterator Params = {iterator_text = 'fill_bossarray' song_name = <song_name> difficulty = <difficulty> part = <part> input_array = <bossresponse_array>
				time_offset = ((($<player_status>.scroll_time - $destroy_time)* 1000.0)+ <gem_offset> + 1000.0)strum_function = fill_input_array skipleadin = ($<player_status>.scroll_time * 1000.0)
				Player = <Player> player_status = <player_status> player_text = <player_text>}
			SpawnScriptLater gem_iterator Params = {iterator_text = 'boss' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'bossresponse_array'
				time_offset = ((($<player_status>.check_time_early)* 1000.0)+ <input_offset>)strum_function = check_buttons_boss skipleadin = ($<player_status>.scroll_time * 1000.0)
				Player = <Player> player_status = <player_status> player_text = <player_text>}
		endif
	endif
	SpawnScriptLater fretbar_iterator Params = {song_name = <song_name> difficulty = <difficulty> thin_fretbars
		time_offset = ((($<player_status>.scroll_time - $destroy_time)* 1000.0)+ <gem_offset>)fretbar_function = create_fretbar skipleadin = ($<player_status>.scroll_time * 1000.0)
		Player = <Player> player_status = <player_status> player_text = <player_text>}
	SpawnScriptLater gem_iterator Params = {iterator_text = 'create_gem' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'input_array'
		time_offset = ((($<player_status>.scroll_time - $destroy_time)* 1000.0)+ <gem_offset>)gem_function = create_gem skipleadin = ($<player_status>.scroll_time * 1000.0)
		Player = <Player> player_status = <player_status> player_text = <player_text>}
	if ((<player_status>.is_local_client)|| ($new_net_logic))
		SpawnScriptLater check_buttons_fast Params = {song_name = <song_name> difficulty = <difficulty>
			time_offset = ((($<player_status>.check_time_early)* 1000.0)+ <input_offset>)Player = <Player>
			player_status = <player_status> player_text = <player_text>}
	else
		SpawnScriptLater net_check_buttons Params = {song_name = <song_name> player_status = <player_status>
			time_offset = ((($<player_status>.check_time_early)* 1000.0)+ <input_offset>)}
	endif
	SpawnScriptLater fretbar_update_tempo Params = {song_name = <song_name> difficulty = <difficulty>
		time_offset = ((($<player_status>.check_time_early)* 1000.0)+ <gem_offset>)Player = <Player> skipleadin = ($<player_status>.scroll_time * 1000.0)
		player_status = <player_status> player_text = <player_text>}
	SpawnScriptLater fretbar_update_hammer_on_tolerance Params = {song_name = <song_name> difficulty = <difficulty>
		time_offset = ((($<player_status>.scroll_time - $destroy_time)* 1000.0)+ <gem_offset> + 1000.0)Player = <Player> skipleadin = ($<player_status>.scroll_time * 1000.0)
		player_status = <player_status> player_text = <player_text>}
	if (<Player> = 1)
		if ($is_network_game)
			SpawnScriptLater dispatch_player_state Params = { player_status = <player_status> }
			SpawnScriptLater \{ network_events }
		endif
		SpawnScriptLater fretbar_iterator Params = {song_name = <song_name> difficulty = <difficulty>
			time_offset = (($prefretbar_time * 1000.0)+ <gem_offset>)fretbar_function = GuitarEvent_PreFretbar skipleadin = 0
			Player = <Player> player_status = <player_status> player_text = <player_text>}
		SpawnScriptLater fretbar_iterator Params = {song_name = <song_name> difficulty = <difficulty>
			time_offset = <gem_offset> fretbar_function = GuitarEvent_Fretbar skipleadin = 0
			Player = <Player> player_status = <player_status> player_text = <player_text>}
		if ($Debug_Audible_Downbeat = 1)
			SpawnScriptLater fretbar_iterator Params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> + ($check_time_early * 1000.0))fretbar_function = GuitarEvent_Fretbar_Early skipleadin = 0
				Player = <Player> player_status = <player_status> player_text = <player_text>}
			SpawnScriptLater fretbar_iterator Params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> - ($check_time_late * 1000.0))fretbar_function = GuitarEvent_Fretbar_Late skipleadin = 0
				Player = <Player> player_status = <player_status> player_text = <player_text>}
		endif
		SpawnScriptLater lightshow_iterator Params = {song_name = <song_name> time_offset = (<gem_offset> + $lightshow_offset_ms)skipleadin = 0}
		SpawnScriptLater cameracuts_iterator Params = {song_name = <song_name> time_offset = <gem_offset> skipleadin = 0}
		GetArraySize \{ $scripts_array }
		array_count = 0
		begin
			<lead_ms> = ($scripts_array [ <array_count> ].lead_ms)
			SpawnScriptLater event_iterator Params = {song_name = <song_name> difficulty = <difficulty>
				event_string = ($scripts_array [ <array_count> ].name)time_offset = (<gem_offset> + <lead_ms>)skipleadin = 0
				Player = <Player> player_status = <player_status> player_text = <player_text>}
			SpawnScriptLater notemap_startiterator Params = {song_name = <song_name> difficulty = <difficulty>
				event_string = ($scripts_array [ <array_count> ].name)time_offset = (<gem_offset> + <lead_ms>)skipleadin = 0
				Player = <Player> player_status = <player_status> player_text = <player_text>}
			array_count = (<array_count> + 1)
		repeat <array_Size>
	endif
	SpawnScriptLater win_song Params = { <...>	}
endscript

script get_song_end_time_for_array
	if NOT GlobalExists name = <song_array>
		total_end_time2 = 2.0
	else
		GetArraySize $<song_array>
		if (<array_Size> = 0)
			total_end_time2 = 2.0
		else
			last_entry = (<array_Size> - $num_song_columns)
			end_time = ($<song_array> [ (<last_entry>) ])
			<whammy_time> = ($<song_array> [(<last_entry> + 1)])
			total_end_time2 = (<end_time> + <whammy_time>)
		endif
	endif
	if NOT GotParam \{ total_end_time }
		total_end_time = <total_end_time2>
	else
		if (<total_end_time2> > <total_end_time>)
			total_end_time = <total_end_time2>
		endif
	endif
	return total_end_time = <total_end_time>
endscript

script get_song_end_time
	get_song_prefix song = <song>
	FormatText ChecksumName = song_expert '%s_song_expert' s = <song_prefix> AddToStringLookup
	FormatText ChecksumName = rhythm_expert '%s_song_rhythm_expert' s = <song_prefix> AddToStringLookup
	total_end_time = 2.0
	get_song_end_time_for_array total_end_time = <total_end_time> song_array = <song_expert>
	get_song_end_time_for_array total_end_time = <total_end_time> song_array = <rhythm_expert>
	get_song_struct song = <song>
	if StructureContains Structure = <song_struct> use_coop_notetracks
		FormatText ChecksumName = guitarcoop_expert '%s_song_guitarcoop_expert' s = <song_prefix> AddToStringLookup
		FormatText ChecksumName = rhythmcoop_expert '%s_song_rhythmcoop_expert' s = <song_prefix> AddToStringLookup
		get_song_end_time_for_array total_end_time = <total_end_time> song_array = <guitarcoop_expert>
		get_song_end_time_for_array total_end_time = <total_end_time> song_array = <rhythmcoop_expert>
	endif
	return total_end_time = <total_end_time>
endscript

script win_song
	if (<Player> = 1)
		Change \{ num_players_finished = 0 }
	endif
	song = <gem_array>
	GetArraySize $<song>
	if NOT (<array_Size> = 0)
		get_song_end_time song = ($current_song)
		end_s = ((<total_end_time> - <starttime>)/ 1000.0)
		Printf "Waiting %s seconds for song end marker." s = <end_s>
		if (<end_s> > 0)
			wait <end_s> seconds
		endif
	endif
	if ($current_num_players = 2)
		wait_on_player = 2
	else
		wait_on_player = 1
	endif
	if (<wait_on_player> = <Player>)
		if IsWinPort
			wait \{ 1.1 seconds }
		endif
		KillMovie \{ TextureSlot = 1 }
		preload_movie = 'Fret_Flames'
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			if ($player1_status.score > $player2_status.score)
				preload_movie = 'Player1_wins'
			elseif ($player2_status.score > $player1_status.score)
				preload_movie = 'Player2_wins'
			endif
		endif
		PreLoadMovie {
			movie = <preload_movie>
			TextureSlot = 1
			TexturePri = 70
			no_looping
			no_hold
		}
	endif
	Printf \{ "Waiting %s seconds for extra song win delay." s = $Song_Win_Delay }
	wait \{ $Song_Win_Delay seconds }
	Change num_players_finished = ($num_players_finished + 1)
	Printf "win_song finished %i %f" i = ($num_players_finished)f = ($current_num_players)
	if ($num_players_finished >= $current_num_players)
		if ($is_network_game)
			spawnscriptnow \{ online_end_song }
		else
			Printf \{ "Broadcasting song won event." }
			ExtendCRC song_won <player_text> out = Type
			BroadcastEvent Type = <Type>
		endif
	endif
endscript

script load_songqpak \{ async = 0 }
	if NOT (<song_name> = $current_song_qpak)
		unload_songqpak
		get_song_prefix song = <song_name>
		is_song_downloaded song_checksum = <song_name>
		if (<Download> = 1)
			FormatText textname = songqpak '%i_song.pak' i = <song_prefix>
		else
			FormatText textname = songqpak 'songs/%i_song.pak' i = <song_prefix>
		endif
		Printf "Loading Song q pak : %i" i = <songqpak>
		if NOT LoadPakAsync pak_name = <songqpak> Heap = heap_song no_vram async = <async>
			DownloadContentLost
			return
		endif
		Change current_song_qpak = <song_name>
		if GotParam \{ song_prefix }
			FormatText ChecksumName = song_setup '%s_setup' s = <song_prefix>
			if ScriptExists <song_setup>
				spawnscriptnow <song_setup>
			endif
		endif
	endif
endscript

script unload_songqpak
	if NOT ($current_song_qpak = None)
		get_song_prefix song = ($current_song_qpak)
		is_song_downloaded song_checksum = ($current_song_qpak)
		if (<Download> = 1)
			FormatText textname = songqpak '%i_song.pak' i = <song_prefix>
		else
			FormatText textname = songqpak 'songs/%i_song.pak' i = <song_prefix>
		endif
		Printf "UnLoading Song q pak : %i" i = <songqpak>
		UnLoadPak <songqpak>
		Change \{ current_song_qpak = None }
	endif
endscript
playing_song = 0

script start_gem_scroller \{starttime = 0 practice_intro = 0 training_mode = 0 endtime = 99999999 devil_finish_restart = 0 end_credits_restart = 0}
	if (<devil_finish_restart> = 1)
		Printf \{ "FINISH DEVIL RESTART" }
	else
		Change \{ devil_finish = 0 }
		if ($current_song = bossdevil)
			<starttime> = 0
		endif
	endif
	if (<end_credits_restart> = 1)
		Printf \{ "END CREDITS RESTART" }
	else
		if NOT ($current_song = rainingblood)
			Change \{ end_credits = 0 }
		endif
	endif
	Change \{ playing_song = 1 }
	mark_unsafe_for_shutdown
	dragonforce_hack_off
	Menu_Music_Off
	GuitarEvent_EnterVenue
	init_play_log
	load_songqpak song_name = <song_name> async = 1
	if IsWinPort
		WinPortGetPracticeModeOffsets
		Change default_practice_mode_geminput_offset = <pm_geminput_offset>
		Change default_practice_mode_pitchshift_offset_song = <pm_pitchshift_offset_song>
		Change default_practice_mode_pitchshift_offset_slow = <pm_pitchshift_offset_slow>
		Change default_practice_mode_pitchshift_offset_slower = <pm_pitchshift_offset_slower>
		Change default_practice_mode_pitchshift_offset_slowest = <pm_pitchshift_offset_slowest>
	else
		if IsXenon
			Change \{ default_gem_offset = $xenon_gem_offset }
			Change \{ default_input_offset = $xenon_input_offset }
			Change \{ default_drums_offset = $xenon_drums_offset }
			Change \{ default_practice_mode_geminput_offset = $xenon_practice_mode_geminput_offset }
			Change \{ default_practice_mode_pitchshift_offset_song = $xenon_practice_mode_pitchshift_offset_song }
			Change \{ default_practice_mode_pitchshift_offset_slow = $xenon_practice_mode_pitchshift_offset_slow }
			Change \{ default_practice_mode_pitchshift_offset_slower = $xenon_practice_mode_pitchshift_offset_slower }
			Change \{ default_practice_mode_pitchshift_offset_slowest = $xenon_practice_mode_pitchshift_offset_slowest }
		else
			if IsPS3
				Change \{ default_gem_offset = $ps3_gem_offset }
				Change \{ default_input_offset = $ps3_input_offset }
				Change \{ default_drums_offset = $ps3_drums_offset }
				Change \{ default_practice_mode_geminput_offset = $ps3_practice_mode_geminput_offset }
				Change \{ default_practice_mode_pitchshift_offset_song = $ps3_practice_mode_pitchshift_offset_song }
				Change \{ default_practice_mode_pitchshift_offset_slow = $ps3_practice_mode_pitchshift_offset_slow }
				Change \{ default_practice_mode_pitchshift_offset_slower = $ps3_practice_mode_pitchshift_offset_slower }
				Change \{ default_practice_mode_pitchshift_offset_slowest = $ps3_practice_mode_pitchshift_offset_slowest }
			else
				Change \{ default_gem_offset = $ps2_gem_offset }
				Change \{ default_input_offset = $ps2_input_offset }
				Change \{ default_drums_offset = $ps2_drums_offset }
				Change \{ default_practice_mode_geminput_offset = $ps2_practice_mode_geminput_offset }
				Change \{ default_practice_mode_pitchshift_offset_song = $ps2_practice_mode_pitchshift_offset_song }
				Change \{ default_practice_mode_pitchshift_offset_slow = $ps2_practice_mode_pitchshift_offset_slow }
				Change \{ default_practice_mode_pitchshift_offset_slower = $ps2_practice_mode_pitchshift_offset_slower }
				Change \{ default_practice_mode_pitchshift_offset_slowest = $ps2_practice_mode_pitchshift_offset_slowest }
			endif
		endif
	endif
	begin_singleplayer_game
	get_song_struct song = <song_name>
	if StructureContains Structure = <song_struct> boss
		<difficulty2> = <difficulty>
	endif
	Change current_song = <song_name>
	Change current_difficulty = <difficulty>
	Change current_difficulty2 = <difficulty2>
	Change current_starttime = <starttime>
	Change current_endtime = <endtime>
	Change \{ boss_play = 0 }
	Change \{ showing_raise_axe = 0 }
	Progression_SetProgressionNodeFlags
	get_song_struct song = <song_name>
	if StructureContains Structure = <song_struct> boss
		Change current_boss = (<song_struct>.boss)
		Change \{ boss_battle = 1 }
		Change \{ current_num_players = 2 }
		Change boss_oldcontroller = ($player2_status.controller)
		GetInputHandlerBotIndex \{ Player = 2 }
		Change StructureName = player2_status controller = <controller>
		if StructureContains \{ Structure = $current_boss name = character_profile }
			Profile = ($current_boss.character_profile)
			Change StructureName = player2_status character_id = <Profile>
			Change \{ StructureName = player2_status outfit = 1 }
			Change \{ StructureName = player2_status style = 1 }
		endif
		Printf \{ channel = log "Starting bot for boss" }
	else
		if (($player2_status.bot_play = 1)|| ($new_net_logic))
			Change boss_oldcontroller = ($player2_status.controller)
			GetInputHandlerBotIndex \{ Player = 2 }
			Change StructureName = player2_status controller = <controller>
			Printf \{ channel = log "Starting bot for player 2" }
		endif
	endif
	if ($player1_status.bot_play = 1)
		GetInputHandlerBotIndex \{ Player = 1 }
		Change StructureName = player1_status controller = <controller>
		Printf \{ channel = log "Starting bot for player 1" }
	endif
	if ($game_mode = p2_battle)
		Printf \{ "Initiating Battlemode" }
		battlemode_init
	endif
	if ($boss_battle = 1)
		Printf \{ "Initiating BossBattle" }
		bossbattle_init
	endif
	if ($new_net_logic)
		new_net_logic_init
	endif
	Printf \{ "-------------------------------------" }
	Printf \{ "-------------------------------------" }
	Printf \{ "-------------------------------------" }
	Printf \{ "Now playing %s %d" s = $current_song d = $current_difficulty }
	Printf \{ "-------------------------------------" }
	Printf \{ "-------------------------------------" }
	Printf \{ "-------------------------------------" }
	song_start_time = <starttime>
	call_startup_scripts <...>
	setup_bg_viewport
	create_cameracuts <...>
	starttimeafterintro = <starttime>
	Printf "Current Transition = %s" s = ($current_transition)
	if ($current_transition = None)
		Change \{ current_transition = fastintro }
	endif
	Transition_GetTime Type = ($current_transition)
	starttime = (<starttime> - <transition_time>)
	setslomo \{ 0.001 }
	reset_song_time starttime = <starttime>
	if NOT ($use_character_debug_cam = 1)
	endif
	create_movie_viewport
	create_crowd_models
	crowd_create_lighters
	Crowd_StageDiver_Hide
	Change \{ StructureName = guitarist_info stance = Stance_A }
	Change \{ StructureName = guitarist_info next_stance = Stance_A }
	Change \{ StructureName = guitarist_info current_anim = Idle }
	Change \{ StructureName = guitarist_info cycle_anim = TRUE }
	Change \{ StructureName = guitarist_info next_anim = None }
	Change \{ StructureName = guitarist_info playing_missed_note = FALSE }
	Change \{ StructureName = guitarist_info waiting_for_cameracut = FALSE }
	Change \{ StructureName = bassist_info stance = Stance_A }
	Change \{ StructureName = bassist_info next_stance = Stance_A }
	Change \{ StructureName = bassist_info current_anim = Idle }
	Change \{ StructureName = bassist_info cycle_anim = TRUE }
	Change \{ StructureName = bassist_info next_anim = None }
	Change \{ StructureName = bassist_info playing_missed_note = FALSE }
	Change \{ StructureName = bassist_info waiting_for_cameracut = FALSE }
	Change \{ StructureName = vocalist_info stance = Stance_A }
	Change \{ StructureName = vocalist_info next_stance = Stance_A }
	Change \{ StructureName = vocalist_info current_anim = Idle }
	Change \{ StructureName = vocalist_info cycle_anim = TRUE }
	Change \{ StructureName = vocalist_info next_anim = None }
	Change \{ StructureName = drummer_info stance = Stance_A }
	Change \{ StructureName = drummer_info next_stance = Stance_A }
	Change \{ StructureName = drummer_info current_anim = Idle }
	Change \{ StructureName = drummer_info cycle_anim = TRUE }
	Change \{ StructureName = drummer_info next_anim = None }
	Change \{ StructureName = drummer_info TWIST = 0.0 }
	Change \{ StructureName = drummer_info desired_twist = 0.0 }
	Change \{ StructureName = drummer_info last_left_arm_note = 0 }
	Change \{ StructureName = drummer_info last_right_arm_note = 0 }
	if (<training_mode> = 0)
		if NOT create_band \{ async = 1 }
			DownloadContentLost
		endif
	endif
	if ($game_mode = training)
		practicemode_init
	endif
	preload_song song_name = <song_name> starttime = <song_start_time>
	calc_score = TRUE
	if NOT (<devil_finish_restart> = 1 || $end_credits = 1)
		if ($use_last_player_scores = 0)
			reset_score \{ player_status = player1_status }
		else
			Change \{ use_last_player_scores = 0 }
			<calc_score> = FALSE
		endif
	endif
	reset_score \{ player_status = player2_status }
	GetGlobalTags \{ user_options }
	SetArrayElement \{ ArrayName = currently_holding GlobalArray Index = 0 NewValue = 0 }
	SetArrayElement \{ ArrayName = currently_holding GlobalArray Index = 1 NewValue = 0 }
	Player = 1
	begin
		if (<Player> = 2)
			if GotParam \{ difficulty2 }
				<difficulty> = <difficulty2>
			endif
		endif
		FormatText ChecksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
		FormatText textname = player_text 'p%i' i = <Player> AddToStringLookup
		Change StructureName = <player_status> guitar_volume = 0
		UpdateGuitarVolume
		GetGlobalTags \{ user_options }
		if (<Player> = 1)
			Change StructureName = <player_status> lefthanded_gems = (<lefty_flip_p1>)
			Change StructureName = <player_status> lefthanded_button_ups = (<lefty_flip_p1>)
		else
			if ($is_network_game = 0)
				Change StructureName = <player_status> lefthanded_gems = (<lefty_flip_p2>)
				Change StructureName = <player_status> lefthanded_button_ups = (<lefty_flip_p2>)
			endif
		endif
		get_resting_whammy_position controller = ($<player_status>.controller)
		if GotParam \{ resting_whammy_position }
			Change StructureName = <player_status> resting_whammy_position = <resting_whammy_position>
		endif
		get_star_power_position controller = ($<player_status>.controller)
		if GotParam \{ star_power_position }
			Change StructureName = <player_status> star_tilt_threshold = <star_power_position>
		endif
		if ($tutorial_disable_hud = 0)
			setup_hud <...>
		endif
		if ($output_gpu_log = 1)
			TextOutputStart
		endif
		if NOT GotParam \{ no_score_update }
			SpawnScriptLater update_score_fast Params = { <...>	 }
		endif
		if (($is_network_game)& ($player1_status.highway_layout = solo_highway))
			SpawnScriptLater \{update_score_fast Params = { player_status = player2_status }}
		endif
		if (<training_mode> = 0)
			if NOT (<devil_finish_restart> = 1)
				crowd_reset <...>
			endif
		endif
		star_power_reset <...>
		difficulty_setup <...>
		setup_highway <...>
		if (<training_mode> = 0)
			reset_hud <...>
		endif
		spawnscriptnow gem_scroller Params = { <...>  }
		if ((<Player> = 1)|| ($new_net_logic)|| ($is_network_game = 0))
			spawnscriptnow button_checker Params = { <...>	}
		endif
		if NOT (($is_network_game)& (<Player> = 2))
			SpawnScriptLater check_for_star_power Params = { <...>	}
		endif
		if (<calc_score> = TRUE)
			calc_songscoreinfo player_status = <player_status>
		endif
		Player = (<Player> + 1)
	repeat $current_num_players
	GetPakManCurrent \{ map = Zones }
	if ($boss_battle = 1)
		if should_play_boss_intro
			if ($current_transition = boss)
				GH_SFX_Preload_Boss_Intro_Audio
			endif
		endif
	endif
	GH3_Set_Guitar_Verb_And_Echo_to_Dry
	Transition_Play Type = ($current_transition)
	Change \{ current_transition = None }
	Change \{ check_for_unplugged_controllers = 1 }
	wait \{ 1 GameFrame }
	if ($is_network_game)
		SyncAndLaunchNetGame
		begin
			if (($net_ready_to_start)|| ($player2_present = 0))
				ui_flow_manager_respond_to_action \{ action = net_begin_song }
				ui_print_gamertags \{pos1 = (365.0, 50.0) pos2 = (940.0, 50.0) dims = (310.0, 25.0) just1 = [ center top ] just2 = [ center top ] offscreen = 1}
				break
			endif
			wait \{ 1 GameFrame }
		repeat
	endif
	StopRendering
	destroy_loading_screen
	setslomo \{ $current_speedfactor }
	if (($player2_present = 0)& ($is_network_game = 1))
		if NOT ((ScreenElementExists Id = net_popup_container)|| (ScriptIsRunning create_connection_lost_dialog))
			spawnscriptnow \{ create_connection_lost_dialog }
		endif
	endif
	spawnscriptnow begin_song_after_intro Params = { starttimeafterintro = <starttimeafterintro> }
	if ($boss_battle = 1)
		if ($show_boss_helper_screen = 1)
			disable_bg_viewport
			if ScreenElementExists \{ Id = battlemode_container }
				battlemode_container ::SetProps \{ Alpha = 0 }
			endif
			GetPakManCurrent \{ map = Zones }
			if should_play_boss_intro
				spawnscriptnow \{ wait_and_show_boss_helper_after_intro }
			else
				SpawnScriptLater \{ show_boss_helper_now }
			endif
		else
			enable_bg_viewport
		endif
	endif
	mark_safe_for_shutdown
endscript
show_boss_helper_screen = 0

script wait_and_show_boss_helper_after_intro
	disable_pause
	Transition_Wait
	kill_gem_scroller
	ui_flow_manager_respond_to_action \{ action = battle_mode_helper }
	disable_pause
	Change \{ show_boss_helper_screen = 0 }
endscript

script show_boss_helper_now
	kill_gem_scroller
	ui_flow_manager_respond_to_action \{ action = battle_mode_helper }
	Change \{ show_boss_helper_screen = 0 }
endscript

script begin_song_after_intro
	begin
		GetSongTimeMS
		if (<Time> >= <starttimeafterintro>)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	begin_song
	if IsWinPort
		WinPortSongHighwaySync \{ sync = 1 }
	endif
endscript

script kill_gem_scroller \{ no_render = 0 }
	mark_unsafe_for_shutdown
	Printf \{ "kill_gem_scroller - Start" }
	if NOT GotParam \{ restarting }
		StopRendering
	endif
	SongUnLoadFSBIfDownloaded
	disable_highway_prepass
	Kill_StarPower_Camera \{ changecamera = 0 }
	Kill_Walk_Camera \{ changecamera = 0 }
	Change \{ StructureName = player1_status star_power_amount = 0 }
	Change \{ StructureName = player2_status star_power_amount = 0 }
	Kill_StarPower_StageFX player_text = ($player1_status.text)player_status = $player1_status IfEmpty = 0
	Kill_StarPower_StageFX player_text = ($player2_status.text)player_status = $player2_status IfEmpty = 0
	if ScreenElementExists \{ Id = starpower_container_leftp1 }
		DoScreenElementMorph \{ Id = starpower_container_leftp1 Alpha = 0 }
	endif
	if ScreenElementExists \{ Id = starpower_container_leftp2 }
		DoScreenElementMorph \{ Id = starpower_container_leftp2 Alpha = 0 }
	endif
	if ScreenElementExists \{ Id = starpower_container_rightp1 }
		DoScreenElementMorph \{ Id = starpower_container_rightp1 Alpha = 0 }
	endif
	if ScreenElementExists \{ Id = starpower_container_rightp2 }
		DoScreenElementMorph \{ Id = starpower_container_rightp2 Alpha = 0 }
	endif
	Change \{ showing_raise_axe = 0 }
	kill_debug_elements
	GuitarEvent_ExitVenue
	destroy_cameracuts
	practicemode_deinit
	notemap_deinit
	Destroy2DParticleSystem \{ Id = All }
	LaunchGemEvent \{ Event = kill_objects }
	destroy_credits_menu
	destroy_battle_alert_frames
	killspawnedscript \{ name = move_2d_elements_to_default }
	killspawnedscript \{ name = wait_and_play_you_rock_movie }
	killspawnedscript \{ name = update_score_fast }
	killspawnedscript \{ name = check_for_star_power }
	killspawnedscript \{ name = wait_for_inactive }
	killspawnedscript \{ name = pulsate_all_star_power_bulbs }
	killspawnedscript \{ name = pulsate_star_power_bulb }
	killspawnedscript \{ name = rock_meter_star_power_on }
	killspawnedscript \{ name = rock_meter_star_power_off }
	killspawnedscript \{ name = star_power_activate_and_drain }
	killspawnedscript \{ name = hud_activated_star_power }
	killspawnedscript \{ name = hud_move_note_scorebar }
	killspawnedscript \{ name = hud_flash_red_bg_p1 }
	killspawnedscript \{ name = hud_flash_red_bg_p2 }
	killspawnedscript \{ name = hud_flash_red_bg_kill }
	killspawnedscript \{ name = hud_lightning_alert }
	killspawnedscript \{ name = hud_show_note_streak_combo }
	killspawnedscript \{ name = highway_pulse_multiplier_loss }
	Player = 1
	begin
		FormatText ChecksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
		FormatText textname = player_text 'p%i' i = <Player> AddToStringLookup
		Change StructureName = <player_status> star_power_used = 0
		GuitarEvent_KillSong <...>
		destroy_hud <...>
		destroy_highway <...>
		battlemode_deinit <...>
		bossbattle_deinit <...>
		faceoff_deinit <...>
		faceoff_volumes_deinit <...>
		Player = (<Player> + 1)
	repeat $max_num_players
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
	killspawnedscript \{ name = net_check_buttons }
	killspawnedscript \{ name = fretbar_update_tempo }
	killspawnedscript \{ name = fretbar_update_hammer_on_tolerance }
	killspawnedscript \{ name = move_whammy }
	killspawnedscript \{ name = create_fretbar }
	killspawnedscript \{ name = move_highway_2d }
	killspawnedscript \{ name = move_highway_prepass }
	killspawnedscript \{ name = GuitarEvent_PreFretbar }
	killspawnedscript \{ name = GuitarEvent_Fretbar }
	killspawnedscript \{ name = check_note_hold }
	killspawnedscript \{ name = net_check_note_hold }
	killspawnedscript \{ name = star_power_whammy }
	killspawnedscript \{ name = show_star_power_ready }
	killspawnedscript \{ name = hud_glowburst_alert }
	Change \{ star_power_ready_on_p1 = 0 }
	Change \{ star_power_ready_on_p2 = 0 }
	killspawnedscript \{ name = event_iterator }
	killspawnedscript \{ name = win_song }
	killspawnedscript \{ name = hand_note_iterator }
	killspawnedscript \{ name = kill_object_later }
	killspawnedscript \{ name = waitAndKillHighway }
	killspawnedscript \{ name = testlevel_debug }
	killspawnedscript \{ name = show_coop_raise_axe_for_starpower }
	killspawnedscript \{ name = net_whammy_pitch_shift }
	killspawnedscript \{ name = Crowd_AllPlayAnim }
	killspawnedscript \{ name = hud_activated_star_power_spawned }
	killspawnedscript \{ name = dispatch_player_state }
	killspawnedscript \{ name = network_events }
	killspawnedscript \{ name = online_win_song }
	new_net_logic_deinit
	destroy_net_popup
	destroy_gamertags
	LightShow_Shutdown
	Kill_LightShow_FX
	DestroyParticlesByGroupID \{ groupID = zoneparticles }
	Transition_KillAll
	killspawnedscript \{ name = GuitarEvent_SongFailed_Spawned }
	killspawnedscript \{ name = play_intro }
	killspawnedscript \{ name = begin_song_after_intro }
	hud_flash_red_bg_kill \{ Player = 1 }
	hud_flash_red_bg_kill \{ Player = 2 }
	Printf \{ "kill_gem_scroller - Killing Event Scripts" }
	killspawnedscript \{ Id = song_event_scripts }
	Printf \{ "kill_gem_scroller - Killing Event Scripts Finished" }
	killspawnedscript \{ Id = zone_scripts }
	GetPakManCurrentName \{ map = Zones }
	FormatText ChecksumName = zone_killsong '%s_KillSong' s = <pakname>
	if ScriptExists <zone_killsong>
		<zone_killsong>
	endif
	Destroy_AllWhammyFX
	LS_ResetVenueLights
	destroy_movie_viewport
	destroy_crowd_models
	destroy_bg_viewport
	destroy_intro
	destroy_band
	Change \{ StructureName = guitarist_info stance = Stance_FrontEnd }
	Change \{ StructureName = guitarist_info next_stance = Stance_FrontEnd }
	Change \{ StructureName = guitarist_info current_anim = Idle }
	Change \{ StructureName = guitarist_info cycle_anim = TRUE }
	Change \{ StructureName = guitarist_info next_anim = None }
	Change \{ StructureName = guitarist_info playing_missed_note = FALSE }
	Change \{ StructureName = bassist_info stance = Stance_FrontEnd }
	Change \{ StructureName = bassist_info next_stance = Stance_FrontEnd }
	Change \{ StructureName = bassist_info current_anim = Idle }
	Change \{ StructureName = bassist_info cycle_anim = TRUE }
	Change \{ StructureName = bassist_info next_anim = None }
	Change \{ StructureName = bassist_info playing_missed_note = FALSE }
	destroy_debug_measure_text
	kill_character_scripts
	Change \{ check_for_unplugged_controllers = 0 }
	shut_down_practice_mode
	destroy_menu \{ menu_id = you_rock_container }
	KillMovie \{ TextureSlot = 1 }
	Printf \{ "kill_gem_scroller - waiting for dead objects" }
	wait \{ 2 gameframes }
	Printf \{ "kill_gem_scroller - waiting for dead objects End" }
	end_song
	if NOT (<no_render> = 1)
		if ($shutdown_game_for_signin_change_flag = 0)
			StartRendering
		endif
	endif
	Printf \{ "kill_gem_scroller - End" }
	mark_safe_for_shutdown
	Change \{ playing_song = 0 }
endscript

script restart_gem_scroller \{ no_render = 0 }
	mark_unsafe_for_shutdown
	disable_pause
	if GotParam \{ replay }
		Change \{ input_mode = Play }
		ReadDataBuffer name = replay FileName = <replay>
		DataBufferGetChecksum \{ name = replay }
		<song_name> = <checksum>
		DataBufferGetChecksum \{ name = replay }
		Change current_transition = <checksum>
		DataBufferGetInt \{ name = replay }
		if (<int> > 0)
			Change current_num_players = <int>
			DataBufferGetInt \{ name = replay }
			Change StructureName = player1_status controller = <int>
			DataBufferGetInt \{ name = replay }
			Change StructureName = player2_status controller = <int>
		else
			Change \{ current_num_players = 1 }
			DataBufferGetInt \{ name = replay }
			DataBufferGetInt \{ name = replay }
			Change \{ StructureName = player1_status controller = -1 }
			Change \{ StructureName = player2_status controller = -1 }
		endif
		DataBufferGetChecksum \{ name = replay bytes = 16 }
		<difficulty> = <checksum>
		DataBufferGetChecksum \{ name = replay bytes = 16 }
		<difficulty2> = <checksum>
		DataBufferGetInt \{ name = replay }
		<seed1> = <int>
		DataBufferGetInt \{ name = replay }
		<seed2> = <int>
		DataBufferGetInt \{ name = replay }
		<seed3> = <int>
		DataBufferGetInt \{ name = replay }
		<seed4> = <int>
		DataBufferGetInt \{ name = replay }
		<seed5> = <int>
		DataBufferGetInt \{ name = replay }
		<seed6> = <int>
		SetRandomSeeds seed1 = <seed1> seed2 = <seed2> seed3 = <seed3> seed4 = <seed4> seed5 = <seed5> seed6 = <seed6>
		Change \{ replay_suspend = 1 }
	else
		Change \{ input_mode = record }
	endif
	PauseGame
	LaunchEvent \{ Type = unfocus Target = root_window }
	Printf "Starting new song %s on %l" s = <song_name> l = <difficulty>
	kill_gem_scroller no_render = <no_render> restarting
	start_gem_scroller <...>
	Change \{ check_for_unplugged_controllers = 1 }
	UnBindGuitarControllerStatus
	LaunchEvent \{ Type = Focus Target = root_window }
	gh3_start_pressed
endscript

script reset_song_time \{ starttime = 0 }
	Change current_deltatime = (1.0 / 60.0)
	Change current_time = (<starttime> / 1000.0)
	if ($input_mode = Play)
		Change \{ replay_suspend = 0 }
	endif
	ResetSongTimer starttime = (<starttime> / 1000.0)
endscript

script fill_input_array
	FillInputArray <...>
endscript

script create_gem
	Create2DGem <...>
endscript

script gem_iterator \{ song_name = test difficulty = easy array_type = "song" Player = 1 }
	get_difficulty_text_nl difficulty = <difficulty>
	spawnscriptnow gem_array_events Params = {<...> difficulty_text_nl = <difficulty_text_nl>}
	if GotParam \{ use_input_array }
		spawnscriptnow gem_array_stepper Params = { <...>  }
	else
		spawnscriptnow gem_array_stepper Params = {<...> difficulty = easy difficulty_text_nl = 'easy'}
		spawnscriptnow gem_array_stepper Params = {<...> difficulty = medium difficulty_text_nl = 'medium'}
		spawnscriptnow gem_array_stepper Params = {<...> difficulty = hard difficulty_text_nl = 'hard'}
		spawnscriptnow gem_array_stepper Params = {<...> difficulty = expert difficulty_text_nl = 'expert'}
	endif
endscript

script gem_array_events
	Printf "Changing event receivers... %i %d" i = <iterator_text> d = <difficulty_text_nl>
	ClearEventHandlerGroup \{ iterator_group }
	ExtendCRC gem_step_event <player_text> out = Id
	ExtendCRC <Id> <iterator_text> out = Id
	ExtendCRC <Id> <difficulty_text_nl> out = Id
	SetEventHandler response = call_script Event = <Id> Scr = gem_step Params = { <...>	 }Group = iterator_group
	ExtendCRC gem_step_end <player_text> out = Id
	ExtendCRC <Id> <iterator_text> out = Id
	ExtendCRC <Id> <difficulty_text_nl> out = Id
	SetEventHandler response = call_script Event = <Id> Scr = gem_step_end Params = { <...>	 }Group = iterator_group
	if NOT GotParam \{ use_input_array }
		ExtendCRC change_difficulty <player_text> out = Id
		SetEventHandler response = switch_script Event = <Id> Scr = gem_array_events Params = { <...>  }Group = iterator_group
	endif
	Block
endscript

script gem_step
	GemStep
endscript

script gem_step_end
endscript

script gem_array_stepper
	gem_array_stepper_CFunc_Setup
	begin
		if gem_array_stepper_CFunc
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	gem_array_stepper_CFunc_Cleanup
endscript

script default_startup
endscript

script call_startup_scripts
	Change \{ current_startup_script = default_startup }
	Change \{ time_gem_offset = $default_gem_offset }
	GetGlobalTags \{ user_options }
	Change \{ time_input_offset = $default_input_offset }
	get_song_struct song = <song_name>
	if StructureContains Structure = <song_struct> name = startup_Script
		Change current_startup_script = (<song_struct>.startup_Script)
	endif
	if StructureContains Structure = <song_struct> name = exit_Script
		Change current_exit_script = (<song_struct>.exit_Script)
	else
	endif
	if StructureContains Structure = <song_struct> name = gem_offset
		Change time_gem_offset = ($time_gem_offset + (<song_struct>.gem_offset))
	endif
	if StructureContains Structure = <song_struct> name = input_offset
		Change time_input_offset = ($time_input_offset + (<song_struct>.input_offset))
	endif
	if StructureContains Structure = <song_struct> name = hammer_on_measure_scale
		Change hammer_on_measure_scale = (<song_struct>.hammer_on_measure_scale)
	else
		Change \{ hammer_on_measure_scale = $default_hammer_on_measure_scale }
	endif
	if ($game_mode = training & $in_menu_choose_practice_section = 0 & $current_speedfactor != 1.0)
		if ($current_speedfactor >= 0.8)
			pitchshiftoffset = ($default_practice_mode_pitchshift_offset_slow)
		elseif ($current_speedfactor >= 0.6)
			pitchshiftoffset = ($default_practice_mode_pitchshift_offset_slower)
		else
			pitchshiftoffset = ($default_practice_mode_pitchshift_offset_slowest)
		endif
		Change time_gem_offset = ($time_gem_offset + <pitchshiftoffset> + $default_practice_mode_geminput_offset)
		Change time_input_offset = ($time_input_offset + <pitchshiftoffset> + $default_practice_mode_geminput_offset)
		Change default_drums_offset = ($default_drums_offset + <pitchshiftoffset> - $default_practice_mode_geminput_offset)
	endif
	spawnscriptnow ($current_startup_script)Params = { <...>  }
endscript

script kill_startup_script
	if NOT ($current_startup_script = nothing)
		killspawnedscript name = ($current_startup_script)
	endif
	if NOT ($current_exit_script = nothing)
		spawnscriptnow ($current_exit_script)Params = { <...>  }
	endif
endscript

script Load_Venue \{ block_scripts = 0 }
	GetPakManCurrentName \{ map = Zones }
	if GotParam \{ pakname }
		if (<pakname> = (($LevelZones.$current_level).name))
			Transitions_ResetZone
			return
		else
			ResetWaypoints
			SetPakManCurrentBlock \{ map = Zones pak = None }
		endif
	else
		ResetWaypoints
	endif
	ResetPulseEvents
	FormatText textname = FileName '%s.pak' s = (($LevelZones.$current_level).name)
	GetContentFolderIndexFromFile <FileName>
	if (<device> = content)
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			DownloadContentLost
			return
		endif
	endif
	if NOT SetPakManCurrentBlock map = Zones pak = (($LevelZones.$current_level).zone)block_scripts = <block_scripts>
		DownloadContentLost
		return
	endif
	if (<device> = content)
		Downloads_CloseContentFolder content_index = <content_index>
	endif
	GH3_Change_crowd_reverb_settings_by_Venue
endscript

script start_song \{ device_num = 0 practice_intro = 0 endtime = 999999999 }
	mark_unsafe_for_shutdown
	set_rich_presence_game_mode
	MassiveInit \{ sku = 'atvi_guitar_hero_3_pc_na' startZone = 'GlobalZone' }
	Load_Venue
	Transition_SelectTransition practice_intro = <practice_intro>
	if NOT (($game_mode = p2_faceoff)|| ($game_mode = p2_pro_faceoff)|| ($game_mode = p2_coop)|| ($game_mode = p2_battle)|| ($game_mode = p2_career))
		Change player1_device = (<device_num>)
		Change StructureName = player1_status controller = (<device_num>)
	else
		Change \{ StructureName = player1_status controller = $player1_device }
		Change \{ StructureName = player2_status controller = $player2_device }
		Printf "Pads assigned: Player 1: %p Player 2: %q" p = ($player1_status.controller)q = ($player2_status.controller)
	endif
	Change \{ battle_sudden_death = 0 }
	if ($game_mode = p2_battle)
		Change \{save_current_powerups_p1 = [ 0 0 0 ]}
		Change \{save_current_powerups_p2 = [ 0 0 0 ]}
		Change \{ StructureName = player1_status save_num_powerups = 0 }
		Change \{ StructureName = player2_status save_num_powerups = 0 }
		Change \{ StructureName = player1_status save_health = 0.0 }
		Change \{ StructureName = player2_status save_health = 0.0 }
	endif
	if NOT GotParam \{ starttime }
		if GotParam \{ uselaststarttime }
			starttime = ($current_starttime)
		else
			starttime = 0
		endif
	endif
	if NOT GotParam \{ difficulty2 }
		difficulty2 = ($current_difficulty2)
	endif
	if NOT GotParam \{ difficulty }
		difficulty = ($current_difficulty)
	endif
	if NOT GotParam \{ song_name }
		song_name = ($current_song)
	endif
	restart_gem_scroller song_name = <song_name> difficulty = <difficulty> difficulty2 = <difficulty2> starttime = <starttime> practice_intro = <practice_intro> endtime = <endtime>
	Change \{ check_for_unplugged_controllers = 1 }
endscript

script restart_song \{ practice_intro = 0 sudden_death = 0 }
	kill_start_key_binding
	create_loading_screen \{ mode = restart_song }
	if ($is_network_game = 0)
		xenon_singleplayer_session_init
	endif
	if (<sudden_death> = 0)
		Change \{ battle_sudden_death = 0 }
	endif
	if ($game_mode = p2_battle)
		if NOT (<sudden_death> = 1)
			Change \{save_current_powerups_p1 = [ 0 0 0 ]}
			Change \{save_current_powerups_p2 = [ 0 0 0 ]}
			Change \{ StructureName = player1_status save_num_powerups = 0 }
			Change \{ StructureName = player2_status save_num_powerups = 0 }
			Change \{ StructureName = player1_status save_health = 0.0 }
			Change \{ StructureName = player2_status save_health = 0.0 }
		endif
	endif
	if ($current_song = bosstom || $current_song = bossslash)
		Change boss_wuss_out = ($boss_wuss_out + 1)
		Printf \{ channel = trchen "Boss Wuss Out %s" s = $boss_wuss_out }
	endif
	StopSoundEvent \{ Crowd_Fail_Song_SFX }
	if (<practice_intro> = 0)
		Change \{ current_transition = fastintro }
		if ($coop_dlc_active = 0)
			get_progression_globals game_mode = ($game_mode)use_current_tab = 1
			Tier = ($setlist_selection_tier)
			if ($game_mode = p1_career || $game_mode = p2_career)
				if Progression_IsEncoreSong tier_global = <tier_global> Tier = <Tier> song = ($current_song)
					Change \{ current_transition = restartencore }
				endif
			endif
			if Progression_IsBossSong tier_global = <tier_global> Tier = <Tier> song = ($current_song)
				Change \{ current_transition = restartboss }
			endif
		endif
	endif
	restart_gem_scroller song_name = ($current_song)difficulty = ($current_difficulty)difficulty2 = ($current_difficulty2)starttime = ($current_starttime)practice_intro = <practice_intro> endtime = <endtime>
endscript

script kill_object_later
	begin
		if ScreenElementExists Id = <gem_id>
			GetScreenElementPosition Id = <gem_id> local
			py = (<ScreenElementPos>.(0.0, 1.0))
			if (<py> >= $highway_playline)
				DestroyGem name = <gem_id>
				break
			endif
			wait \{ 1 GameFrame }
		else
			break
		endif
	repeat
endscript

script debug_flash_star
	begin
		LaunchGemEvent \{ Event = debug_star }
		wait \{ 8 gameframes }
		LaunchGemEvent \{ Event = debug_gem }
		wait \{ 8 gameframes }
	repeat
endscript
