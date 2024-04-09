guitarist_info = {
	anim_set = judy_animations
	stance = Stance_FrontEnd
	finger_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = Normal
	guitar_model = None
	playing_missed_note = FALSE
	last_strum_length = Short
	current_anim = Idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = FALSE
	next_stance = Stance_FrontEnd
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	waiting_for_cameracut = FALSE
	allow_movement = TRUE
	target_node = None
	facial_anim = Idle
	Scale = 1.0
}
bassist_info = {
	anim_set = axel_animations
	stance = Stance_FrontEnd
	finger_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = Normal
	bass_model = None
	playing_missed_note = FALSE
	last_strum_length = Short
	current_anim = Idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = FALSE
	next_stance = Stance_FrontEnd
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	waiting_for_cameracut = FALSE
	allow_movement = TRUE
	target_node = None
	facial_anim = Idle
	Scale = 1.0
}
vocalist_info = {
	anim_set = vocalist_animations
	stance = Stance_A
	current_anim = Idle
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = FALSE
	next_stance = Stance_A
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	allow_movement = TRUE
	target_node = None
	facial_anim = Idle
	Scale = 1.0
}
drummer_info = {
	TWIST = 0.0
	desired_twist = 0.0
	anim_set = drummer_animations
	stance = Stance_A
	current_anim = Idle
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = FALSE
	next_stance = Stance_A
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	allow_movement = TRUE
	target_node = None
	facial_anim = Idle
	last_left_arm_note = 0
	last_right_arm_note = 0
	Scale = 1.0
}
current_bass_model = None

script create_band \{ async = 0 }
	if ($disable_band = 1)
		return
	endif
	GetPakManCurrent \{ map = Zones }
	if (<pak> = Z_Credits)
		if NOT create_guitarist async = <async>
			return \{ FALSE }
		endif
		unload_character \{ name = BASSIST }
		unload_character \{ name = VOCALIST }
		unload_character \{ name = Drummer }
		set_bandvisible
		return \{ TRUE }
	endif
	if ($current_num_players = 1)
		if NOT create_guitarist async = <async>
			return \{ FALSE }
		endif
		if NOT create_drummer async = <async>
			return \{ FALSE }
		endif
		get_song_struct song = ($current_song)
		if StructureContains Structure = <song_struct> name = BASSIST
			bassist_profile = (<song_struct>.BASSIST)
			if NOT create_bassist profile_name = <bassist_profile> async = <async>
				return \{ FALSE }
			endif
		else
			if NOT create_bassist async = <async>
				return \{ FALSE }
			endif
		endif
		if StructureContains Structure = <song_struct> name = singer
			if (<song_struct>.singer = None)
				if CompositeObjectExists \{ name = VOCALIST }
					unload_character \{ name = VOCALIST }
				endif
			else
				if (<pak> = Z_Wikker || <pak> = Z_Budokan || <pak> = Z_Hell)
					if (<song_struct>.singer = female)
						singer_profile = 'singer_female_alt'
					elseif (<song_struct>.singer = bret)
						singer_profile = 'singer_bret_alt'
					else
						singer_profile = 'singer_alt'
					endif
				else
					if (<song_struct>.singer = female)
						singer_profile = 'singer_female'
					elseif (<song_struct>.singer = bret)
						singer_profile = 'singer_bret'
					else
						singer_profile = 'singer'
					endif
				endif
				if ($Cheat_BretMichaels = 1)
					if NOT (<song_struct>.singer = female)
						singer_profile = 'singer_bret'
					endif
				endif
				if NOT create_vocalist profile_name = <singer_profile> async = <async>
					return \{ FALSE }
				endif
			endif
		else
			if ($Cheat_BretMichaels = 1)
				singer_profile = 'singer_bret'
			else
				singer_profile = 'singer'
			endif
			if NOT create_vocalist profile_name = <singer_profile> async = <async>
				return \{ FALSE }
			endif
		endif
	else
		unload_character \{ name = VOCALIST }
		if NOT create_guitarist name = GUITARIST async = <async>
			return \{ FALSE }
		endif
		if NOT create_guitarist name = BASSIST async = <async>
			return \{ FALSE }
		endif
		if NOT create_drummer async = <async>
			return \{ FALSE }
		endif
	endif
	set_bandvisible
	return \{ TRUE }
endscript

script create_guitarist_profile
	player2_is_lead = FALSE
	if ($current_num_players = 2)
		if (($game_mode = p2_career)|| ($game_mode = p2_coop))
			if NOT ($player1_status.part = guitar)
				player2_is_lead = TRUE
			endif
		endif
	endif
	if ((<name> = GUITARIST & <player2_is_lead> = FALSE)|| (<name> = BASSIST & <player2_is_lead> = TRUE))
		player_status = player1_status
	else
		player_status = player2_status
	endif
	found = 0
	find_profile_by_id Id = ($<player_status>.character_id)
	<found> = 1
	if (<found> = 1)
		if GotParam \{ no_guitar }
			<instrument_id> = None
		else
			if ($boss_battle = 1 & <name> = BASSIST)
				get_musician_profile_struct Index = <Index>
				<instrument_id> = (<profile_struct>.musician_instrument.desc_id)
			else
				<instrument_id> = ($<player_status>.instrument_id)
			endif
		endif
		if ($Cheat_AirGuitar = 1)
			if NOT ($is_network_game)
				<instrument_id> = None
			endif
		endif
		outfit = ($<player_status>.outfit)
		style = ($<player_status>.style)
		get_musician_profile_struct Index = <Index>
		character_name = (<profile_struct>.name)
		FormatText ChecksumName = body_id 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = <style>
		Profile = {<profile_struct>
			musician_instrument = { desc_id = <instrument_id> }
			musician_body = { desc_id = <body_id> }
			download_musician_instrument = { desc_id = <instrument_id> }
			download_musician_body = { desc_id = <body_id> }
			outfit = <outfit>}
	endif
	return <...>
endscript

script create_guitarist \{name = GUITARIST profile_name = 'judy' instrument_id = Instrument_Les_Paul_Black async = 0 animpak = 1}
	ExtendCRC <name> '_Info' out = info_struct
	Printf channel = AnimInfo "creating guitarist - %a ........." a = <name>
	create_guitarist_profile <...>
	character_id = ($<player_status>.character_id)
	if (<found> = 1)
		if GotParam \{ node_name }
			waypoint_id = <node_name>
		else
			get_start_node_id member = <name>
		endif
		if DoesWayPointExist name = <waypoint_id>
			Change StructureName = <info_struct> target_node = <waypoint_id>
		else
			Printf "unable to find starting position for %a ........" a = <name>
		endif
		ClearEventHandlerGroup \{ hand_events }
		if NOT create_band_member name = <name> Profile = <Profile> start_node = <waypoint_id> <...>
			return \{ FALSE }
		endif
		find_profile_by_id Id = <character_id>
		FormatText textname = highway_name 'Guitarist_%n_Outfit%o_Style%s' n = (<profile_struct>.name)o = <outfit> s = <style>
		AddToMaterialLibrary scene = <highway_name>
		FormatText ChecksumName = highway_material 'sys_%a_1_highway_sys_%a_1_highway' a = (<profile_struct>.name)
		Change StructureName = <player_status> highway_material = <highway_material>
		Change StructureName = <player_status> band_Member = <name>
		get_musician_profile_struct Index = <Index>
		Change StructureName = <info_struct> anim_set = (<profile_struct>.anim_set)
		Change StructureName = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		Change StructureName = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		Change StructureName = <info_struct> strum = (<profile_struct>.strum_anims)
		Change StructureName = <info_struct> allow_movement = TRUE
		Change StructureName = <info_struct> arms_disabled = 0
		Change StructureName = <info_struct> disable_arms = 0
		Change StructureName = <info_struct> next_stance = ($<info_struct>.stance)
		if StructureContains Structure = <profile_struct> name = Scale
			scale_x = ((<profile_struct>.Scale).(1.0, 0.0, 0.0))
			scale_y = ((<profile_struct>.Scale).(0.0, 1.0, 0.0))
			scale_z = ((<profile_struct>.Scale).(0.0, 0.0, 1.0))
			if ((<scale_x> != <scale_y>)|| (<scale_y> != <scale_z>))
				ScriptAssert \{ "Attempting to create a guitarist with a non-uniform scale!" }
			endif
			Printf channel = newdebug "found scale in character profile! %a ......." a = (<profile_struct>.Scale)
			Change StructureName = <info_struct> Scale = <scale_x>
		else
			Change StructureName = <info_struct> Scale = 1.0
		endif
		stance = ($<info_struct>.stance)
		Printf channel = AnimInfo "creating guitarist in stance %a ........" a = <stance>
		if (<stance> = Stance_FrontEnd || <stance> = Stance_FrontEnd_Guitar)
			Change StructureName = <info_struct> arms_disabled = 2
			Change StructureName = <info_struct> disable_arms = 2
			<name> ::hero_toggle_arms num_arms = 0 prev_num_arms = 2 blend_time = 0.0
		else
			<name> ::hero_toggle_arms num_arms = 1 prev_num_arms = 0 blend_time = 0.0
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($<info_struct>.strum)
		ExtendCRC <strum_type> '_Strums' out = strum_anims
		if NOT GotParam \{ no_strum }
			<name> ::hero_play_strum_anim Anim = ($<strum_anims>.no_strum_anim)
			<name> ::hero_play_fret_anim Anim = (<fret_anims>.track_123)
			<name> ::hero_play_finger_anim Anim = (<finger_anims>.track_none)
		endif
		if IsWinPort
			if NOT (<character_id> = Ripper)
				<name> ::Ragdoll_SetAccessoryBones accessory_bones = $Guitarist_accessory_bones
			endif
		else
			<name> ::Ragdoll_SetAccessoryBones accessory_bones = $Guitarist_accessory_bones
		endif
		<name> ::Obj_SwitchScript guitarist_idle
		<name> ::Obj_SpawnScriptNow facial_anim_loop
		if GotParam \{ no_anim }
			spawnscriptnow temp_hero_pause_script Params = { name = <name> }
		endif
		<name> ::Obj_ForceUpdate
	else
		Printf \{ "profile not found in create_guitarist! ........." }
	endif
	return \{ TRUE }
endscript

script temp_hero_pause_script
	wait \{ 1 gameframes }
	if <name> ::Anim_AnimNodeExists Id = BodyTimer
		<name> ::Anim_Command Target = BodyTimer Command = Timer_SetSpeed Params = { Speed = 0.0 }
	endif
endscript

script create_bassist \{ name = BASSIST profile_name = 'bassist' async = 0 }
	ExtendCRC <name> '_Info' out = info_struct
	Printf channel = AnimInfo "creating bassist - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if DoesWayPointExist name = <waypoint_id>
			GetWaypointPos name = <waypoint_id>
			Change StructureName = <info_struct> target_node = <waypoint_id>
		else
			Printf "unable to find starting position for %a ........" a = <name>
		endif
		get_musician_profile_struct Index = <Index>
		if ($current_bass_model = None)
			Profile = <profile_struct>
		else
			Profile = {
				<profile_struct>
				musician_instrument = {desc_id = ($current_bass_model)}
			}
		endif
		if NOT create_band_member name = <name> Profile = <Profile> start_node = <waypoint_id> <...>
			return \{ FALSE }
		endif
		get_musician_profile_struct Index = <Index>
		Change StructureName = <info_struct> anim_set = (<profile_struct>.anim_set)
		Change StructureName = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		Change StructureName = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		Change StructureName = <info_struct> strum = (<profile_struct>.strum_anims)
		Change StructureName = <info_struct> allow_movement = TRUE
		Change StructureName = <info_struct> arms_disabled = 0
		Change StructureName = <info_struct> disable_arms = 0
		if StructureContains Structure = <profile_struct> name = Scale
			scale_x = ((<profile_struct>.Scale)* (1.0, 0.0, 0.0))
			scale_y = ((<profile_struct>.Scale)* (0.0, 1.0, 0.0))
			scale_z = ((<profile_struct>.Scale)* (0.0, 0.0, 1.0))
			if ((<scale_x> != <scale_y>)|| (<scale_y> != <scale_z>))
				ScriptAssert \{ "Attempting to create a guitarist with a non-uniform scale!" }
			endif
			Printf channel = newdebug "found scale in character profile! %a ......." a = (<profile_struct>.Scale)
			Change StructureName = <info_struct> Scale = <scale_x>
		else
			Change StructureName = <info_struct> Scale = 1.0
		endif
		if GotParam \{ stance }
			Change StructureName = <info_struct> stance = <stance>
		else
			Change StructureName = <info_struct> stance = (<profile_struct>.stance)
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($bassist_info.strum)
		ExtendCRC <strum_type> '_Strums' out = strum_anims
		if NOT GotParam \{ no_strum }
			<name> ::hero_play_strum_anim Anim = ($<strum_anims>.no_strum_anim)
			<name> ::hero_play_fret_anim Anim = (<fret_anims>.track_106)
			<name> ::hero_play_finger_anim Anim = (<finger_anims>.track_none)
		endif
		<name> ::Ragdoll_SetAccessoryBones accessory_bones = $Guitarist_accessory_bones
		<name> ::Obj_SwitchScript guitarist_idle
		<name> ::Obj_SpawnScriptNow facial_anim_loop
	else
		Printf \{ "profile not found in create_bassist! ........." }
	endif
	return \{ TRUE }
endscript

script create_vocalist \{ name = VOCALIST profile_name = 'singer' async = 0 }
	ExtendCRC <name> '_Info' out = info_struct
	Printf "creating vocalist - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if DoesWayPointExist name = <waypoint_id>
			GetWaypointPos name = <waypoint_id>
			Change StructureName = <info_struct> target_node = <waypoint_id>
		else
			Printf "unable to find starting position for %a ........" a = <name>
		endif
		get_musician_profile_struct Index = <Index>
		if NOT create_band_member name = <name> Profile = <profile_struct> start_node = <waypoint_id> <...>
			return \{ FALSE }
		endif
		Change StructureName = <info_struct> anim_set = (<profile_struct>.anim_set)
		Change StructureName = <info_struct> allow_movement = TRUE
		if GotParam \{ stance }
			Change StructureName = <info_struct> stance = <stance>
		else
			Change StructureName = <info_struct> stance = (<profile_struct>.stance)
		endif
		<name> ::Ragdoll_SetAccessoryBones accessory_bones = $Guitarist_accessory_bones
		<name> ::Obj_SwitchScript bandmember_idle
		<name> ::Obj_SpawnScriptNow facial_anim_loop
	else
		Printf \{ "profile not found in create_vocalist! ........." }
	endif
	return \{ TRUE }
endscript

script create_drummer \{ name = Drummer profile_name = 'drummer' async = 0 }
	ExtendCRC <name> '_Info' out = info_struct
	Printf "creating drummer - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if DoesWayPointExist name = <waypoint_id>
			GetWaypointPos name = <waypoint_id>
			Change StructureName = <info_struct> target_node = <waypoint_id>
		else
			Printf "unable to find starting position for %a ........" a = <name>
		endif
		get_musician_profile_struct Index = <Index>
		if NOT create_band_member name = <name> Profile = <profile_struct> start_node = <waypoint_id> <...>
			return \{ FALSE }
		endif
		Change StructureName = <info_struct> anim_set = (<profile_struct>.anim_set)
		Change StructureName = <info_struct> allow_movement = TRUE
		if GotParam \{ stance }
			Change StructureName = <info_struct> stance = <stance>
		else
			Change StructureName = <info_struct> stance = (<profile_struct>.stance)
		endif
		<name> ::Ragdoll_SetAccessoryBones accessory_bones = $Guitarist_accessory_bones
		<name> ::Obj_KillSpawnedScript name = drummer_autotwist
		<name> ::Obj_SpawnScriptNow drummer_autotwist
		<name> ::Obj_SwitchScript bandmember_idle
		<name> ::Obj_SpawnScriptNow facial_anim_loop
		Change \{ StructureName = drummer_info last_left_arm_note = 0 }
		Change \{ StructureName = drummer_info last_right_arm_note = 0 }
	else
		Printf \{ "profile not found in create_drummer! ........." }
	endif
	return \{ TRUE }
endscript

script drummer_autotwist
	hero_play_anim \{ Tree = $drummer_twist_branch Target = BodyTwist Anim = Test_Drum_BodyTwist_D BlendDuration = 0.0 }
	change_rate = 0.18
	begin
		TWIST = ($drummer_info.TWIST)
		compute_desired_drummer_twist
		diff = (<desired_twist> - <TWIST>)
		if (<TWIST> < <desired_twist>)
			if (<diff> < $drummer_twist_rate)
				TWIST = <desired_twist>
			else
				TWIST = (<TWIST> + $drummer_twist_rate)
			endif
		elseif (<TWIST> > <desired_twist>)
			if ((<diff> * -1)< $drummer_twist_rate)
				TWIST = <desired_twist>
			else
				TWIST = (<TWIST> - $drummer_twist_rate)
			endif
		endif
		drummer_twist Strength = <TWIST>
		Change StructureName = drummer_info TWIST = <TWIST>
		wait \{ 1 GameFrame }
	repeat
endscript

script unload_character
	destroy_band_member name = <name>
endscript

script unload_band
	destroy_band_member \{ name = GUITARIST }
	destroy_band_member \{ name = BASSIST }
	destroy_band_member \{ name = Drummer }
	destroy_band_member \{ name = VOCALIST }
	force_unload_all_character_paks
endscript

script hero_play_random_anim \{ BlendDuration = 0.2 }
	GetArraySize <anims>
	GetRandomValue name = newindex Integer a = 0 b = (<array_Size> - 1)
	anim_name = (<anims> [ <newindex> ])
	if GotParam \{ Cycle }
		hero_play_anim Anim = <anim_name> BlendDuration = <BlendDuration> Cycle
	else
		hero_play_anim Anim = <anim_name> BlendDuration = <BlendDuration>
	endif
endscript

script should_display_debug_info
	Obj_GetID
	display_info = FALSE
	switch (<ObjID>)
		case GUITARIST
			if ($display_guitarist_anim_info = TRUE)
				display_info = TRUE
			endif
		case BASSIST
			if ($display_bassist_anim_info = TRUE)
				display_info = TRUE
			endif
		case VOCALIST
			if ($display_vocalist_anim_info = TRUE)
				display_info = TRUE
			endif
		case Drummer
			if ($display_drummer_anim_info = TRUE)
				display_info = TRUE
			endif
	endswitch
	return <display_info>
endscript

script hero_play_random_anims
	count = 0
	begin
		hero_play_random_anim anims = <anim_array>
		hero_wait_until_anim_finished
		count = (<count> + 1)
		if GotParam \{ repeat_count }
			if (<count> = <repeat_count>)
				break
			endif
		endif
	repeat
endscript

script hero_play_adjusting_random_anims \{ blend_time = 0.2 }
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	count = 0
	begin
		Anim = ($<info_struct>.current_anim)
		Cycle = ($<info_struct>.cycle_anim)
		repeat_count = ($<info_struct>.anim_repeat_count)
		if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
			if (($<info_struct>.disable_arms)= 2)
				if ($<info_struct>.arms_disabled != 2)
					hero_toggle_arms num_arms = 0 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
					Change StructureName = <info_struct> arms_disabled = 2
				endif
			elseif (($<info_struct>.disable_arms)= 1)
				if ($<info_struct>.arms_disabled != 1)
					hero_toggle_arms num_arms = 1 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
					Change StructureName = <info_struct> arms_disabled = 1
				endif
			else
				if ($<info_struct>.arms_disabled != 0)
					hero_toggle_arms num_arms = 2 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
					Change StructureName = <info_struct> arms_disabled = 0
				endif
			endif
		endif
		if (<ObjID> = GUITARIST)
			if NOT (<Anim> = Idle)
				Change StructureName = <info_struct> facial_anim = <Anim>
			endif
		endif
		if hero_play_tempo_anim_cfunc Anim = <Anim> BlendDuration = <blend_time>
			hero_play_anim Anim = <anim_to_run> BlendDuration = <blend_duration> UseMotionExtraction = <use_motion_extraction>
			hero_wait_until_anim_finished
		else
			wait \{ 1 GameFrame }
		endif
		display_debug_info = FALSE
		if (should_display_debug_info)
			display_debug_info = TRUE
		endif
		anim_set = ($<info_struct>.anim_set)
		stance = ($<info_struct>.stance)
		next_stance = ($<info_struct>.next_stance)
		stance_changed = FALSE
		if NOT (<next_stance> = <stance>)
			if (<display_debug_info> = TRUE)
				Printf channel = AnimInfo "%c stance now changing from %a to %b............" c = <ObjID> a = <stance> b = <next_stance>
			endif
			if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <stance> new_stance = <next_stance>
				hero_play_anim Anim = <anim_to_run>
				hero_wait_until_anim_finished
			endif
			Change StructureName = <info_struct> stance = <next_stance>
			stance = <next_stance>
			stance_changed = TRUE
		endif
		next_anim = ($<info_struct>.next_anim)
		if (<next_anim> = None & <stance_changed> = FALSE)
			if (<Cycle> = FALSE)
				repeat_count = (<repeat_count> - 1)
				if (<repeat_count> < 1)
					if (<display_debug_info> = TRUE)
						Printf channel = AnimInfo "%a has finished playing anim %b " a = <ObjID> b = <Anim>
					endif
					repeat_count = 0
				endif
			endif
			Change StructureName = <info_struct> anim_repeat_count = <repeat_count>
			if (<Cycle> = FALSE & <repeat_count> <= 0)
				Change StructureName = <info_struct> current_anim = Idle
				Change StructureName = <info_struct> cycle_anim = TRUE
				if (<next_stance> = Intro || <next_stance> = Intro_SmStg || <next_stance> = Stance_FrontEnd || <next_stance> = Stance_FrontEnd_Guitar)
				else
					Change StructureName = <info_struct> disable_arms = 0
				endif
				blend_time = 0.2
				if (<display_debug_info> = TRUE)
					Printf channel = AnimInfo "%a has no anims in queue...returning to idle" a = <ObjID>
				endif
			else
				blend_time = 0.2
				if (<display_debug_info> = TRUE)
					if (<Cycle> = FALSE)
						Printf channel = AnimInfo "%a repeating the %c anim (%b more times)" c = <Anim> a = <ObjID> b = <repeat_count>
					else
						Printf channel = AnimInfo "%a %b anim is cycling" a = <ObjID> b = <Anim>
					endif
				endif
			endif
		else
			repeat_count = ($<info_struct>.next_anim_repeat_count)
			if ((<display_debug_info> = TRUE)& (<next_anim> != None))
				if (<repeat_count> > 1)
					Printf channel = AnimInfo "%a will play %b anim %c times ......." a = <ObjID> b = <next_anim> c = <repeat_count>
				else
				endif
			endif
			if (<next_anim> = None)
				if (<display_debug_info> = TRUE)
					Printf channel = AnimInfo "%a has no anims in queue...returning to idle" a = <ObjID>
				endif
				next_anim = Idle
				cycle_next_anim = TRUE
			else
				cycle_next_anim = ($<info_struct>.cycle_next_anim)
			endif
			if (<next_stance> = Intro || <next_stance> = Intro_SmStg || <next_stance> = Stance_FrontEnd || <next_stance> = Stance_FrontEnd_Guitar)
				disable_arms_next_anim = 2
			else
				disable_arms_next_anim = ($<info_struct>.next_anim_disable_arms)
			endif
			Change StructureName = <info_struct> stance = <next_stance>
			Change StructureName = <info_struct> current_anim = <next_anim>
			Change StructureName = <info_struct> cycle_anim = <cycle_next_anim>
			Change StructureName = <info_struct> disable_arms = <disable_arms_next_anim>
			Change StructureName = <info_struct> next_anim = None
			Change StructureName = <info_struct> cycle_next_anim = TRUE
			Change StructureName = <info_struct> anim_repeat_count = <repeat_count>
			Change StructureName = <info_struct> next_anim_disable_arms = 0
			blend_time = 0.2
		endif
	repeat
endscript

script crowd_play_adjusting_random_anims \{ Anim = Idle blend_time = 0.2 startwithnoblend = 0 }
	Obj_GetID
	old_speed = undefined
	begin
		hero_get_skill_level_cfunc
		get_anim_speed_for_tempo_cfunc
		if GotParam \{ anim_set }
			anims = ($<anim_set>.<Anim>.<skill>.<anim_speed>)
		else
			anims = ($crowd_animations.<Anim>.<skill>.<anim_speed>)
		endif
		GetArraySize <anims>
		GetRandomValue name = newindex Integer a = 0 b = (<array_Size> - 1)
		anim_name = (<anims> [ <newindex> ])
		if (<startwithnoblend> = 1)
			blend_time = 0.0
			startwithnoblend = 0
		elseif (<anim_speed> != <old_speed>)
			blend_time = $Crowd_BlendTime_TempoChange
		elseif (<skill> = Bad)
			blend_time = $Crowd_BlendTime_Bad
		elseif (<Anim> = Special)
			blend_time = $Crowd_BlendTime_Special
		elseif (<anim_speed> = Slow)
			blend_time = $Crowd_BlendTime_Slow
		elseif (<anim_speed> = Med)
			blend_time = $Crowd_BlendTime_Med
		elseif (<anim_speed> = FAST)
			blend_time = $Crowd_BlendTime_Fast
		else
			blend_time = -1.0
		endif
		if ($display_crowd_anim_info = TRUE)
			Printf channel = Crowd "%a playing %b anim (%c) with blendtime %d ..." a = <ObjID> b = <Anim> c = <anim_name> d = <blend_time>
		endif
		GameObj_PlayAnim Anim = <anim_name> BlendDuration = <blend_time> AnimEvents = ON
		GameObj_WaitAnimFinished
		old_speed = <anim_speed>
	repeat
endscript

script hero_strum_guitar \{ note_length = 150 }
	if (<note_length> < $short_strum_max_gem_length)
		anim_length = Short
	elseif (<note_length> < $med_strum_max_gem_length)
		anim_length = Med
	else
		anim_length = Long
	endif
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	Change StructureName = <info_struct> last_strum_length = <anim_length>
	strum_type = ($<info_struct>.strum)
	ExtendCRC <strum_type> '_Strums' out = strum_anims
	if (($<info_struct>.playing_missed_note = FALSE)|| ($always_strum = TRUE))
		GetArraySize (<strum_anims>.<anim_length>)
		GetRandomValue name = newindex Integer a = 0 b = (<array_Size> - 1)
		strum_anim = (<strum_anims>.<anim_length> [ <newindex> ])
		hero_play_strum_anim Anim = <strum_anim> BlendDuration = 0.1
	endif
	hero_wait_until_anim_finished \{ Timer = StrumTimer }
	hero_play_strum_anim Anim = (($<strum_anims>).no_strum_anim)
endscript

script hero_play_chord \{ chord = track_none }
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	finger_anims = ($<info_struct>.finger_anims)
	if StructureContains Structure = $<finger_anims> name = <chord>
		finger_anim = (<finger_anims>.<chord>)
		if (<chord> = None)
			blend_time = $finger_release_blend_time
		else
			blend_time = $finger_press_blend_time
		endif
	else
		finger_anim = (<finger_anims>.None)
		blend_time = $finger_release_blend_time
	endif
	if (<finger_anim> != None)
		hero_play_finger_anim Anim = <finger_anim> BlendDuration = <blend_time>
	endif
endscript

script find_profile
	get_musician_profile_size
	if GotParam \{ name }
		GetLowerCaseString <name>
		search_name = <lowercasestring>
		found = 0
		Index = 0
		begin
			get_musician_profile_struct Index = <Index>
			GetLowerCaseString (<profile_struct>.name)
			profile_name = <lowercasestring>
			if (<profile_name> = <search_name>)
				found = 1
				break
			endif
			Index = (<Index> + 1)
		repeat <array_Size>
		return found = <found> Index = <Index>
	elseif GotParam \{ body_id }
		found = 0
		Index = 0
		begin
			get_musician_profile_struct Index = <Index>
			Body = (<profile_struct>.musician_body)
			body_descid = (<Body>.desc_id)
			if (<body_id> = <body_descid>)
				found = 1
				break
			endif
			Index = (<Index> + 1)
		repeat <array_Size>
		return found = <found> Index = <Index>
	endif
endscript

script find_profile_by_id
	get_musician_profile_size
	found = 0
	Index = 0
	begin
		get_musician_profile_struct Index = <Index>
		next_name = (<profile_struct>.name)
		FormatText ChecksumName = profile_id '%n' n = <next_name> AddToStringLookup = TRUE
		if (<profile_id> = <Id>)
			return TRUE Index = <Index>
			break
		endif
		Index = (<Index> + 1)
	repeat <array_Size>
	find_profile_by_id \{ Id = Axel }
	return FALSE Index = <Index>
endscript

script get_waypoint_id \{ Index = 0 }
	GetPakManCurrent \{ map = Zones }
	GetPakManCurrentName \{ map = Zones }
	if (<Index> < 10)
		FormatText textname = suffix '_TRG_Waypoint_0%a' a = <Index>
	else
		FormatText textname = suffix '_TRG_Waypoint_%a' a = <Index>
	endif
	waypoint_name = (<pakname> + <suffix>)
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
endscript

script get_start_node_id \{ character = "guitarist" }
	player2_is_guitarist = FALSE
	if (($game_mode = p2_career)|| ($game_mode = p2_coop))
		if NOT ($player1_status.part = guitar)
			player2_is_guitarist = TRUE
		endif
	endif
	art_deco_encore = FALSE
	GetPakManCurrent \{ map = Zones }
	if (<pak> = Z_ArtDeco)
		if GetNodeFlag \{ LS_ENCORE_POST }
			art_deco_encore = TRUE
		endif
	endif
	switch (<member>)
		case GUITARIST
			if ($current_num_players = 1)
				character = "guitarist"
			else
				if (<player2_is_guitarist> = TRUE)
					if (<art_deco_encore> = TRUE)
						character = "guitarist"
					else
						character = "guitarist_player2"
					endif
				else
					character = "guitarist_player1"
				endif
			endif
		case BASSIST
			if ($current_num_players = 1)
				character = "bassist"
			else
				if (<player2_is_guitarist> = TRUE)
					character = "guitarist_player1"
				else
					if (<art_deco_encore> = TRUE)
						character = "guitarist"
					else
						character = "guitarist_player2"
					endif
				endif
			endif
		case VOCALIST
			character = "vocalist"
		case Drummer
			character = "drummer"
		default
			Printf \{ "Unknown character referenced in get_starting_position!" }
			character = "unknown"
	endswitch
	if GetPakManCurrentName \{ map = Zones }
		GetPakManCurrent \{ map = Zones }
		FormatText textname = suffix '_TRG_Waypoint_%a_start' a = <character>
		waypoint_name = (<pakname> + <suffix>)
		AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
		return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
	else
		return \{ waypoint_id = None waypoint_name = "NONE" }
	endif
endscript

script get_skill_level
	health = ($player1_status.current_health)
	skill = Normal
	if (<health> < 0.66)
		skill = Bad
	elseif (<health> > 1.33)
		skill = Good
	endif
	return skill = <skill>
endscript

script get_target_node
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	return target_node = ($<info_struct>.target_node)
endscript
BandMember_Idle_EventTable = [
	{ response = call_script Event = play_anim Scr = handle_play_anim }
	{ response = call_script Event = change_stance Scr = handle_change_stance }
]

script bandmember_idle
	ResetEventHandlersFromTable \{ BandMember_Idle_EventTable Group = hand_events }
	Obj_KillSpawnedScript \{ name = hero_play_adjusting_random_anims }
	Obj_SpawnScriptNow \{hero_play_adjusting_random_anims Params = { Anim = Idle }}
	Block
endscript

script play_special_facial_anim
	if NOT GotParam \{ Anim }
		return
	endif
	Obj_KillSpawnedScript \{ name = facial_anim_loop }
	Obj_GetID
	if (<ObjID> = GUITARIST)
		Printf \{ channel = newdebug "playing special facial on guitarist......." }
	endif
	hero_play_facial_anim Anim = <Anim>
	hero_wait_until_anim_finished \{ Timer = FacialTimer }
	if (<ObjID> = GUITARIST)
		Printf \{ channel = newdebug "done waiting for facial on guitarist......." }
	endif
	Obj_SpawnScriptNow \{ facial_anim_loop }
endscript

script facial_anim_loop
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	if NOT StructureContains Structure = $<anim_set> name = facial_anims
		return
	endif
	if NOT StructureContains Structure = ($<anim_set>.facial_anims)name = Idle
		return
	endif
	begin
		Anim = ($<info_struct>.facial_anim)
		if NOT StructureContains Structure = ($<anim_set>.facial_anims)name = <Anim>
			if ($display_facial_anim_info = TRUE)
				Printf channel = facial "facial anims not defined for %a ... reverting to idle" a = <Anim>
			endif
			Anim = Idle
		endif
		anims = ($<anim_set>.facial_anims.<Anim>)
		GetArraySize <anims>
		GetRandomValue name = Index Integer a = 0 b = (<array_Size> - 1)
		anim_name = (<anims> [ <Index> ])
		if ($display_facial_anim_info = TRUE)
			Printf channel = facial "playing facial anim - %a (%b) ..." a = <Anim> b = <anim_name>
		endif
		Change StructureName = <info_struct> facial_anim = Idle
		hero_play_facial_anim Anim = <anim_name>
		hero_wait_until_anim_finished \{ Timer = FacialTimer }
		wait \{ 1 GameFrame }
	repeat
endscript
Guitarist_Idle_EventTable = [
	{ response = call_script Event = strum_guitar Scr = handle_strum_event }
	{ response = call_script Event = pose_fret Scr = handle_fret_event }
	{ response = call_script Event = pose_fingers Scr = handle_finger_event }
	{ response = call_script Event = Anim_MissedNote Scr = handle_missed_note }
	{ response = call_script Event = Anim_HitNote Scr = handle_hit_note }
	{ response = call_script Event = play_anim Scr = handle_play_anim }
	{ response = call_script Event = play_battle_anim Scr = handle_play_anim }
	{ response = call_script Event = change_stance Scr = handle_change_stance }
	{ response = call_script Event = walk Scr = handle_walking }
]

script guitarist_idle
	ResetEventHandlersFromTable \{ Guitarist_Idle_EventTable Group = hand_events }
	Obj_GetID
	if (($player1_status.band_Member)= <ObjID>)
		SetEventHandler \{ response = call_script Event = star_power_onp1 Scr = handle_star_power Group = hand_events }
	else(($player2_status.band_Member)= <ObjID>)
		SetEventHandler \{ response = call_script Event = star_power_onp2 Scr = handle_star_power Group = hand_events }
	endif
	Obj_KillSpawnedScript \{ name = hero_play_adjusting_random_anims }
	Obj_SpawnScriptNow \{hero_play_adjusting_random_anims Params = { Anim = Idle blend_time = 0.2 Cycle }}
	Block
endscript

script guitarist_idle_animpreview
	ClearEventHandlerGroup \{ hand_events }
endscript
Guitarist_Walking_EventTable = [
	{ response = call_script Event = strum_guitar Scr = handle_strum_event }
	{ response = call_script Event = pose_fret Scr = handle_fret_event }
	{ response = call_script Event = pose_fingers Scr = handle_finger_event }
	{ response = call_script Event = Anim_MissedNote Scr = handle_missed_note }
	{ response = call_script Event = Anim_HitNote Scr = handle_hit_note }
	{ response = call_script Event = change_stance Scr = queue_change_stance }
]

script guitarist_walking
	ResetEventHandlersFromTable \{ Guitarist_Walking_EventTable Group = hand_events }
	Obj_KillSpawnedScript \{ name = hero_play_adjusting_random_anims }
	spawnscriptnow \{ start_walk_camera }
	walk_to_waypoint <...>
	spawnscriptnow \{ Kill_Walk_Camera }
	Obj_SwitchScript \{ guitarist_idle }
endscript

script play_special_anim \{ stance = Stance_A disable_arms = 2 BlendDuration = 0.2 }
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	ClearEventHandlerGroup \{ hand_events }
	if GotParam \{ respond_to_hand_events }
		ResetEventHandlersFromTable \{ Guitarist_Walking_EventTable Group = hand_events }
	else
		SetEventHandler \{ response = call_script Event = change_stance Scr = queue_change_stance Group = hand_events }
	endif
	Obj_KillSpawnedScript \{ name = hero_play_adjusting_random_anims }
	if GotParam \{ wait }
		hero_wait_until_anim_finished
	endif
	if (<disable_arms> = 0)
		if (<info_struct>.arms_disabled = 2)
			hero_toggle_arms \{ prev_num_arms = 0 num_arms = 2 }
			Change StructureName = <info_struct> arms_disabled = 0
			Change StructureName = <info_struct> disable_arms = 0
			Change StructureName = <info_struct> next_anim_disable_arms = 0
			Change StructureName = <info_struct> current_anim = Idle
			Change StructureName = <info_struct> cycle_anim = Idle
			Change StructureName = <info_struct> next_anim = Idle
			Change StructureName = <info_struct> cycle_next_anim = TRUE
		endif
	endif
	if (<disable_arms> = 2)
		if (<ObjID> = GUITARIST || <ObjID> = BASSIST || <ObjID> = Drummer)
			hero_disable_arms \{ blend_time = 0.0 }
		endif
	endif
	Change StructureName = <info_struct> stance = <stance>
	if hero_play_tempo_anim_cfunc Anim = <Anim> BlendDuration = <BlendDuration>
		hero_play_anim Anim = <anim_to_run> BlendDuration = <blend_duration> UseMotionExtraction = <use_motion_extraction>
	endif
	if (<stance> = Win || <stance> = Win_SmStg || <stance> = Lose || <stance> = Lose_SmStg || <Anim> = Starpower)
		Ragdoll_MarkForReset
	endif
	if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
		if (<disable_arms> = 2)
			hero_wait_until_anim_near_end \{ time_from_end = 0.25 }
			hero_enable_arms \{ blend_time = 0.25 }
		endif
	endif
	hero_wait_until_anim_finished
	Change StructureName = <info_struct> stance = Stance_A
	if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
		Obj_SwitchScript \{ guitarist_idle }
	else
		Obj_SwitchScript \{ bandmember_idle }
	endif
endscript

script play_simple_anim \{ disable_arms = 2 BlendDuration = 0.0 }
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	ClearEventHandlerGroup \{ hand_events }
	Obj_KillSpawnedScript \{ name = hero_play_adjusting_random_anims }
	if (<disable_arms> = 2)
		if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
			hero_disable_arms blend_time = <BlendDuration>
		endif
	endif
	hero_play_anim Anim = <Anim> BlendDuration = <BlendDuration>
	if (BlendDuration = 0.0)
		Ragdoll_MarkForReset
	endif
	if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
		hero_wait_until_anim_near_end \{ time_from_end = 0.25 }
		hero_enable_arms \{ blend_time = 0.25 }
	endif
	hero_wait_until_anim_finished
	handle_change_stance \{ stance = Stance_A no_wait }
	if (<ObjID> = GUITARIST || <ObjID> = BASSIST)
		Obj_SwitchScript \{ guitarist_idle }
	else
		Obj_SwitchScript \{ bandmember_idle }
	endif
endscript

script handle_star_power
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	Change StructureName = <info_struct> waiting_for_cameracut = TRUE
	begin
		if ($<info_struct>.waiting_for_cameracut = FALSE)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	Obj_SwitchScript \{play_special_anim Params = {stance = Stance_A Anim = Starpower BlendDuration = 0.0 disable_arms = 0 respond_to_hand_events = 1}}
endscript

script handle_song_won
	Obj_KillSpawnedScript \{ name = handle_star_power }
	Printf \{ channel = AnimInfo "handle song won............" }
	Obj_SwitchScript \{play_special_anim Params = { stance = Win Anim = Idle kill_transitions_when_done }}
endscript

script handle_song_failed
	Obj_KillSpawnedScript \{ name = handle_star_power }
	Printf \{ channel = AnimInfo "handle song failed........." }
	Obj_SwitchScript \{play_special_anim Params = { stance = Lose Anim = Idle kill_transitions_when_done }}
endscript

script play_intro_anims
	Printf \{ channel = AnimInfo "play_intro_anims............." }
	intro_stance = Intro
	if (UseSmallVenueAnims)
		Printf \{ channel = AnimInfo "Using small venue anims! ............" }
		intro_stance = Intro_SmStg
	endif
	play_guitarist_intro = TRUE
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_ArtDeco
			if GetNodeFlag \{ LS_ENCORE_POST }
				play_guitarist_intro = FALSE
			endif
	endswitch
	if (<play_guitarist_intro> = TRUE)
		Band_ChangeStance name = GUITARIST stance = <intro_stance> no_wait
		Band_ChangeStance name = BASSIST stance = <intro_stance> no_wait
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			Band_ChangeStance name = ($player1_status.band_Member)stance = <intro_stance> no_wait
			Band_ChangeStance name = ($player2_status.band_Member)stance = Stance_A no_wait
		else
			Band_ChangeStance \{ name = GUITARIST stance = Stance_A no_wait }
			Band_ChangeStance name = BASSIST stance = <intro_stance> no_wait
		endif
	endif
	Band_ChangeStance name = VOCALIST stance = <intro_stance> no_wait
	Band_ChangeStance \{ name = Drummer stance = Intro no_wait }
	Band_ChangeStance \{ name = GUITARIST stance = Stance_A }
	Band_ChangeStance \{ name = BASSIST stance = Stance_A }
	Band_ChangeStance \{ name = VOCALIST stance = Stance_A }
	Band_ChangeStance \{ name = Drummer stance = Stance_A }
endscript

script UseSmallVenueAnims
	GetPakManCurrent \{ map = Zones }
	switch <pak>
		case Z_Party
			return_val = TRUE
		case Z_Dive
			return_val = TRUE
		case Z_Video
			return_val = TRUE
		case Z_Prison
			return_val = TRUE
		case Z_Hell
			return_val = TRUE
		case Z_ArtDeco
			if GetNodeFlag \{ LS_ENCORE_POST }
				return \{ TRUE }
			endif
		default
			return_val = FALSE
	endswitch
	return <return_val>
endscript

script play_win_anims
	if ($disable_band = 1)
		return
	endif
	if ($game_mode = tutorial)
		return
	endif
	Printf \{ channel = AnimInfo "play_win_anims............." }
	win_stance = Win
	lose_stance = Lose
	if (UseSmallVenueAnims)
		Printf \{ channel = AnimInfo "Using small venue anims! ............" }
		win_stance = Win_SmStg
		lose_stance = Lose_SmStg
	endif
	if ((($current_num_players = 1)& ($boss_battle = 0))|| ($game_mode = p2_coop)|| ($game_mode = p2_career))
		if CompositeObjectExists \{ name = GUITARIST }
			GUITARIST ::Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = Idle kill_transitions_when_done BlendDuration = 0.0}
		endif
		if CompositeObjectExists \{ name = BASSIST }
			BASSIST ::Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = Idle kill_transitions_when_done BlendDuration = 0.0}
		endif
	else
		if ($boss_battle = 1)
			GUITARIST ::Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = Idle kill_transitions_when_done BlendDuration = 0.0}
			BASSIST ::Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = Idle kill_transitions_when_done BlendDuration = 0.0}
		else
			p1_won = TRUE
			if ($game_mode = p2_battle)
				if (($player2_status.current_health)> ($player1_status.current_health))
					p1_won = FALSE
				endif
			else
				if (($player2_status.score)> ($player1_status.score))
					p1_won = FALSE
				endif
			endif
			if (<p1_won> = TRUE)
				($player1_status.band_Member)::Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = Idle BlendDuration = 0.0}
				($player2_status.band_Member)::Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = Idle BlendDuration = 0.0}
			else
				($player2_status.band_Member)::Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = Idle BlendDuration = 0.0}
				($player1_status.band_Member)::Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = Idle BlendDuration = 0.0}
			endif
		endif
	endif
	if CompositeObjectExists \{ name = Drummer }
		Change \{ StructureName = drummer_info desired_twist = 0.0 }
		Change \{ StructureName = drummer_info last_left_arm_note = 0 }
		Change \{ StructureName = drummer_info last_right_arm_note = 0 }
		Drummer ::Obj_SwitchScript \{play_special_anim Params = { stance = Win Anim = Idle BlendDuration = 0.0 }}
	endif
	if CompositeObjectExists \{ name = VOCALIST }
		VOCALIST ::Obj_SwitchScript \{play_special_anim Params = { stance = Win Anim = Idle BlendDuration = 0.0 }}
	endif
	restore_idle_faces
endscript

script play_lose_anims
	Printf \{ channel = newdebug "play_lose_anims............" }
	if ($disable_band = 1)
		return
	endif
	win_stance = Win
	lose_stance = Lose
	if (UseSmallVenueAnims)
		Printf \{ channel = AnimInfo "Using small venue anims! ............" }
		win_stance = Win_SmStg
		lose_stance = Lose_SmStg
	endif
	if ((($current_num_players = 1)& ($boss_battle = 0))|| ($game_mode = p2_coop)|| ($game_mode = p2_career))
		GUITARIST ::Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = Idle BlendDuration = 0.0}
		BASSIST ::Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = Idle BlendDuration = 0.0}
	else
		if ($boss_battle = 1)
			GUITARIST ::Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = Idle BlendDuration = 0.0}
			BASSIST ::Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = Idle BlendDuration = 0.0}
		else
			Printf \{ channel = newdebug "not bossbattle......" }
			p1_won = TRUE
			if ($game_mode = p2_battle)
				if (($player2_status.current_health)> ($player1_status.current_health))
					p1_won = FALSE
				endif
			else
				if (($player2_status.score)> ($player1_status.score))
					p1_won = FALSE
				endif
			endif
			if (<p1_won> = TRUE)
				($player1_status.band_Member)::Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = Idle BlendDuration = 0.0}
				($player2_status.band_Member)::Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = Idle BlendDuration = 0.0}
			else
				($player2_status.band_Member)::Obj_SwitchScript play_special_anim Params = {stance = <win_stance> Anim = Idle BlendDuration = 0.0}
				($player1_status.band_Member)::Obj_SwitchScript play_special_anim Params = {stance = <lose_stance> Anim = Idle BlendDuration = 0.0}
			endif
		endif
	endif
	if CompositeObjectExists \{ name = Drummer }
		Change \{ StructureName = drummer_info last_left_arm_note = 0 }
		Change \{ StructureName = drummer_info last_right_arm_note = 0 }
		Change \{ StructureName = drummer_info desired_twist = 0.0 }
		Drummer ::Obj_SwitchScript \{play_special_anim Params = { stance = Lose Anim = Idle BlendDuration = 0.0 }}
	endif
	if CompositeObjectExists \{ name = VOCALIST }
		VOCALIST ::Obj_SwitchScript \{play_special_anim Params = { stance = Lose Anim = Idle BlendDuration = 0.0 }}
	endif
	restore_idle_faces
endscript

script restore_idle_faces
	if CompositeObjectExists \{ name = GUITARIST }
		GUITARIST ::Obj_KillSpawnedScript \{ name = facial_anim_loop }
		GUITARIST ::Obj_SpawnScriptNow \{ facial_anim_loop }
	endif
	if CompositeObjectExists \{ name = BASSIST }
		BASSIST ::Obj_KillSpawnedScript \{ name = facial_anim_loop }
		BASSIST ::Obj_SpawnScriptNow \{ facial_anim_loop }
	endif
	if CompositeObjectExists \{ name = VOCALIST }
		VOCALIST ::Obj_KillSpawnedScript \{ name = facial_anim_loop }
		VOCALIST ::Obj_SpawnScriptNow \{ facial_anim_loop }
	endif
	if CompositeObjectExists \{ name = Drummer }
		Drummer ::Obj_KillSpawnedScript \{ name = facial_anim_loop }
		Drummer ::Obj_SpawnScriptNow \{ facial_anim_loop }
	endif
endscript

script Hide_Band
	if CompositeObjectExists \{ GUITARIST }
		GUITARIST ::Hide
	endif
	if CompositeObjectExists \{ BASSIST }
		BASSIST ::Hide
	endif
	if CompositeObjectExists \{ VOCALIST }
		VOCALIST ::Hide
	endif
	if CompositeObjectExists \{ Drummer }
		Drummer ::Hide
	endif
endscript

script Unhide_Band
	if CompositeObjectExists \{ GUITARIST }
		GUITARIST ::Unhide
	endif
	if CompositeObjectExists \{ BASSIST }
		BASSIST ::Unhide
	endif
	if CompositeObjectExists \{ VOCALIST }
		VOCALIST ::Unhide
	endif
	if CompositeObjectExists \{ Drummer }
		Drummer ::Unhide
	endif
endscript
using_walk_camera = FALSE

script start_walk_camera
	if ($using_walk_camera = TRUE || $using_starpower_camera = TRUE || $game_mode = training)
		return
	endif
	Change \{ using_walk_camera = TRUE }
	Change \{ CameraCuts_AllowNoteScripts = FALSE }
	CameraCuts_SetArrayPrefix \{ prefix = 'cameras_walk' changetime = $max_walk_camera_cut_delay }
	wait \{ 7 seconds }
	CameraCuts_SetArrayPrefix \{ prefix = 'cameras' }
	Change \{ CameraCuts_AllowNoteScripts = TRUE }
	Change \{ using_walk_camera = FALSE }
endscript

script Kill_Walk_Camera \{ changecamera = 1 }
	if ($using_walk_camera = FALSE || $game_mode = training)
		return
	endif
	killspawnedscript \{ name = start_walk_camera }
	if (<changecamera> = 1)
		CameraCuts_SetArrayPrefix \{ prefix = 'cameras' }
	endif
	Change \{ CameraCuts_AllowNoteScripts = TRUE }
	Change \{ using_walk_camera = FALSE }
endscript
