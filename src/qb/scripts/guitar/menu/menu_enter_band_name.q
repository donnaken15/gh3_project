new_band_name = [
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
]
new_band_flashing_char = "A"
new_band_flashing_index = 0
new_band_flashing_index_prev = 0
new_band_index = 0
max_band_characters = 19
ebn_transitioning_back = 0
default_band_characters = [
	"A"
	"B"
	"C"
	"D"
	"E"
	"F"
	"G"
	"H"
	"I"
	"J"
	"K"
	"L"
	"M"
	"N"
	"O"
	"P"
	"Q"
	"R"
	"S"
	"T"
	"U"
	"V"
	"W"
	"X"
	"Y"
	"Z"
	"1"
	"2"
	"3"
	"4"
	"5"
	"6"
	"7"
	"8"
	"9"
	"0"
	"!"
	"@"
	"#"
	"$"
	"^"
	"&"
	"*"
	"("
	")"
	"_"
	"+"
	"-"
	"="
	"/"
	" "
]
band_name_position = (725.0, 345.0)
default_band_indexes = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
enter_band_name_big_vals = {
	text_scale = 2.0
	text_pos = (685.0, 340.0)
	background_pos = (640.0, 360.0)
	background_dims = (1280.0, 720.0)
	header_pos = (730.0, 134.0)
	header_scale = 1.0
	tour_pos = (625.0, 410.0)
	tour_scale = 1.0
	address_pos = (625.0, 445.0)
	address_scale = 1.0
	date_pos = (625.0, 500.0)
	date_scale = 0.85
	sponsor_pos = (925.0, 402.0)
	sponsor_scale = 0.7
	sponsor_dims = (128.0, 128.0)
	sponsor_offset = (0.0, 20.0)
	right_side_img_pos = (1160.0, 330.0)
	right_side_img_dims = (196.0, 408.0)
}
enter_band_name_small_vals = {
	text_scale = 1.1
	text_pos = (650.0, 345.0)
	background_pos = (540.0, 360.0)
	background_dims = (1600.0, 900.0)
	header_pos = (652.0, 85.0)
	header_scale = 1.3
	tour_pos = (500.0, 425.0)
	tour_scale = 1.375
	address_pos = (500.0, 480.0)
	address_scale = 1.375
	date_pos = (500.0, 555.0)
	date_scale = 1.222
	sponsor_pos = (900.0, 410.0)
	sponsor_scale = 1.0
	sponsor_dims = (164.0, 164.0)
	sponsor_offset = (0.0, 26.0)
	right_side_img_pos = (1190.0, 330.0)
	right_side_img_dims = (245.0, 510.0)
}
us_month_names = [
	"January"
	"February"
	"March"
	"April"
	"May"
	"June"
	"July"
	"August"
	"September"
	"October"
	"November"
	"December"
]

script create_enter_band_name_menu
	SetScreenElementProps \{Id = root_window event_handlers = [{ pad_start null_script }] Replace_Handlers}
	enter_band_name_reset_variables
	rotation_angle = -2
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = ebn_container Pos = (0.0, 0.0) }
	CreateScreenElement \{Type = SpriteElement PARENT = ebn_container Id = menu_backdrop texture = Toprockers_bg rgba = [ 255 255 255 255 ] Pos = (640.0, 360.0) dims = (1280.0, 720.0) just = [ center center ] z_priority = 0}
	CreateScreenElement \{Type = SpriteElement PARENT = ebn_container Id = light_overlay texture = Venue_Overlay Pos = (640.0, 360.0) dims = (1280.0, 720.0) just = [ center center ] z_priority = 99}
	CreateScreenElement \{Type = SpriteElement PARENT = ebn_container Id = ticket_image texture = band_name_ticket rgba = [ 255 255 255 255 ] Pos = (640.0, 360.0) dims = (1280.0, 720.0) just = [ center center ] z_priority = 1}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = ebn_container
		Id = random_image
		texture = band_name_graphic03
		rgba = [ 255 255 255 255 ]
		Pos = (($enter_band_name_big_vals).right_side_img_pos)
		dims = (($enter_band_name_big_vals).right_side_img_dims)
		z_priority = 2
	}
	rand = 0
	GetRandomValue \{ name = rand Integer a = 0 b = 2 }
	if (<rand> = 0)
		SetScreenElementProps \{ Id = random_image texture = band_name_graphic01 }
	elseif (<rand> = 1)
		SetScreenElementProps \{ Id = random_image texture = band_name_graphic02 }
	elseif (<rand> = 2)
		SetScreenElementProps \{ Id = random_image texture = band_name_graphic03 }
	endif
	black = [ 70 10 10 255 ]
	Blue = [ 30 110 150 255 ]
	nameColor = [ 180 70 35 255 ]
	activeColor = [ 230 130 65 255 ]
	CreateScreenElement {
		Type = TextElement
		PARENT = ebn_container
		font = text_a10_Large
		text = "ENTER BAND NAME"
		Id = ebn_header_text
		Pos = (($enter_band_name_big_vals).header_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [ center top ]
		Scale = (($enter_band_name_big_vals).header_scale)
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = ebn_container
		font = text_a3
		text = "THE LEGENDS"
		Id = ebn_tour_text
		Pos = (($enter_band_name_big_vals).tour_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [ center top ]
		Scale = (($enter_band_name_big_vals).tour_scale)
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = ebn_container
		font = text_a3
		text = "OF ROCK TOUR"
		Id = ebn_address_text
		Pos = (($enter_band_name_big_vals).address_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [ center top ]
		Scale = (($enter_band_name_big_vals).address_scale)
	}
	GetLocalSystemTime
	if English
		GetUpperCaseString (($us_month_names)[(<localsystemtime>.month)])
		FormatText textname = date_text "%m %d, %y" m = (<UpperCaseString>)d = (<localsystemtime>.dayofmonth)Y = (<localsystemtime>.year)
	else
		GetUpperCaseString (($us_month_names)[(<localsystemtime>.month)])
		FormatText textname = date_text "%d %m %y" d = (<localsystemtime>.dayofmonth)m = (<UpperCaseString>)Y = (<localsystemtime>.year)
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = ebn_container
		font = text_a3
		text = <date_text>
		Id = ebn_date_text
		Pos = (($enter_band_name_big_vals).date_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [ center top ]
		Scale = (($enter_band_name_big_vals).date_scale)
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = ebn_container
		font = text_a3
		text = "SPONSORED BY:"
		Id = ebn_sponsor_text
		Pos = (($enter_band_name_big_vals).sponsor_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [ center top ]
		Scale = (($enter_band_name_big_vals).sponsor_scale)
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = ebn_container
		Id = logo_vault_image
		texture = setlist_icon_generic
		Pos = (($enter_band_name_big_vals).sponsor_pos + ($enter_band_name_big_vals).sponsor_offset)
		dims = (($enter_band_name_big_vals).sponsor_dims)
		rot_angle = <rotation_angle>
		just = [ center top ]
		Blend = subtract
	}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = ebn_container
		Id = band_name_text_container
		rot_angle = <rotation_angle>
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = band_name_text_container
		font = text_a3
		Scale = (($enter_band_name_big_vals).text_scale)
		rgba = <nameColor>
		Id = band_name_text
		Pos = (($enter_band_name_big_vals).text_pos)
		just = [ center center ]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = band_name_text_container
		font = text_a3
		Scale = (($enter_band_name_big_vals).text_scale)
		rgba = <activeColor>
		text = "A"
		Id = band_name_entry_char
		just = [ center center ]
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = band_name_text_container
		Id = ebn_marker
		texture = band_name_underline
		just = [ center center ]
		event_handlers = [
			{pad_up enter_band_name_change_character Params = { Up }}
			{pad_down enter_band_name_change_character Params = { Down }}
			{ pad_choose band_advance_pointer }
			{ pad_back band_retreat_pointer }
			{ pad_start confirm_band_name }
		]
		rgba = <activeColor>
		exclusive_device = ($primary_controller)
	}
	RunScriptOnScreenElement \{Id = ebn_marker blinker Params = { Id = ebn_marker Time = 0.5 }}
	RunScriptOnScreenElement \{Id = band_name_entry_char blinker Params = { Id = band_name_entry_char Time = 0.5 }}
	LaunchEvent \{ Type = Focus Target = ebn_marker }
	Change \{ ebn_transitioning_back = 0 }
	menu_ebn_update_marker
	enter_band_name_reset_user_control_helpers
endscript

script enter_band_name_reset_user_control_helpers
	add_user_control_helper \{ button = Green text = "NEXT" }
	add_user_control_helper \{ button = Red text = "BACK" }
	add_user_control_helper \{ button = strumbar text = "UP/DOWN" }
	add_user_control_helper \{ button = Start text = "ACCEPT" }
endscript

script enter_band_name_reset_variables
	Change \{new_band_name = ["" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""]}
	Change \{ new_band_index = 0 }
	Change \{default_band_indexes = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]}
	Change \{ new_band_flashing_char = "A" }
	Change \{ new_band_flashing_index = 0 }
endscript

script destroy_enter_band_name_menu
	destroy_menu \{ menu_id = ebn_container }
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script blinker
	if NOT ScreenElementExists Id = <Id>
		return
	endif
	begin
		DoScreenElementMorph Id = <Id> Alpha = 0 Time = <Time>
		wait <Time> seconds
		DoScreenElementMorph Id = <Id> Alpha = 1.0
		wait <Time> seconds
	repeat
endscript

script confirm_band_name
	if ($ebn_transitioning_back)
		return
	endif
	num_spaces = 0
	array_entry = 0
	<valid> = 0
	<need_unique> = 0
	begin
		if NOT ($new_band_name [ <array_entry> ] = "")
			if NOT ($new_band_name [ <array_entry> ] = " ")
				<valid> = 1
				break
			endif
		endif
		<array_entry> = (<array_entry> + 1)
	repeat ($max_band_characters)
	if (<valid> = 1)
		<prev_band_index> = ($current_band - 1)
		if (<prev_band_index> > 0)
			begin
				menu_ebn_get_band_name_text
				StringRemoveTrailingWhitespace string = <band_name_text_string>
				get_band_game_mode_name
				FormatText ChecksumName = bandname_id 'band%i_info_%g' i = <prev_band_index> g = <game_mode_name>
				GetGlobalTags <bandname_id> param = name
				if (<name> = <new_string>)
					<valid> = 0
					<need_unique> = 1
				endif
				<prev_band_index> = (<prev_band_index> - 1)
			repeat ($current_band - 1)
		endif
		<next_band_index> = ($current_band + 1)
		if (<next_band_index> < 6)
			begin
				menu_ebn_get_band_name_text
				StringRemoveTrailingWhitespace string = <band_name_text_string>
				get_band_game_mode_name
				FormatText ChecksumName = bandname_id 'band%i_info_%g' i = <next_band_index> g = <game_mode_name>
				GetGlobalTags <bandname_id> param = name
				if (<name> = <new_string>)
					<valid> = 0
					<need_unique> = 1
				endif
				<next_band_index> = (<next_band_index> + 1)
			repeat (5 - $current_band)
		endif
	endif
	if (<valid> = 0)
		SoundEvent \{ Event = Menu_Warning_SFX }
		enter_band_name_reset_variables
		menu_ebn_refresh_band_name
		menu_ebn_update_marker
		if ScreenElementExists \{ Id = ebn_marker }
			if (<need_unique> = 1)
				create_alert_popup \{ prev_menu_id = ebn_marker alert = "The Band Name you entered already exists.	Please enter a different Band Name." }
			else
				create_alert_popup \{ prev_menu_id = ebn_marker alert = "You must enter a Band Name to proceed!" }
			endif
		endif
	else
		menu_ebn_get_band_name_text
		StringRemoveTrailingWhitespace string = <band_name_text_string>
		get_band_game_mode_name
		FormatText ChecksumName = bandname_id 'band%i_info_%g' i = ($current_band)g = <game_mode_name>
		GetTrueStartTime
		FormatText ChecksumName = band_unique_id 'band%i_info_%g_%d' i = ($current_band)g = <game_mode_name> d = <starttime>
		SetGlobalTags <bandname_id> Params = {name = <new_string> band_unique_id = <band_unique_id>}
		agora_update band_id = <band_unique_id> name = <new_string> new_band
		if IsWinPort
			SaveToMemoryCard \{ FileName = $memcard_file_name filetype = Progress usepaddingslot = Always }
		endif
		if ($options_for_manage_band = 1)
			ui_flow_manager_respond_to_action \{ action = enter_band_name_for_manage_band }
		else
			ui_flow_manager_respond_to_action \{ action = enter_band_name }
		endif
	endif
endscript

script enter_band_name_change_character
	if GotParam \{ device_num }
		if IsGuitarController controller = <device_num>
			if GotParam \{ Up }
				change_character_down
			else
				change_character_up
			endif
		else
			if GotParam \{ Up }
				change_character_up
			else
				change_character_down
			endif
		endif
	endif
endscript

script enter_band_name_remove_focus
	LaunchEvent \{ Type = unfocus Target = scrolling_enter_band_name }
endscript

script enter_band_name_refocus
	LaunchEvent \{ Type = Focus Target = scrolling_enter_band_name }
endscript

script change_character_up
	generic_menu_up_or_down_sound \{ Up }
	Change new_band_flashing_index = ($new_band_flashing_index + 1)
	GetArraySize \{ $default_band_characters }
	if ($new_band_flashing_index > (<array_Size> -1))
		Change \{ new_band_flashing_index = 0 }
	endif
	Change new_band_flashing_char = ($default_band_characters [ $new_band_flashing_index ])
	menu_ebn_update_marker
endscript

script change_character_down
	generic_menu_up_or_down_sound \{ Down }
	Change new_band_flashing_index = ($new_band_flashing_index -1)
	if ($new_band_flashing_index < 0)
		GetArraySize \{ $default_band_characters }
		Change new_band_flashing_index = (<array_Size> -1)
	endif
	Change new_band_flashing_char = ($default_band_characters [ $new_band_flashing_index ])
	menu_ebn_update_marker
endscript

script band_advance_pointer
	if (($new_band_index + 1)< $max_band_characters)
		SoundEvent \{ Event = ui_sfx_select }
		SetArrayElement \{ ArrayName = new_band_name GlobalArray Index = $new_band_index NewValue = $new_band_flashing_char }
		Change \{ new_band_flashing_index_prev = $new_band_flashing_index }
		Change \{ new_band_flashing_index = 0 }
		Change \{ new_band_flashing_char = "A" }
		Change new_band_index = ($new_band_index + 1)
		menu_ebn_refresh_band_name
		if (($new_band_index + 1)= $max_band_characters)
			ebn_take_away_blinker
		endif
	endif
endscript

script ebn_take_away_blinker
	clean_up_user_control_helpers
	add_user_control_helper \{ button = Red text = "BACK" }
	add_user_control_helper \{ button = Start text = "ACCEPT" }
	SetScreenElementProps \{ Id = band_name_entry_char Hide }
	SetScreenElementProps \{ Id = ebn_marker Hide }
endscript

script band_retreat_pointer
	if ($new_band_index = 0)
		Change \{ ebn_transitioning_back = 1 }
		ui_flow_manager_respond_to_action \{ action = go_back }
		return
	endif
	if (($new_band_index -1)> -1)
		generic_menu_pad_back_sound
		Change new_band_index = ($new_band_index -1)
		Change new_band_flashing_char = ($new_band_name [ $new_band_index ])
		SetArrayElement \{ ArrayName = new_band_name GlobalArray Index = $new_band_index NewValue = "" }
		Change \{ new_band_flashing_index = $new_band_flashing_index_prev }
		menu_ebn_refresh_band_name
		if (($new_band_index + 2)= $max_band_characters)
			ebn_put_back_blinker
		endif
	endif
endscript

script ebn_put_back_blinker
	clean_up_user_control_helpers
	enter_band_name_reset_user_control_helpers
	SetScreenElementProps \{ Id = band_name_entry_char Unhide }
	SetScreenElementProps \{ Id = ebn_marker Unhide }
endscript

script menu_ebn_get_band_name_text
	FormatText textname = band_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t" a = ($new_band_name [ 0 ])b = ($new_band_name [ 1 ])c = ($new_band_name [ 2 ])d = ($new_band_name [ 3 ])e = ($new_band_name [ 4 ])f = ($new_band_name [ 5 ])g = ($new_band_name [ 6 ])h = ($new_band_name [ 7 ])i = ($new_band_name [ 8 ])j = ($new_band_name [ 9 ])k = ($new_band_name [ 10 ])l = ($new_band_name [ 11 ])m = ($new_band_name [ 12 ])n = ($new_band_name [ 13 ])o = ($new_band_name [ 14 ])p = ($new_band_name [ 15 ])q = ($new_band_name [ 16 ])r = ($new_band_name [ 17 ])s = ($new_band_name [ 18 ])t = ($new_band_name [ 19 ])
	return band_name_text_string = <band_name_text_string>
endscript
menu_ebn_width_threshold = 609
menu_ebn_backdrop_pos_change_factor = (100.0, 0.0)

script menu_ebn_refresh_band_name
	menu_ebn_get_band_name_text
	vals_struct = ($enter_band_name_big_vals)
	if ($new_band_index > 9)
		<vals_struct> = ($enter_band_name_small_vals)
	endif
	SetScreenElementProps Id = band_name_text text = (<band_name_text_string>)Scale = (<vals_struct>.text_scale)Pos = (<vals_struct>.text_pos)
	SetScreenElementProps Id = band_name_entry_char Scale = (<vals_struct>.text_scale)
	GetScreenElementDims \{ Id = band_name_text }
	SetScreenElementProps Id = menu_backdrop Pos = (<vals_struct>.background_pos)dims = (<vals_struct>.background_dims)
	SetScreenElementProps Id = ticket_image Pos = (<vals_struct>.background_pos)dims = (<vals_struct>.background_dims)
	SetScreenElementProps Id = ebn_header_text Pos = (<vals_struct>.header_pos)Scale = (<vals_struct>.header_scale)
	SetScreenElementProps Id = ebn_tour_text Pos = (<vals_struct>.tour_pos)Scale = (<vals_struct>.tour_scale)
	SetScreenElementProps Id = ebn_address_text Pos = (<vals_struct>.address_pos)Scale = (<vals_struct>.address_scale)
	SetScreenElementProps Id = ebn_date_text Pos = (<vals_struct>.date_pos)Scale = (<vals_struct>.date_scale)
	SetScreenElementProps Id = ebn_sponsor_text Pos = (<vals_struct>.sponsor_pos)Scale = (<vals_struct>.sponsor_scale)
	SetScreenElementProps Id = logo_vault_image Pos = ((<vals_struct>.sponsor_pos)+ (<vals_struct>.sponsor_offset))dims = (<vals_struct>.sponsor_dims)
	SetScreenElementProps Id = random_image Pos = ((<vals_struct>.right_side_img_pos))dims = (<vals_struct>.right_side_img_dims)
	menu_ebn_update_marker
endscript

script menu_ebn_update_marker
	vals_struct = ($enter_band_name_big_vals)
	if ($new_band_index > 9)
		<vals_struct> = ($enter_band_name_small_vals)
	endif
	SetScreenElementProps \{ Id = band_name_entry_char text = $new_band_flashing_char }
	GetScreenElementDims \{ Id = band_name_entry_char }
	new_width = <width>
	new_height = <height>
	fastscreenelementpos \{ Id = band_name_text }
	GetScreenElementDims \{ Id = band_name_text }
	new_pos = (<ScreenElementPos> + (1.0, 0.0) * 0.5 * <width> + (1.0, 0.0) * <new_width> * 0.5)
	SetScreenElementProps Id = band_name_entry_char text = $new_band_flashing_char Pos = <new_pos>
	GetScreenElementDims \{ Id = ebn_marker }
	SetScreenElementProps Id = ebn_marker dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <height>)Pos = (<new_pos> + (<new_height> * 0.4 * (0.0, 1.0)))
endscript
