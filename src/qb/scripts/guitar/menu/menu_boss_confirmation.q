
script create_boss_confirmation_screen
	new_menu \{ scrollid = bc_scroll vmenuid = bc_vmenu tile_sprite = 0 menu_pos = (605.0, 380.0) }
	create_pause_menu_frame
	text_params = {PARENT = bc_vmenu Type = TextElement font = text_A4 rgba = ($menu_unfocus_color)}
	CreateScreenElement {
		PARENT = bc_scroll Type = TextElement font = text_A4 rgba = ($menu_unfocus_color)
		text = "PLAY BOSS BATTLE?"
		Pos = { (35.0, -45.0) relative }
	}
	CreateScreenElement {
		<text_params>
		text = "YES"
		event_handlers = [
			{ Focus retail_menu_focus }
			{ unfocus retail_menu_unfocus }
			{pad_choose ui_flow_manager_respond_to_action Params = { action = choose_yes }}
		]
	}
	CreateScreenElement {
		<text_params>
		text = "NO"
		event_handlers = [
			{ Focus retail_menu_focus }
			{ unfocus retail_menu_unfocus }
			{pad_choose ui_flow_manager_respond_to_action Params = { action = choose_no }}
		]
	}
endscript

script destroy_boss_confirmation_screen
	destroy_menu \{ menu_id = bc_scroll }
	destroy_pause_menu_frame
endscript
