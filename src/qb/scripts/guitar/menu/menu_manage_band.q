manage_band_menu_font = text_A4

script create_manage_band_menu
	get_band_game_mode_name
	FormatText ChecksumName = bandname_id 'band%i_info_%g' i = ($current_band)g = <game_mode_name>
	GetGlobalTags <bandname_id>
	FormatText textname = the_bands_name "''%n''" n = <name>
	new_menu \{scrollid = mb_scroll vmenuid = mb_vmenu use_backdrop = 0 menu_pos = (732.0, 314.0) rot_angle = -2 spacing = 1}
	create_menu_backdrop \{ texture = Toprockers_bg }
	CreateScreenElement \{ Type = ContainerElement Id = mb_helper_container PARENT = root_window Pos = (0.0, 0.0) }
	CreateScreenElement \{Type = ContainerElement Id = mb_menu_container PARENT = mb_vmenu Pos = (0.0, 0.0) not_focusable}
	CreateScreenElement \{Type = SpriteElement PARENT = mb_helper_container Id = light_overlay texture = Venue_Overlay Pos = (640.0, 360.0) dims = (1280.0, 720.0) just = [ center center ] z_priority = 99}
	CreateScreenElement \{Type = SpriteElement PARENT = mb_helper_container Id = ticket_image texture = band_name_ticket rgba = [ 255 255 255 255 ] Pos = (640.0, 360.0) dims = (1280.0, 720.0) just = [ center center ] z_priority = 1}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = mb_helper_container
		Id = mb_random_image
		texture = band_name_graphic03
		rgba = [ 255 255 255 255 ]
		Pos = (($enter_band_name_big_vals).right_side_img_pos)
		dims = (($enter_band_name_big_vals).right_side_img_dims)
		z_priority = 2
	}
	<rand> = 0
	GetRandomValue \{ name = rand Integer a = 0 b = 2 }
	if (<rand> = 0)
		SetScreenElementProps \{ Id = mb_random_image texture = band_name_graphic01 }
	elseif (<rand> = 1)
		SetScreenElementProps \{ Id = mb_random_image texture = band_name_graphic02 }
	elseif (<rand> = 2)
		SetScreenElementProps \{ Id = mb_random_image texture = band_name_graphic03 }
	endif
	<manage_band_pos> = (725.0, 190.0)
	CreateScreenElement {
		Type = TextElement
		PARENT = mb_helper_container
		Pos = <manage_band_pos>
		font = text_a10_Large
		rgba = [ 90 25 5 255 ]
		text = "MANAGE BAND"
		Scale = 1.75
		z_priority = 3
		rot_angle = -2
	}
	fit_text_in_rectangle Id = <Id> dims = (850.0, 200.0) Pos = <manage_band_pos>
	CreateScreenElement {
		Type = TextElement
		PARENT = mb_helper_container
		Pos = (<manage_band_pos> + (0.0, 110.0))
		font = ($choose_band_menu_font)
		rgba = [ 230 230 200 255 ]
		text = <the_bands_name>
		Scale = (1.75, 1.25)
		z_priority = 3
		rot_angle = -2
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 600)
		fit_text_in_rectangle Id = <Id> dims = (1000.0, 70.0) Pos = (<manage_band_pos> + (0.0, 110.0))
	endif
	displaySprite {
		PARENT = mb_helper_container
		tex = White
		rgba = [ 90 25 5 255 ]
		Pos = (<manage_band_pos> + (-325.0, 92.0))
		dims = (656.0, 48.0)
		z = 3
		rot_angle = -2
	}
	<mb_hlBar_pos_1> = (408.0, 385.0)
	<mb_hlBar_pos_2> = (408.0, 441.0)
	<mb_hlBar_dims> = (654.0, 58.0)
	displaySprite {
		Id = mb_hlBarID
		PARENT = mb_helper_container
		tex = White
		rgba = [ 205 105 110 255 ]
		Pos = <mb_hlBar_pos_1>
		dims = <mb_hlBar_dims>
		z = 3
		rot_angle = -2
	}
	CreateScreenElement {
		Id = mb_rename_band_id
		PARENT = mb_menu_container
		Type = TextElement
		font = ($choose_band_menu_font)
		rgba = ($menu_unfocus_color)
		text = "RENAME	BAND"
		just = [ center top ]
	}
	CreateScreenElement {
		PARENT = mb_vmenu
		Type = TextElement
		font = ($choose_band_menu_font)
		text = ""
		Scale = 1.3
		just = [ center top ]
		event_handlers = [
			{Focus SetScreenElementProps Params = {
					Id = mb_hlBarID
					Pos = <mb_hlBar_pos_1>
				}
			}
			{Focus manage_band_highlighter Params = { Id = mb_rename_band_id Select }}
			{unfocus manage_band_highlighter Params = { Id = mb_rename_band_id unselect }}
			{ pad_choose menu_manage_band_rename_band }
		]
	}
	CreateScreenElement {
		Id = mb_delete_band_id
		PARENT = mb_menu_container
		Type = TextElement
		font = ($choose_band_menu_font)
		rgba = [ 90 25 5 255 ]
		text = "DELETE	BAND"
		just = [ center top ]
		Pos = (0.0, 56.0)
	}
	CreateScreenElement {
		PARENT = mb_vmenu
		Type = TextElement
		font = ($choose_band_menu_font)
		text = ""
		just = [ center top ]
		event_handlers = [
			{Focus SetScreenElementProps Params = {
					Id = mb_hlBarID
					Pos = <mb_hlBar_pos_2>
				}
			}
			{Focus SetScreenElementProps Params = {
					Id = mb_delete_band_id
					Scale = 1.3
					rgba = [ 255 220 140 255 ]
				}
			}
			{unfocus SetScreenElementProps Params = {
					Id = mb_delete_band_id
					Scale = 1.0
					rgba = [ 90 25 5 255 ]
				}
			}
			{ pad_choose menu_manage_band_delete_band }
		]
	}
	add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
endscript

script manage_band_highlighter
	if GotParam \{ Select }
		SetScreenElementProps Id = <Id> Scale = 1.3 rgba = [ 255 220 140 255 ]
		GetScreenElementDims Id = <Id>
		if (<width> > 634)
			fit_text_in_rectangle Id = <Id> dims = ((626.0, 0.0) + ((0.0, 1.0) * <height>))start_x_scale = 1.3 start_y_scale = 1.3
		endif
	elseif GotParam \{ unselect }
		SetScreenElementProps Id = <Id> Scale = 1.0 rgba = [ 90 25 5 255 ]
		GetScreenElementDims Id = <Id>
		if (<width> > 634)
			fit_text_in_rectangle Id = <Id> dims = ((626.0, 0.0) + ((0.0, 1.0) * <height>))start_x_scale = 1.0 start_y_scale = 1.0
		endif
	endif
endscript

script destroy_manage_band_menu
	destroy_menu \{ menu_id = mb_scroll }
	destroy_menu \{ menu_id = mb_helper_container }
	destroy_menu \{ menu_id = mb_menu_container }
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script menu_manage_band_rename_band
	ui_flow_manager_respond_to_action \{ action = select_rename_band }
endscript

script menu_manage_band_delete_band
	ui_flow_manager_respond_to_action \{ action = select_delete_band }
endscript