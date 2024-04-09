menu_select_practice_mode_font = fontgrid_title_gh3
training_mode = tutorials

script create_select_practice_mode_menu
	Change \{ rich_presence_context = presence_main_menu }
	spawnscriptnow \{ Menu_Music_On }
	CreateScreenElement {
		Type = ContainerElement
		Id = spm_container
		PARENT = root_window
		Pos = (0.0, 0.0)
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{ texture = Venue_BG }
	displaySprite \{texture = practice_poster_2 Id = spm_poster PARENT = spm_container Pos = (640.0, 340.0) dims = (600.0, 600.0) rot_angle = -5 just = [ center center ]}
	displaySprite \{tex = practice_typebar_1 PARENT = spm_container Pos = (710.0, 240.0) dims = (192.0, 75.0) rot_angle = -5 just = [ center center ] rgba = [ 0 0 0 255 ] z = 5}
	displaySprite \{tex = practice_typebar_2 PARENT = spm_container Pos = (555.0, 320.0) dims = (220.0, 75.0) rot_angle = -5 just = [ center center ] rgba = [ 0 0 0 255 ] z = 5}
	displaySprite \{tex = Tape_H_02 PARENT = spm_container Pos = (775.0, 60.0) dims = (160.0, 64.0) rot_angle = -20 just = [ center center ] z = 7}
	displaySprite {
		tex = Tape_H_02
		PARENT = <Id>
		Pos = (5.0, 5.0)
		rgba = [ 0 0 0 128 ]
		z = 6
	}
	displaySprite \{tex = Tape_H_02 PARENT = spm_container Pos = (500.0, 640.0) dims = (160.0, 64.0) rot_angle = 20 just = [ center center ] z = 7 flip_v}
	displaySprite {
		tex = Tape_H_02
		PARENT = <Id>
		Pos = (5.0, 5.0)
		rgba = [ 0 0 0 128 ]
		z = 6
	}
	displaySprite \{tex = tape_V_02 PARENT = spm_container Pos = (430.0, 120.0) dims = (160.0, 96.0) rot_angle = 280 just = [ center center ] z = 7}
	displaySprite {
		tex = tape_V_02
		PARENT = <Id>
		Pos = (-5.0, 5.0)
		rgba = [ 0 0 0 128 ]
		z = 6
	}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [ 80 80 80 255 ] not_focusable}
	else
		demo_mode_disable = {}
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = spm_container
		Id = tutorials_text
		text = "tutorials"
		font = text_a6
		Pos = (555.0, 320.0)
		Scale = 0.7
		rot_angle = -5
		just = [ center center ]
		event_handlers = [
			{ pad_up switch_training_mode }
			{ pad_down switch_training_mode }
			{ pad_choose choose_training_mode }
			{pad_back ui_flow_manager_respond_to_action Params = { action = go_back }}
		]
		z_priority = 10
		<demo_mode_disable>
	}
	displayText \{Id = practice_text PARENT = spm_container text = "practice" font = text_a6 Pos = (710.0, 245.0) Scale = 0.7 just = [ center center ] rot = -5 z = 10}
	displayText \{PARENT = spm_container text = "Select practice mode" font = text_a11 Pos = (655.0, 540.0) rgba = [ 255 195 20 255 ] rot = -5 z = 10 noshadow just = [ center center ]}
	fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 dims = (320.0, 70.0)
	LaunchEvent \{ Type = Focus Target = tutorials_text }
	update_training_menu
	player_device = ($primary_controller)
	Change \{user_control_pill_text_color = [ 0 0 0 255 ]}
	Change \{user_control_pill_color = [ 180 180 180 255 ]}
	add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	player_device = ($primary_controller)
	add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
endscript

script destroy_select_practice_mode_menu
	destroy_menu_backdrop
	clean_up_user_control_helpers
	destroy_menu \{ menu_id = spm_container }
	destroy_menu \{ menu_id = spm_scroll }
endscript

script switch_training_mode
	player_device = ($primary_controller)
	generic_menu_up_or_down_sound
	if ($training_mode = tutorials)
		Change \{ training_mode = practice }
	else
		Change \{ training_mode = tutorials }
	endif
	update_training_menu
endscript

script choose_training_mode
	generic_menu_pad_choose_sound
	if ($training_mode = tutorials)
		player_device = ($primary_controller)
		ui_flow_manager_respond_to_action \{ action = select_tutorial }
	else
		ui_flow_manager_respond_to_action \{ action = select_practice }
	endif
endscript

script update_training_menu
	if ($training_mode = tutorials)
		if ScreenElementExists \{ Id = spm_poster }
			SetScreenElementProps \{ Id = spm_poster texture = practice_poster_1 }
		endif
		if ScreenElementExists \{ Id = tutorials_text }
			SetScreenElementProps \{Id = tutorials_text rgba = [ 150 140 200 255 ] Scale = 0.75}
		endif
		if ScreenElementExists \{ Id = practice_text }
			SetScreenElementProps \{Id = practice_text rgba = [ 145 145 145 255 ] Scale = 0.6}
		endif
	else
		if ScreenElementExists \{ Id = spm_poster }
			SetScreenElementProps \{ Id = spm_poster texture = practice_poster_2 }
		endif
		if ScreenElementExists \{ Id = tutorials_text }
			SetScreenElementProps \{Id = tutorials_text rgba = [ 145 145 145 255 ] Scale = 0.6}
		endif
		if ScreenElementExists \{ Id = practice_text }
			SetScreenElementProps \{Id = practice_text rgba = [ 220 25 30 255 ] Scale = 0.75}
		endif
	endif
endscript
