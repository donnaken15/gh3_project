
script Band_PlaySimpleAnim \{ name = GUITARIST }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if NOT GotParam \{ Anim }
		return
	endif
	<name> ::Obj_KillSpawnedScript name = play_simple_anim
	<name> ::Obj_SpawnScriptNow play_simple_anim Params = { <...>  }
endscript

script Band_PlayANim \{ name = GUITARIST Anim = Idle }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<name> = GUITARIST)
			if CompositeObjectExists \{ name = BASSIST }
				LaunchEvent Type = play_anim Target = BASSIST Data = { <...>  }
			endif
		elseif (<name> = BASSIST)
			return
		endif
	endif
	LaunchEvent Type = play_anim Target = <name> Data = { <...>	 }
endscript

script Band_PlayIdle \{ name = GUITARIST }
	Band_PlayANim name = <name> Anim = Idle Cycle
endscript

script Band_PlayFacialAnim \{ name = GUITARIST }
	if CompositeObjectExists name = <name>
		<name> ::Obj_KillSpawnedScript name = play_special_facial_anim
		<name> ::Obj_SpawnScriptNow play_special_facial_anim Params = { Anim = <Anim> }
	endif
endscript

script Band_SetStrumStyle \{ name = GUITARIST style = Long }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	ExtendCRC <name> '_Info' out = info_struct
	Change StructureName = <info_struct> strum = <style>
endscript

script Band_ChangeStance \{ name = GUITARIST stance = Stance_A }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<name> = GUITARIST)
			if CompositeObjectExists \{ name = BASSIST }
				LaunchEvent Type = change_stance Target = BASSIST Data = { <...>  }
			endif
		elseif (<name> = BASSIST)
			return
		endif
	endif
	LaunchEvent Type = change_stance Target = <name> Data = { <...>	 }
endscript

script Band_StopStrumming \{ name = GUITARIST }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	ExtendCRC <name> '_Info' out = info_struct
	Change StructureName = <info_struct> strum = None
endscript

script Band_EnableArms \{ name = GUITARIST blend_time = 0.25 }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if (<name> = GUITARIST || <name> = BASSIST)
		<name> ::hero_toggle_arms num_arms = 2 pre_num_arms = 0 blend_time = <blend_time>
	else
		<name> ::hero_enable_arms blend_time = <blend_time>
	endif
	ExtendCRC <name> '_Info' out = info_struct
	Change StructureName = <info_struct> arms_disabled = 0
	Change StructureName = <info_struct> disable_arms = 0
endscript

script Band_DisableArms \{ name = GUITARIST blend_time = 0.25 }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if (<name> = GUITARIST || <name> = BASSIST)
		<name> ::hero_toggle_arms num_arms = 0 pre_num_arms = 2 blend_time = <blend_time>
	else
		<name> ::hero_disable_arms blend_time = <blend_time>
	endif
	ExtendCRC <name> '_Info' out = info_struct
	Change StructureName = <info_struct> arms_disabled = 2
	Change StructureName = <info_struct> disable_arms = 2
endscript

script Band_SetPosition
	if NOT CompositeObjectExists name = <name>
		return
	endif
	ExtendCRC <name> '_Info' out = info_struct
	char_name = <name>
	if GotParam \{ Index }
		get_waypoint_id Index = <Index>
		GetWaypointPos name = <waypoint_id>
		Change StructureName = <info_struct> target_node = <waypoint_id>
	elseif GotParam \{ node }
		GetWaypointPos name = <node>
		Change StructureName = <info_struct> target_node = <node>
	endif
	<char_name> ::Obj_SetPosition Position = <Pos>
endscript

script Band_DisableMovement
	if NOT CompositeObjectExists name = <name>
		return
	endif
	ExtendCRC <name> '_Info' out = info_struct
	Change StructureName = <info_struct> allow_movement = FALSE
endscript

script Band_EnableMovement
	if NOT CompositeObjectExists name = <name>
		return
	endif
	ExtendCRC <name> '_Info' out = info_struct
	Change StructureName = <info_struct> allow_movement = TRUE
endscript

script Band_WalkToNode \{ name = GUITARIST faceAudience = TRUE }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if ($current_num_players = 2)
		return
	endif
	GetPakManCurrent \{ map = Zones }
	GetPakManCurrentName \{ map = Zones }
	FormatText \{ textname = suffix '_TRG_Waypoint_Guitarist_Walk01' }
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	waypoint_id = <appended_id>
	if NOT DoesWayPointExist name = <waypoint_id>
		return
	endif
	if checksumequals a = <name> b = GUITARIST
		if LocalizedStringEquals a = <node> b = "guitarist_start"
			SpawnScriptLater \{LightShow_WaitAndEnableSpotlights Params = { Enable = FALSE Time = 4.0 }}
		else
			SpawnScriptLater \{LightShow_WaitAndEnableSpotlights Params = { Enable = TRUE Time = 1.5 }}
		endif
	endif
	LaunchEvent Type = walk Target = <name> Data = {<...> anim_set = $normal_walk_data}
endscript

script Band_TurnToFace \{ name = GUITARIST node = 1 }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	get_waypoint_id Index = <node>
	GetWaypointPos name = <waypoint_id>
	<name> ::turn_to_face Pos = <Pos>
endscript

script Band_RotateToFaceNode \{ name = GUITARIST node = 1 }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	get_waypoint_id Index = <node>
	GetWaypointPos name = <waypoint_id>
	<name> ::turn_to_face Pos = <Pos>
endscript

script Band_FaceNode \{ name = GUITARIST node = 1 }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	get_waypoint_id Index = <node>
	GetWaypointPos name = <waypoint_id>
	<name> ::turn_to_face Pos = <Pos>
endscript

script Band_FaceAudience \{ name = GUITARIST }
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> ::face_audience
endscript

script Band_PlayAttackAnim
	if NOT CompositeObjectExists name = <name>
		return
	endif
	attack_type = ($battlemode_powerups [ <Type> ].name)
	if (($player1_status.band_Member)= <name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_Member)= <name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT StructureContains Structure = $<battle_anims> name = <attack_type>
		return
	endif
	Anim = ($<battle_anims>.<attack_type>.attack_anim)
	if NOT (<Anim> = None)
		LaunchEvent Type = play_battle_anim Target = <name> Data = { <...> no_wait }
	endif
endscript

script Band_PlayResponseAnim
	if NOT CompositeObjectExists name = <name>
		return
	endif
	attack_type = ($battlemode_powerups [ <Type> ].name)
	if (($player1_status.band_Member)= <name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_Member)= <name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT StructureContains Structure = $<battle_anims> name = <attack_type>
		return
	endif
	Anim = ($<battle_anims>.<attack_type>.response_anim)
	if NOT (<Anim> = None)
		LaunchEvent Type = play_battle_anim Target = <name> Data = { <...>	}
	endif
endscript

script bassist_should_use_guitarist_commands
	if (($game_mode = p2_faceoff)|| ($game_mode = p2_pro_faceoff)|| ($game_mode = p2_battle))
		if ($boss_battle = 0)
			return \{ TRUE }
		endif
	endif
	return \{ FALSE }
endscript
