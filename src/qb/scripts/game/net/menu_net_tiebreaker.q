
script create_select_tie_breaker_menu \{ menu_title = "CREATE MATCH" menu_subtitle = "TIE BREAKER" menu_id = create_tie_breaker_menu vmenu_id = create_tie_breaker_vmenu }
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
		Scale = (0.6500000357627869, 0.75)
		rgba = ($online_light_blue)
		text = "HOST"
		just = [ Left top ]
		z_priority = 4.0
	}
	<Id> ::SetTags menu_item = <selectable_menu_items>
	<Id> ::SetProps event_handlers = [
		{Focus online_general_menu_focus Params = { Id = <Id> }}
		{ unfocus retail_menu_unfocus }
		{pad_choose select_tie_breaker Params = { Type = HOST }}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.6500000357627869, 0.75)
		rgba = ($online_light_blue)
		text = "CLIENT"
		just = [ Left top ]
		z_priority = 4.0
	}
	<Id> ::SetTags menu_item = <selectable_menu_items>
	<Id> ::SetProps event_handlers = [
		{Focus online_general_menu_focus Params = { Id = <Id> }}
		{ unfocus retail_menu_unfocus }
		{pad_choose select_tie_breaker Params = { Type = CLIENT }}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.6500000357627869, 0.75)
		rgba = ($online_light_blue)
		text = "RANDOM"
		just = [ Left top ]
		z_priority = 4.0
	}
	<Id> ::SetTags menu_item = <selectable_menu_items>
	<Id> ::SetProps event_handlers = [
		{Focus online_general_menu_focus Params = { Id = <Id> }}
		{ unfocus retail_menu_unfocus }
		{pad_choose select_tie_breaker Params = { Type = HOST }}
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

script destroy_select_tie_breaker_menu
	if ScreenElementExists \{ Id = online_menu_ui_container }
		DestroyScreenElement \{ Id = online_menu_ui_container }
	endif
	if ScreenElementExists \{ Id = create_tie_breaker_menu }
		DestroyScreenElement \{ Id = create_tie_breaker_menu }
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script select_tie_breaker
	Change tie_breaker = <Type>
	ui_flow_manager_respond_to_action \{ action = continue }
endscript
