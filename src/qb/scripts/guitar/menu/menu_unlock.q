
script find_unlocked_guitar_info_by_id
	GetArraySize ($Secret_Guitars)
	i = 0
	begin
		if (<Id> = ($Secret_Guitars [ <i> ].Id))
			return icon_texture = ($Secret_Guitars [ <i> ].icon_texture)
		endif
		<i> = (<i> + 1)
	repeat <array_Size>
	GetArraySize ($Secret_Basses)
	i = 0
	begin
		if (<Id> = ($Secret_Basses [ <i> ].Id))
			return icon_texture = ($Secret_Basses [ <i> ].icon_texture)
		endif
		<i> = (<i> + 1)
	repeat <array_Size>
endscript

script create_unlock_menu
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = unlock_container Pos = (0.0, 0.0) }
	find_unlocked_guitar_info_by_id Id = ($progression_unlocked_guitar)
	get_instrument_name_and_index Id = ($progression_unlocked_guitar)
	Change progression_unlocked_guitar = ($progression_unlocked_guitar2)
	Change \{ progression_unlocked_guitar2 = -1 }
	unlock_item_tex = <icon_texture>
	GetUpperCaseString <instrument_name>
	unlock_item_name = <UpperCaseString>
	unlock_font = text_A4
	padlock_pos_start = (850.0, 430.0)
	padlock_pos_end = (850.0, 412.0)
	create_menu_backdrop \{ texture = Unlock_BG }
	CreateScreenElement \{Type = SpriteElement Id = unlock_velvet_backdrop PARENT = unlock_container texture = Unlock_Velvet rgba = [ 255 255 255 255 ] Pos = (640.0, 320.0) dims = (865.0, 420.0) just = [ center center ] z_priority = -0.1}
	CreateScreenElement {
		Type = SpriteElement
		Id = unlock_item
		PARENT = unlock_container
		texture = <unlock_item_tex>
		rgba = [ 255 255 255 255 ]
		Pos = (640.0, 330.0)
		dims = (650.0, 325.0)
		just = [ center center ]
	}
	RunScriptOnScreenElement \{ Id = unlock_item unlock_guitar_hover }
	CreateScreenElement \{Type = SpriteElement Id = unlock_dialog_backdrop PARENT = unlock_container texture = Unlock_Dialog_BG rgba = [ 255 255 255 255 ] Pos = (850.0, 550.0) just = [ center center ]}
	CreateScreenElement {
		Type = SpriteElement
		Id = unlock_dialog_padlock
		PARENT = unlock_container
		texture = Unlock_Padlock
		rgba = [ 255 255 255 255 ]
		Pos = <padlock_pos_start>
		just = [ center center ]
	}
	CreateScreenElement {
		Type = TextElement
		Id = unlock_text_congrats
		PARENT = unlock_container
		Scale = (1.0, 1.0)
		text = "CONGRATULATIONS!"
		font_spacing = 0
		font = <unlock_font>
		rgba = [ 128 128 128 255 ]
		just = [ Left top ]
		z_priority = 3
	}
	fit_text_in_rectangle \{ Id = unlock_text_congrats dims = (350.0, 32.0) Pos = (680.0, 483.0) }
	CreateScreenElement {
		Type = TextElement
		Id = unlock_text_buyitinthestore
		PARENT = unlock_container
		Scale = (1.0, 1.0)
		text = "BUY IT IN THE STORE"
		font_spacing = 0
		font = <unlock_font>
		rgba = [ 128 128 128 255 ]
		just = [ Left top ]
		z_priority = 3
	}
	fit_text_in_rectangle \{ Id = unlock_text_buyitinthestore dims = (350.0, 32.0) Pos = (680.0, 555.0) }
	CreateScreenElement {
		Type = TextElement
		Id = unlock_text_name
		PARENT = unlock_container
		Scale = (1.0, 1.0)
		text = <unlock_item_name>
		Pos = (850.0, 505.0)
		font_spacing = 0
		font = <unlock_font>
		rgba = [ 128 32 32 255 ]
		just = [ center top ]
		z_priority = 3
	}
	fit_text_in_rectangle \{ Id = unlock_text_name only_if_larger_x = 1 dims = (345.0, 64.0) Pos = (850.0, 497.0) }
	CreateScreenElement {
		Type = TextElement
		PARENT = unlock_container
		Id = continue_button
		Scale = 0.8
		Pos = (400.0, 590.0)
		font = <unlock_font>
		rgba = [ 223 223 223 255 ]
		just = [ Left top ]
		z_priority = 3
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = { action = continue }}
		]
	}
	wait \{ 2 seconds }
	DoScreenElementMorph Id = unlock_dialog_padlock Pos = <padlock_pos_end> Time = 0.1 Motion = ease_in
	CreateScreenElement {
		Type = SpriteElement
		Id = unlock_dialog_starburst
		PARENT = unlock_container
		texture = Unlock_Starburst
		rgba = [ 255 255 255 255 ]
		Pos = <padlock_pos_end>
		just = [ center center ]
		z_priority = 3.1
		Scale = 0.1
		Alpha = 1
	}
	rot = 180
	Scale = 5
	Alpha = 0.0
	DoScreenElementMorph Id = unlock_dialog_starburst rot_angle = <rot> Scale = <Scale> Alpha = <Alpha> Pos = <padlock_pos_end> Time = 0.7 Motion = ease_out
	LaunchEvent \{ Type = Focus Target = continue_button }
	CreateScreenElement \{Type = SpriteElement Id = unlock_twinkle_1 PARENT = unlock_container texture = Unlock_Starburst rgba = [ 255 255 255 255 ] Pos = (350.0, 350.0) just = [ center center ] z_priority = 0 Scale = 0.5 Alpha = 0}
	RunScriptOnScreenElement \{ Id = unlock_twinkle_1 unlock_twinkle_anim }
	add_user_control_helper \{ text = "CONTINUE" button = Green z = 10000 }
endscript

script unlock_guitar_hover
	if NOT ScreenElementExists \{ Id = unlock_item }
		return
	endif
	begin
		unlock_item ::DoMorph \{Pos = { (0.0, -5.0) relative }rot_angle = 0 Motion = ease_out Time = 1}
		unlock_item ::DoMorph \{Pos = { (0.0, 5.0) relative }rot_angle = 1 Motion = ease_in Time = 1}
		unlock_item ::DoMorph \{Pos = { (0.0, -5.0) relative }rot_angle = 2 Motion = ease_out Time = 1}
		unlock_item ::DoMorph \{Pos = { (0.0, 5.0) relative }rot_angle = 1 Motion = ease_in Time = 1}
	repeat
endscript

script unlock_twinkle_anim
	if NOT ScreenElementExists \{ Id = unlock_twinkle_1 }
		return
	endif
	twinkle_time = 0.3
	Printf \{ "twinkling!" }
	begin
		unlock_twinkle_1 ::DoMorph \{ Pos = (350.0, 400.0) Scale = 0 Alpha = 0.5 rot_angle = 0 }
		unlock_twinkle_1 ::DoMorph rot_angle = -180 Scale = 1 Alpha = 0 Motion = ease_out Time = <twinkle_time>
		unlock_twinkle_1 ::DoMorph \{ Pos = (600.0, 200.0) Scale = 0 Alpha = 0.5 rot_angle = 0 }
		unlock_twinkle_1 ::DoMorph rot_angle = -180 Scale = 1 Alpha = 0 Motion = ease_out Time = <twinkle_time>
		unlock_twinkle_1 ::DoMorph \{ Pos = (900.0, 250.0) Scale = 0 Alpha = 0.5 rot_angle = 0 }
		unlock_twinkle_1 ::DoMorph rot_angle = -180 Scale = 1 Alpha = 0 Motion = ease_out Time = <twinkle_time>
		wait \{ 3 seconds }
	repeat
endscript

script destroy_unlock_menu
	clean_up_user_control_helpers
	destroy_menu \{ menu_id = unlock_container }
	destroy_menu_backdrop
endscript
