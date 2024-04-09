save_changes_message = "You are about to exit the Player Options. Any changes made will not be saved if you continue. Would you like to SAVE your changes first?"

script create_online_options_menu \{ menu_title = "OPTIONS" menu_subtitle = "ONLINE OPTIONS" menu_id = online_options_menu vmenu_id = online_options_vmenu }
	setup_options_globals
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = root_window
		Id = <menu_id>
		just = [ center top ]
		dims = (256.0, 350.0)
		Pos = (($online_general_menu_pos)+ (0.0, 182.0))
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = ((128.0, 0.0) + (-8.0, 0.0))
		just = [ center top ]
		internal_just = [ center center ]
		dims = (256.0, 350.0)
		padding_scale = 1.5
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action Params = { action = go_back }}
			{ pad_back generic_menu_pad_back_sound }
			{pad_up generic_menu_up_or_down_sound Params = { Up }}
			{pad_down generic_menu_up_or_down_sound Params = { Down }}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{ texture = Online_Background }
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = online_menu_ui_container Pos = (0.0, 0.0) }
	displaySprite Id = Online_Frame_Crown PARENT = online_menu_ui_container tex = Online_Frame_Crown Pos = (($online_general_menu_pos)+ (0.0, -48.0))dims = (192.0, 96.0) just = [ center top ] z = 3
	displaySprite Id = online_menu_box_top PARENT = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue)Pos = ($online_general_menu_pos)dims = (256.0, 64.0) just = [ center top ] z = 2
	displaySprite Id = online_menu_box_top_fill PARENT = online_menu_ui_container tex = window_fill_cap rgba = [ 0 0 0 200 ] Pos = ($online_general_menu_pos)dims = (256.0, 64.0) just = [ center top ] z = 2
	displaySprite Id = online_menu_box_body PARENT = online_menu_ui_container tex = window_frame_body_tall rgba = ($online_medium_blue)Pos = (($online_general_menu_pos)+ (0.0, 64.0))dims = (256.0, 432.0) just = [ center top ] z = 2 flip_h
	displaySprite Id = online_menu_box_body_fill PARENT = online_menu_ui_container tex = window_fill_body_large rgba = [ 0 0 0 200 ] Pos = (($online_general_menu_pos)+ (0.0, 64.0))dims = (256.0, 432.0) just = [ center top ] z = 2 flip_h
	displaySprite Id = online_menu_box_bottom PARENT = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue)Pos = (($online_general_menu_pos)+ (0.0, 496.0))dims = (256.0, 64.0) just = [ center top ] z = 2 flip_h
	displaySprite Id = online_menu_box_bottom_fill PARENT = online_menu_ui_container tex = window_fill_cap rgba = [ 0 0 0 200 ] Pos = (($online_general_menu_pos)+ (0.0, 496.0))dims = (256.0, 64.0) just = [ center top ] z = 2 flip_h
	displaySprite Id = online_title_bar PARENT = online_menu_ui_container tex = store_frame_bottom_bg rgba = ($online_light_blue)Pos = (($online_general_menu_pos)+ (0.0, 128.0))dims = (256.0, 128.0) just = [ center center ] z = 3
	displaySprite Id = online_highlight PARENT = online_menu_ui_container tex = White rgba = ($online_light_blue)Pos = ((($online_general_menu_hi_lite_ypos [ 0 ])* (0.0, 1.0))+ (632.0, 0.0))dims = (256.0, 40.0) just = [ center top ] z = 3
	displaySprite Id = online_bookend1 PARENT = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue)Pos = ((($online_general_menu_hi_lite_ypos [ 0 ])* (0.0, 1.0))+ (502.0, 20.0))dims = (40.0, 35.0) just = [ center center ] z = 3
	displaySprite Id = online_bookend2 PARENT = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue)Pos = ((($online_general_menu_hi_lite_ypos [ 0 ])* (0.0, 1.0))+ (774.0, 20.0))dims = (40.0, 35.0) just = [ center center ] z = 3
	CreateScreenElement {
		Type = TextElement
		PARENT = online_menu_ui_container
		font = text_A4
		Scale = (0.6500000357627869, 0.75)
		rgba = ($online_medium_blue)
		text = <menu_title>
		just = [ center top ]
		Pos = (($online_general_menu_pos)+ (0.0, 32.0))
		z_priority = 3.0
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = online_menu_ui_container
		font = fontgrid_title_gh3
		Scale = (0.699999988079071, 0.75)
		rgba = ($online_dark_purple)
		text = <menu_subtitle>
		just = [ center top ]
		Pos = (($online_general_menu_pos)+ (0.0, 115.0))
		z_priority = 4.0
	}
	selectable_menu_items = 0
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.5, 0.75)
		rgba = ($online_light_blue)
		text = "QUICK MATCH OPTIONS"
		just = [ Left top ]
		z_priority = 4.0
	}
	<Id> ::SetTags menu_item = <selectable_menu_items>
	<Id> ::SetProps event_handlers = [
		{Focus online_general_menu_focus Params = { Id = <Id> }}
		{ unfocus retail_menu_unfocus }
		{ pad_choose online_options_select_quickmatch_player }
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.6500000357627869, 0.75)
		rgba = ($online_light_blue)
		text = "GAME OPTIONS"
		just = [ Left top ]
		z_priority = 4.0
	}
	<Id> ::SetTags menu_item = <selectable_menu_items>
	<Id> ::SetProps event_handlers = [
		{Focus online_general_menu_focus Params = { Id = <Id> }}
		{ unfocus retail_menu_unfocus }
		{ pad_choose online_options_select_player_pref }
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	set_online_menu_highlight_pos menu_items = <selectable_menu_items>
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	Change \{user_control_pill_text_color = [ 0 0 0 255 ]}
	Change \{user_control_pill_color = [ 180 180 180 255 ]}
	add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
	LaunchEvent Type = Focus Target = <vmenu_id>
endscript

script destroy_online_options_menu
	if ScreenElementExists \{ Id = online_menu_ui_container }
		DestroyScreenElement \{ Id = online_menu_ui_container }
	endif
	if ScreenElementExists \{ Id = online_options_menu }
		DestroyScreenElement \{ Id = online_options_menu }
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script online_options_select_quickmatch_player
	ui_flow_manager_respond_to_action \{ action = select_quickmatch_pref }
endscript

script online_options_select_player_pref
	ui_flow_manager_respond_to_action \{ action = select_player_pref }
endscript

script create_online_quickmatch_prefs \{ menu_id = quickmatch_options_menu vmenu_id = quickmatch_options_vmenu }
	setup_options_globals
	game_mode_vmenu_id = game_mode_selection
	game_mode_text_id = game_mode_selection_text
	difficulty_vmenu_id = difficulty_selection
	difficulty_text_id = difficulty_selection_text
	num_songs_vmenu_id = number_of_songs_selection
	num_songs_text_id = number_of_songs_selection_text
	tie_breaker_vmenu_id = tie_breaker_selection
	tie_breaker_text_id = tie_breaker_selection_text
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = quickmatch_options_container Pos = (0.0, 0.0) }
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = quickmatch_options_container
		Id = <menu_id>
		just = [ center top ]
		dims = (500.0, 480.0)
		Pos = (640.0, 300.0)
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = (205.0, 0.0)
		just = [ center top ]
		internal_just = [ Left top ]
		dims = (500.0, 480.0)
		event_handlers = [
			{ pad_back check_for_options_change_go_back }
			{ pad_back generic_menu_pad_back_sound }
			{pad_up generic_menu_up_or_down_sound Params = { Up }}
			{pad_down generic_menu_up_or_down_sound Params = { Down }}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{ texture = Online_Background }
	displaySprite \{Id = online_frame PARENT = quickmatch_options_container tex = Online_Frame_Large Pos = (640.0, 100.0) just = [ center top ] z = 2}
	displaySprite \{Id = Online_Frame_Crown PARENT = quickmatch_options_container tex = Online_Frame_Crown Pos = (640.0, 42.0) just = [ center top ] z = 3 dims = (256.0, 105.0)}
	CreateScreenElement {
		Type = TextElement
		PARENT = quickmatch_options_container
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_dark_purple)
		text = "QUICK MATCH OPTIONS"
		Pos = (640.0, 135.0)
		just = [ center top ]
		z_priority = 10.0
	}
	CreateScreenElement {
		Type = TextElement
		Id = game_mode
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65
		rgba = ($online_light_blue)
		text = "GAME MODE:"
		just = [ Left top ]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = game_mode text_id = <game_mode_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus Params = { text_id = <game_mode_text_id> }}
			{pad_choose net_custom_ui_change_focus Params = {this_ID = game_mode text_id = <game_mode_text_id> to = <game_mode_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params Params = {copy_from = OptionsGameModeValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		Id = <game_mode_vmenu_id>
		PARENT = game_mode
		Pos = (550.0, 0.0)
		just = [ Left top ]
		internal_just = [ Left top ]
		event_handlers = [
			{pad_up animate_helper_arrows Params = { direction = Up }}
			{pad_down animate_helper_arrows Params = { direction = Down }}
			{pad_up net_custom_up_down Params = {text = <game_mode_text_id> Global = CopyOfGlobal Type = mode direction = Up}}
			{pad_down net_custom_up_down Params = {text = <game_mode_text_id> Global = CopyOfGlobal Type = mode direction = Down}}
			{pad_back net_commit_or_reset_params Params = {text = <game_mode_text_id> Global = OptionsGameModeValue Type = mode}}
			{pad_back net_custom_ui_change_unfocus Params = {action = back to = <vmenu_id> from = <game_mode_vmenu_id> menu = options}}
			{pad_choose net_commit_or_reset_params Params = {commit copy_from = CopyOfGlobal copy_to = OptionsGameModeValue}}
			{pad_choose net_custom_ui_change_unfocus Params = {action = choose to = <vmenu_id> from = <game_mode_vmenu_id> menu = options}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		Id = <game_mode_text_id>
		PARENT = <game_mode_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.mode.values [ ($OptionsGameModeValue) ])
		just = [ Left top ]
		z_priority = 10.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 375
	CreateScreenElement {
		Type = TextElement
		Id = difficulty
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65
		rgba = ($online_light_blue)
		text = "DIFFICULTY:"
		just = [ Left top ]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = difficulty text_id = <difficulty_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus Params = { text_id = <difficulty_text_id> }}
			{pad_choose net_custom_ui_change_focus Params = {this_ID = difficulty text_id = <difficulty_text_id> to = <difficulty_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params Params = {copy_from = OptionsDifficultyValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		Id = <difficulty_vmenu_id>
		PARENT = difficulty
		Pos = (550.0, 0.0)
		just = [ Left top ]
		internal_just = [ Left top ]
		event_handlers = [
			{pad_up animate_helper_arrows Params = { direction = Up }}
			{pad_down animate_helper_arrows Params = { direction = Down }}
			{pad_up net_custom_up_down Params = {text = <difficulty_text_id> Global = CopyOfGlobal Type = diff direction = Up}}
			{pad_down net_custom_up_down Params = {text = <difficulty_text_id> Global = CopyOfGlobal Type = diff direction = Down}}
			{pad_back net_commit_or_reset_params Params = {text = <difficulty_text_id> Global = OptionsDifficultyValue Type = diff}}
			{pad_back net_custom_ui_change_unfocus Params = {action = back to = <vmenu_id> from = <difficulty_vmenu_id> menu = options diff_focus}}
			{pad_choose net_commit_or_reset_params Params = {commit copy_from = CopyOfGlobal copy_to = OptionsDifficultyValue}}
			{pad_choose net_custom_ui_change_unfocus Params = {action = choose to = <vmenu_id> from = <difficulty_vmenu_id> menu = options diff_focus}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		Id = <difficulty_text_id>
		PARENT = <difficulty_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.diff.values [ ($OptionsDifficultyValue) ])
		just = [ Left top ]
		z_priority = 10.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 375
	CreateScreenElement {
		Type = TextElement
		Id = number_of_songs
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65
		rgba = ($online_light_blue)
		text = "NUMBER OF SONGS:"
		just = [ Left top ]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = number_of_songs text_id = <num_songs_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus Params = { text_id = <num_songs_text_id> }}
			{pad_choose net_custom_ui_change_focus Params = {this_ID = number_of_songs text_id = <num_songs_text_id> to = <num_songs_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params Params = {copy_from = OptionsNumSongsValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		Id = <num_songs_vmenu_id>
		PARENT = number_of_songs
		Pos = (550.0, 0.0)
		just = [ Left top ]
		internal_just = [ Left top ]
		event_handlers = [
			{pad_up animate_helper_arrows Params = { direction = Up }}
			{pad_down animate_helper_arrows Params = { direction = Down }}
			{pad_up net_custom_up_down Params = {text = <num_songs_text_id> Global = CopyOfGlobal Type = num_songs direction = Up}}
			{pad_down net_custom_up_down Params = {text = <num_songs_text_id> Global = CopyOfGlobal Type = num_songs direction = Down}}
			{pad_back net_commit_or_reset_params Params = {text = <num_songs_text_id> Global = OptionsNumSongsValue Type = num_songs}}
			{pad_back net_custom_ui_change_unfocus Params = {action = back to = <vmenu_id> from = <num_songs_vmenu_id> menu = options}}
			{pad_choose net_commit_or_reset_params Params = {commit copy_from = CopyOfGlobal copy_to = OptionsNumSongsValue}}
			{pad_choose net_custom_ui_change_unfocus Params = {action = choose to = <vmenu_id> from = <num_songs_vmenu_id> menu = options}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		Id = <num_songs_text_id>
		PARENT = <num_songs_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.num_songs.values [ ($OptionsNumSongsValue) ])
		just = [ Left top ]
		z_priority = 10.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 375
	CreateScreenElement {
		Type = TextElement
		Id = submit_selection
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65
		rgba = ($online_light_blue)
		text = "DONE"
		just = [ Left top ]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = submit_selection VMenu = <vmenu_id>}}
			{ unfocus net_custom_ui_unfocus }
			{ pad_choose check_for_options_change_go_forward }
		]
	}
	<vmenu_id> ::SetTags current_focus = first_time
	block_unblock_difficulty_actions \{ menu = options }
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	Change \{user_control_pill_text_color = [ 0 0 0 255 ]}
	Change \{user_control_pill_color = [ 180 180 180 255 ]}
	add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
	LaunchEvent Type = Focus Target = <vmenu_id>
endscript

script destroy_online_quickmatch_prefs
	if ScreenElementExists \{ Id = quickmatch_options_container }
		DestroyScreenElement \{ Id = quickmatch_options_container }
	endif
	if ScreenElementExists \{ Id = warning_message_container }
		DestroyScreenElement \{ Id = warning_message_container }
	endif
	clean_up_user_control_helpers
	destroy_menu \{ menu_id = quickmatch_options_menu }
	destroy_menu_backdrop
endscript

script create_online_player_prefs \{ menu_id = game_options_menu vmenu_id = game_options_vmenu }
	highway_layout_vmenu_id = highway_layout_selection
	highway_layout_text_id = highway_layout_selection_text
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = root_window
		Id = <menu_id>
		just = [ center top ]
		dims = (500.0, 480.0)
		Pos = (640.0, 330.0)
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = (250.0, 0.0)
		just = [ center top ]
		internal_just = [ Left top ]
		dims = (500.0, 480.0)
		event_handlers = [
			{ pad_back check_for_options_change_go_back }
			{ pad_back generic_menu_pad_back_sound }
			{pad_up generic_menu_up_or_down_sound Params = { Up }}
			{pad_down generic_menu_up_or_down_sound Params = { Down }}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{ texture = Online_Background }
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = player_options_container Pos = (0.0, 0.0) }
	displaySprite \{Id = online_frame PARENT = player_options_container tex = Online_Frame_Large Pos = (640.0, 100.0) just = [ center top ] z = 2}
	displaySprite \{Id = Online_Frame_Crown PARENT = player_options_container tex = Online_Frame_Crown Pos = (640.0, 42.0) just = [ center top ] z = 3 dims = (256.0, 105.0)}
	CreateScreenElement {
		Type = TextElement
		PARENT = player_options_container
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_dark_purple)
		text = "GAME OPTIONS"
		Pos = (640.0, 135.0)
		just = [ center top ]
		z_priority = 10.0
	}
	CreateScreenElement {
		Type = TextElement
		Id = highway_layout
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65
		rgba = ($online_light_blue)
		text = "HIGHWAY LAYOUT:"
		just = [ Left top ]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = highway_layout text_id = <highway_layout_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus Params = { text_id = <highway_layout_text_id> }}
			{pad_choose net_custom_ui_change_focus Params = {this_ID = highway_layout text_id = <highway_layout_text_id> to = <highway_layout_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params Params = {copy_from = OptionsHighwayValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		Id = <highway_layout_vmenu_id>
		PARENT = highway_layout
		Pos = (500.0, 0.0)
		just = [ Left top ]
		internal_just = [ Left top ]
		event_handlers = [
			{pad_up animate_helper_arrows Params = { direction = Up }}
			{pad_down animate_helper_arrows Params = { direction = Down }}
			{pad_up net_custom_up_down Params = {text = <highway_layout_text_id> Global = CopyOfGlobal Type = vport direction = Up}}
			{pad_down net_custom_up_down Params = {text = <highway_layout_text_id> Global = CopyOfGlobal Type = vport direction = Down}}
			{pad_back net_commit_or_reset_params Params = {text = <highway_layout_text_id> Global = OptionsHighwayValue Type = vport}}
			{pad_back net_custom_ui_change_unfocus Params = {action = back to = <vmenu_id> from = <highway_layout_vmenu_id>}}
			{pad_choose net_commit_or_reset_params Params = {commit copy_from = CopyOfGlobal copy_to = OptionsHighwayValue}}
			{pad_choose net_custom_ui_change_unfocus Params = {action = choose to = <vmenu_id> from = <highway_layout_vmenu_id>}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		Id = <highway_layout_text_id>
		PARENT = <highway_layout_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.vport.values [ ($OptionsHighwayValue) ])
		just = [ Left top ]
		z_priority = 10.0
	}
	CreateScreenElement {
		Type = TextElement
		Id = submit_selection
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65
		rgba = ($online_light_blue)
		text = "DONE"
		just = [ Left top ]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = submit_selection VMenu = <vmenu_id>}}
			{ unfocus net_custom_ui_unfocus }
			{ pad_choose check_for_options_change_go_forward }
		]
	}
	<vmenu_id> ::SetTags current_focus = first_time
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	Change \{user_control_pill_text_color = [ 0 0 0 255 ]}
	Change \{user_control_pill_color = [ 180 180 180 255 ]}
	add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
	LaunchEvent Type = Focus Target = <vmenu_id>
endscript

script destroy_online_player_prefs
	if ScreenElementExists \{ Id = player_options_container }
		DestroyScreenElement \{ Id = player_options_container }
	endif
	if ScreenElementExists \{ Id = game_options_menu }
		DestroyScreenElement \{ Id = game_options_menu }
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_online_options_changed_dialog \{ menu_id = online_options_changed_menu vmenu_id = online_options_changed_vmenu Pos = (500.0, 516.0) z = 100 }
	CreateScreenElement \{ Type = ContainerElement PARENT = quickmatch_options_container Id = warning_message_container Pos = (0.0, 0.0) }
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = warning_message_container
		Id = <menu_id>
		just = [ center top ]
		dims = (500.0, 150.0)
		Pos = (640.0, 465.0)
		z_priority = 15
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = (298.0, 0.0)
		just = [ center top ]
		internal_just = [ center top ]
		dims = (500.0, 150.0)
		event_handlers = [
			{ pad_back remove_save_dialog }
			{pad_up generic_menu_up_or_down_sound Params = { Up }}
			{pad_down generic_menu_up_or_down_sound Params = { Down }}
		]
	}
	<menu_pos> = (575.0, 487.0)
	<bookend_r_pos> = (745.0, 533.0)
	<bookend_l_pos> = (470.0, 533.0)
	Change \{menu_focus_color = [ 180 50 50 255 ]}
	Change \{menu_unfocus_color = [ 0 0 0 255 ]}
	create_pause_menu_frame \{ PARENT = warning_message_container z = 16 }
	displaySprite \{PARENT = warning_message_container tex = Dialog_Title_BG Scale = (1.7000000476837158, 1.7000000476837158) z = 19 Pos = (640.0, 100.0) just = [ Right top ] flip_v}
	displaySprite \{PARENT = warning_message_container tex = Dialog_Title_BG Scale = (1.7000000476837158, 1.7000000476837158) z = 19 Pos = (640.0, 100.0) just = [ Left top ]}
	displaySprite \{PARENT = warning_message_container tex = Dialog_Frame_Joiner Pos = (480.0, 510.0) rot_angle = 5 Scale = (1.5750000476837158, 1.5) z = 19}
	displaySprite \{PARENT = warning_message_container tex = Dialog_Frame_Joiner Pos = (750.0, 514.0) flip_v rot_angle = -5 Scale = (1.5750000476837158, 1.5) z = 19}
	displaySprite \{PARENT = warning_message_container tex = Dialog_BG Pos = (480.0, 500.0) Scale = (1.25, 1.0) z = 19 just = [ Left botom ]}
	displaySprite \{PARENT = warning_message_container tex = Dialog_BG Pos = (480.0, 530.0) Scale = (1.25, 1.0) z = 19 just = [ Left top ] flip_h}
	CreateScreenElement \{Type = TextElement PARENT = warning_message_container font = fontgrid_title_gh3 Scale = 1.3 rgba = [ 223 223 223 250 ] text = "WARNING" just = [ center top ] z_priority = 20.0 Pos = (640.0, 175.0) Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [ 0 0 0 255 ]}
	CreateScreenElement \{Type = TextBlockElement PARENT = warning_message_container font = fontgrid_title_gh3 Scale = 0.6 rgba = [ 210 210 210 250 ] text = $save_changes_message just = [ center top ] internal_just = [ center top ] z_priority = 20.0 Pos = (640.0, 290.0) dims = (700.0, 320.0) line_spacing = 1.0}
	CreateScreenElement \{Type = ContainerElement PARENT = online_options_changed_vmenu dims = (100.0, 50.0) event_handlers = [{ Focus net_warning_focus }{ unfocus net_warning_unfocus }{ pad_choose options_changed_select_save }]}
	container_id = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <container_id>
		local_id = text
		font = fontgrid_title_gh3
		Scale = (0.699999988079071, 0.8500000238418579)
		rgba = ($menu_unfocus_color)
		text = "SAVE CHANGES"
		just = [ center top ]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item Id = <Id> max_width = 240
	GetScreenElementDims Id = <Id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		Alpha = 1.0
		just = [ Right center ]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2))+ (-5.0, 0.0))
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		Alpha = 1.0
		just = [ Left center ]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2))+ (5.0, 0.0))
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
	}
	CreateScreenElement \{Type = ContainerElement PARENT = online_options_changed_vmenu dims = (100.0, 50.0) event_handlers = [{ Focus net_warning_focus }{ unfocus net_warning_unfocus }{ pad_choose options_changed_select_dont_save }]}
	container_id = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <container_id>
		local_id = text
		font = fontgrid_title_gh3
		Scale = (0.45000001788139343, 0.8500000238418579)
		rgba = ($menu_unfocus_color)
		text = "CONTINUE WITHOUT SAVING"
		just = [ center top ]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item Id = <Id> max_width = 240
	GetScreenElementDims Id = <Id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		just = [ Right center ]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2))+ (-5.0, 0.0))
		Alpha = 0.0
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		just = [ Left center ]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2))+ (5.0, 0.0))
		Alpha = 0.0
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
	}
	LaunchEvent Type = Focus Target = <vmenu_id>
endscript

script destroy_online_options_changed_dialog
	destroy_pause_menu_frame
	destroy_menu_backdrop
	if ScreenElementExists \{ Id = online_options_changed_menu }
		DestroyScreenElement \{ Id = online_options_changed_menu }
	endif
	if ScreenElementExists \{ Id = warning_message_container }
		DestroyScreenElement \{ Id = warning_message_container }
	endif
endscript

script options_changed_select_save
	FormatText \{ ChecksumName = player_status 'player1_status' }
	switch (($OptionsHighwayValue))
		case 0
			Change StructureName = <player_status> highway_layout = default_highway
		case 1
			Change StructureName = <player_status> highway_layout = solo_highway
	endswitch
	SetGlobalTags user_options Params = {
		online_game_mode = ($OptionsGameModeValue)
		online_difficulty = ($OptionsDifficultyValue)
		online_num_songs = ($OptionsNumSongsValue)
		online_tie_breaker = ($OptionsTieBreakerValue)
		online_highway = ($OptionsHighwayValue)
	}
	ui_flow_manager_respond_to_action \{ action = dialog_response_selected_save }
endscript

script options_changed_select_dont_save
	revert_option_changes
	ui_flow_manager_respond_to_action \{ action = dialog_response_selected_dont_save }
endscript

script check_for_options_change_go_forward
	if ScreenElementExists \{ Id = quickmatch_options_vmenu }
		LaunchEvent \{ Type = unfocus Target = quickmatch_options_vmenu }
	endif
	create_online_options_changed_dialog
endscript

script check_for_options_change_go_back
	if ((($OptionsGameModeValue)= ($TempGameModeValue))&
		(($OptionsDifficultyValue)= ($TempDifficultyValue))&
		(($OptionsNumSongsValue)= ($TempNumSongsValue))&
		(($OptionsTieBreakerValue)= ($TempTieBreakerValue))&
		(($OptionsHighwayValue)= ($TempHighwayValue)))
		ui_flow_manager_respond_to_action \{ action = go_back }
	else
		if ScreenElementExists \{ Id = quickmatch_options_vmenu }
			LaunchEvent \{ Type = unfocus Target = quickmatch_options_vmenu }
		endif
		create_online_options_changed_dialog
	endif
endscript

script save_intial_option_values
	Change TempGameModeValue = ($OptionsGameModeValue)
	Change TempDifficultyValue = ($OptionsDifficultyValue)
	Change TempNumSongsValue = ($OptionsNumSongsValue)
	Change TempTieBreakerValue = ($OptionsTieBreakerValue)
	Change TempHighwayValue = ($OptionsHighwayValue)
endscript

script revert_option_changes
	Change OptionsGameModeValue = ($TempGameModeValue)
	Change OptionsDifficultyValue = ($TempDifficultyValue)
	Change OptionsNumSongsValue = ($TempNumSongsValue)
	Change OptionsTieBreakerValue = ($TempTieBreakerValue)
	Change OptionsHighwayValue = ($TempHighwayValue)
endscript

script setup_options_globals
	GetGlobalTags \{ user_options }
	Change OptionsGameModeValue = <online_game_mode>
	Change OptionsDifficultyValue = <online_difficulty>
	Change OptionsNumSongsValue = <online_num_songs>
	Change OptionsTieBreakerValue = <online_tie_breaker>
	Change OptionsHighwayValue = <online_highway>
endscript

script remove_save_dialog
	if ScreenElementExists \{ Id = warning_message_container }
		DestroyScreenElement \{ Id = warning_message_container }
	endif
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	if ScreenElementExists \{ Id = quickmatch_options_vmenu }
		LaunchEvent \{ Type = Focus Target = quickmatch_options_vmenu }
	endif
endscript
