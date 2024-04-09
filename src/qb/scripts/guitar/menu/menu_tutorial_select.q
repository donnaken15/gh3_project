tutorial_select_menu_font = text_A4
menu_tutorial_select_num_items = 3
winport_in_tutorial = 0

script create_tutorial_select_menu
	Change \{ winport_in_tutorial = 0 }
	Change \{ rich_presence_context = presence_tutorial }
	CreateScreenElement {
		PARENT = root_window
		Id = ts_container
		Type = ContainerElement
		Pos = (0.0, 0.0)
		exclusive_device = ($primary_controller)
	}
	new_menu \{scrollid = ts_scroll vmenuid = ts_vmenu font = $video_settings_menu_font menu_pos = (300.0, 405.0) spacing = 2 text_left}
	Change \{menu_focus_color = [ 115 10 10 255 ]}
	Change \{menu_unfocus_color = [ 150 170 215 255 ]}
	displayText \{PARENT = ts_container Pos = (800.0, 560.0) just = [ center center ] text = "TUTORIALS" Scale = 1.5 rgba = [ 180 180 180 255 ] font = $video_settings_menu_font noshadow}
	create_menu_backdrop \{ texture = Venue_BG }
	displaySprite \{PARENT = ts_container tex = options_video_poster Pos = (640.0, 365.0) dims = (1024.0, 512.0) just = [ center center ] z = 1 font = $video_settings_menu_font}
	displaySprite \{tex = Tape_H_02 PARENT = ts_container Pos = (275.0, 120.0) dims = (160.0, 64.0) rot_angle = -40 just = [ center center ] z = 7}
	displaySprite {
		tex = Tape_H_02
		PARENT = <Id>
		Pos = (5.0, 5.0)
		rgba = [ 0 0 0 128 ]
		z = 6
	}
	displaySprite \{tex = Tape_H_02 PARENT = ts_container Pos = (980.0, 110.0) dims = (160.0, 64.0) rot_angle = 20 just = [ center center ] z = 7}
	displaySprite {
		tex = Tape_H_02
		PARENT = <Id>
		Pos = (5.0, 5.0)
		rgba = [ 0 0 0 128 ]
		z = 6
	}
	displaySprite \{PARENT = ts_container Id = ts_hilite tex = White Pos = (285.0, 415.0) rgba = [ 185 190 200 255 ] dims = (305.0, 35.0) z = 2}
	text_params = {PARENT = ts_vmenu Type = TextElement font = $video_settings_menu_font rgba = ($menu_unfocus_color)Scale = 0.75 z_priority = 3}
	CreateScreenElement {
		<text_params>
		Id = ts_basic
		text = "BASIC LESSONS"
		event_handlers = [
			{Focus ts_focus Params = {item = basic hilite_pos = (285.0, 423.0)}}
			{unfocus ts_unfocus Params = { item = basic }}
			{ pad_choose menu_tutorial_select_choose_basic }
		]
	}
	CreateScreenElement {
		<text_params>
		Id = ts_star
		text = "STAR POWER"
		event_handlers = [
			{Focus ts_focus Params = {item = star hilite_pos = (285.0, 466.0)}}
			{unfocus ts_unfocus Params = { item = star }}
			{ pad_choose menu_tutorial_select_choose_star_power }
		]
	}
	CreateScreenElement {
		<text_params>
		Id = ts_battle
		text = "GUITAR BATTLE"
		event_handlers = [
			{Focus ts_focus Params = {item = battle hilite_pos = (285.0, 510.0)}}
			{unfocus ts_unfocus Params = { item = battle }}
			{ pad_choose menu_tutorial_select_choose_battle }
		]
	}
	CreateScreenElement {
		<text_params>
		Id = ts_advanced
		text = "ADVANCED TECHNIQUES"
		event_handlers = [
			{Focus ts_focus Params = {item = advanced hilite_pos = (285.0, 553.0)}}
			{unfocus ts_unfocus Params = { item = advanced }}
			{ pad_choose menu_tutorial_select_choose_advanced }
		]
	}
	add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
	GetGlobalTags \{ training }
	complete_color = [ 150 20 50 255 ]
	not_complete_color = $menu_unfocus_color
	if (<basic_lesson> = complete)
		ts_add_skull Pos = (282.0, 440.0) Color = <complete_color>
	else
		ts_add_skull Pos = (282.0, 440.0) Color = <not_complete_color>
	endif
	if (<star_power_lesson> = complete)
		ts_add_skull Pos = (282.0, 483.0) Color = <complete_color>
	else
		ts_add_skull Pos = (282.0, 483.0) Color = <not_complete_color>
	endif
	if (<guitar_battle_lesson> = complete)
		ts_add_skull Pos = (282.0, 526.0) Color = <complete_color>
	else
		ts_add_skull Pos = (282.0, 526.0) Color = <not_complete_color>
	endif
	if (<advanced_techniques_lesson> = complete)
		ts_add_skull Pos = (282.0, 569.0) Color = <complete_color>
	else
		ts_add_skull Pos = (282.0, 569.0) Color = <not_complete_color>
	endif
	if ($select_battle_tutorial = 1)
		LaunchEvent \{ Type = pad_down }
		LaunchEvent \{ Type = pad_down }
		Change \{ select_battle_tutorial = 0 }
	else
		retail_menu_focus \{ Id = ts_basic }
	endif
endscript

script ts_add_skull
	displaySprite {
		tex = Toprockers_Skull
		PARENT = ts_container
		Pos = <Pos>
		dims = (24.0, 24.0)
		rot_angle = 0
		just = [ center center ]
		rgba = <Color>
		z = 7
	}
	displaySprite {
		tex = Toprockers_Skull
		PARENT = ts_container
		Pos = <Pos>
		dims = (26.0, 26.0)
		rot_angle = 0
		just = [ center center ]
		rgba = [ 0 0 0 255 ]
		z = 6
	}
endscript

script ts_focus
	retail_menu_focus
	GetTags
	<Id> ::GetTags
	if ScreenElementExists \{ Id = ts_hilite }
		ts_hilite ::SetProps Pos = <hilite_pos>
	endif
endscript

script ts_unfocus
	retail_menu_unfocus
	return
endscript

script destroy_tutorial_select_menu
	Printf \{ channel = newdebug "destroy tutorial select screen......" }
	if NOT IsWinPort
		restore_start_key_binding
	endif
	clean_up_user_control_helpers
	destroy_menu \{ menu_id = ts_container }
	destroy_menu_backdrop
	destroy_menu \{ menu_id = ts_scroll }
	destroy_menu \{ menu_id = ts_basic }
	destroy_menu \{ menu_id = ts_star }
	destroy_menu \{ menu_id = ts_battle }
	destroy_menu \{ menu_id = ts_advanced }
endscript

script menu_tutorial_select_choose_basic
	Change \{ winport_in_tutorial = 1 }
	set_training_script \{ name = training_basic_tutorial_script }
	ui_flow_manager_respond_to_action \{ action = continue }
endscript

script menu_tutorial_select_choose_star_power
	Change \{ winport_in_tutorial = 1 }
	set_training_script \{ name = training_star_power_tutorial_script }
	ui_flow_manager_respond_to_action \{ action = continue }
endscript

script menu_tutorial_select_choose_battle
	Change \{ winport_in_tutorial = 1 }
	set_training_script \{ name = training_battle_tutorial_script }
	ui_flow_manager_respond_to_action \{ action = continue }
endscript

script menu_tutorial_select_choose_advanced
	Change \{ winport_in_tutorial = 1 }
	set_training_script \{ name = training_advanced_techniques_tutorial_script }
	ui_flow_manager_respond_to_action \{ action = continue }
endscript
