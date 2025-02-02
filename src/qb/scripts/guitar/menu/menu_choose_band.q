choose_band_menu_font = text_a3

script create_choose_band_menu
	menu_pos = (400.0, 270.0)
	new_menu {
		scrollid = scrolling_choose_band
		vmenuid = vmenu_choose_band
		use_backdrop = 0
		menu_pos = <menu_pos>
		spacing = -9
	}
	set_focus_color \{rgba = [ 255 220 140 255 ]}
	set_unfocus_color \{rgba = [ 90 25 5 255 ]}
	create_menu_backdrop \{ texture = Toprockers_bg }
	rotation_angle = -2
	SetScreenElementProps \{ Id = scrolling_choose_band }
	SetScreenElementProps \{Id = vmenu_choose_band internal_just = [ center top ] dims = (650.0, 365.0)}
	CreateScreenElement \{ Type = ContainerElement Id = cb_helper_container PARENT = root_window Pos = (0.0, 0.0) }
	CreateScreenElement {
		Type = ContainerElement
		PARENT = root_window
		Pos = ($menu_pos)
		Id = choose_band_header_container
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = choose_band_header_container
		Id = big_blue_box
		just = [ Left bottom ]
		rgba = [ 30 110 160 0 ]
		Pos = (-283.0, 165.0)
		dims = (655.0, 80.0)
		rot_angle = <rotation_angle>
	}
	CreateScreenElement \{Type = SpriteElement PARENT = cb_helper_container Id = light_overlay texture = Venue_Overlay Pos = (640.0, 360.0) dims = (1280.0, 720.0) just = [ center center ] z_priority = 99}
	CreateScreenElement \{Type = SpriteElement PARENT = cb_helper_container Id = ticket_image texture = band_name_ticket rgba = [ 255 255 255 255 ] Pos = (640.0, 360.0) dims = (1280.0, 720.0) just = [ center center ] z_priority = 1}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = cb_helper_container
		Id = random_image
		texture = band_name_graphic03
		rgba = [ 255 255 255 255 ]
		Pos = (($enter_band_name_big_vals).right_side_img_pos)
		dims = (($enter_band_name_big_vals).right_side_img_dims)
		z_priority = 2
	}
	<rand> = 0
	GetRandomValue \{ name = rand Integer a = 0 b = 2 }
	if (<rand> = 0)
		SetScreenElementProps \{ Id = random_image texture = band_name_graphic01 }
	elseif (<rand> = 1)
		SetScreenElementProps \{ Id = random_image texture = band_name_graphic02 }
	elseif (<rand> = 2)
		SetScreenElementProps \{ Id = random_image texture = band_name_graphic03 }
	endif
	CreateScreenElement \{Type = SpriteElement PARENT = cb_helper_container Id = ticket_overlay texture = band_name_ticket_bar_overlay rgba = [ 255 255 255 255 ] Pos = (734.0, 360.0) dims = (684.0, 680.0) just = [ center center ] z_priority = 2}
	choose_band_text = "CHOOSE BAND"
	CreateScreenElement {
		Type = TextElement
		PARENT = big_blue_box
		just = [ Right bottom ]
		font = text_a10_Large
		rgba = [ 105 50 35 255 ]
		text = <choose_band_text>
		Scale = 1.75
	}
	fit_text_in_rectangle Id = <Id> dims = (850.0, 200.0) Pos = (510.0, 75.0)
	CreateScreenElement \{Type = SpriteElement PARENT = big_blue_box just = [ Right bottom ] Id = logo_vault_image texture = setlist_icon_generic Pos = (660.0, 96.0) dims = (128.0, 128.0) Blend = subtract}
	<cb_hlBar_pos> = [(6.0, 96.0) (6.0, 145.0) (6.0, 204.0) (8.0, 255.0) (9.0, 312.0)]
	<cb_hlBar_dims> = [(656.0, 48.0) (656.0, 58.0) (656.0, 48.0) (654.0, 58.0) (653.0, 54.0)]
	displaySprite {
		PARENT = big_blue_box
		tex = White
		rgba = [ 205 105 110 255 ]
		Pos = ((<cb_hlBar_pos>)[ 0 ])
		dims = ((<cb_hlBar_dims>)[ 0 ])
		z = 3
	}
	<cb_hlBarID> = <Id>
	<loop_count> = 5
	band_index = 1
	begin
		band_name = "- NEW BAND -"
		get_band_game_mode_name
		FormatText ChecksumName = bandname_id 'band%i_info_%g' i = <band_index> g = <game_mode_name>
		GetGlobalTags <bandname_id> param = name
		if NOT (<name> = "")
			<band_name> = <name>
		endif
		CreateScreenElement {
			Type = TextElement
			PARENT = vmenu_choose_band
			font = ($choose_band_menu_font)
			Scale = (1.100000023841858, 1.2999999523162842)
			rgba = ($menu_unfocus_color)
			text = <band_name>
			just = [ center top ]
			rot_angle = <rotation_angle>
			event_handlers = [
				{ Focus retail_menu_focus }
				{Focus SetScreenElementProps Params = {
						Id = <cb_hlBarID>
						Pos = ((<cb_hlBar_pos>)[(<band_index> - 1)])
						dims = ((<cb_hlBar_dims>)[(<band_index> - 1)])
					}
				}
				{ unfocus retail_menu_unfocus }
				{pad_choose menu_choose_band_make_selection Params = { band_index = <band_index> }}
			]
		}
		GetScreenElementDims Id = <Id>
		if (<width> > 500)
			SetScreenElementProps Id = <Id> Scale = (1.0, 1.2999999523162842)
		elseif (<width> > 300)
			SetScreenElementProps Id = <Id> Scale = (1.2000000476837158, 1.2999999523162842)
		else
			SetScreenElementProps Id = <Id> Scale = (1.5, 1.2999999523162842)
		endif
		<band_index> = (<band_index> + 1)
	repeat <loop_count>
	add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
endscript

script destroy_choose_band_menu
	clean_up_user_control_helpers
	destroy_menu \{ menu_id = scrolling_choose_band }
	destroy_menu \{ menu_id = choose_band_header_container }
	destroy_menu \{ menu_id = cb_helper_container }
	destroy_menu_backdrop
endscript

script menu_choose_band_make_selection
	Change current_band = <band_index>
	get_band_game_mode_name
	FormatText ChecksumName = bandname_id 'band%i_info_%g' i = <band_index> g = <game_mode_name>
	GetGlobalTags <bandname_id> param = name
	if (<name> = "")
		ui_flow_manager_respond_to_action \{ action = select_new_band }
	else
		ui_flow_manager_respond_to_action \{ action = select_existing_band }
	endif
endscript
