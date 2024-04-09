menu_choose_practice_destroy_previous_menu = 1
menu_choose_practice_speed_font = text_a3

script create_choose_practice_speed_menu
	disable_pause
	if ScreenElementExists \{ Id = cps_menu }
		LaunchEvent \{ Type = unfocus Target = cps_menu }
	endif
	if ScreenElementExists \{ Id = newspaper_vmenu }
		LaunchEvent \{ Type = unfocus Target = newspaper_vmenu }
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound Params = { Up }}
		{pad_down generic_menu_up_or_down_sound Params = { Down }}
		{ pad_back practice_speed_go_back }
	]
	new_menu scrollid = cps_scroll vmenuid = cps_vmenu menu_pos = (640.0, 280.0) spacing = -70 event_handlers = <event_handlers>
	Change \{menu_unfocus_color = [ 250 245 195 255 ]}
	Change \{menu_focus_color = [ 250 245 195 255 ]}
	text_params = {
		PARENT = cps_vmenu
		Type = TextElement
		font = ($menu_choose_practice_speed_font)
		rgba = ($menu_unfocus_color)
		z_priority = 700
		Scale = 1.2
		just = [ center center ]
	}
	menu_z = 500
	CreateScreenElement \{ Type = ContainerElement Id = cps_speed_container PARENT = root_window Pos = (0.0, 0.0) }
	displaySprite \{PARENT = cps_speed_container Pos = (640.0, 360.0) just = [ Right bottom ] tex = #"0x0d5b4718" dims = (320.0, 320.0) z = 600 flip_v}
	displaySprite \{PARENT = cps_speed_container Pos = (640.0, 360.0) just = [ Left bottom ] tex = #"0x0d5b4718" dims = (320.0, 320.0) z = 600}
	displaySprite \{PARENT = cps_speed_container Pos = (640.0, 360.0) just = [ Left top ] tex = #"0x0d5b4718" dims = (320.0, 320.0) z = 600 flip_h}
	CreateScreenElement \{Type = SpriteElement PARENT = cps_speed_container Pos = (640.0, 360.0) just = [ Right top ] texture = #"0x0d5b4718" dims = (320.0, 320.0) z_priority = 600 flip_v flip_h}
	displaySprite \{PARENT = cps_speed_container Id = cps_hilite tex = White z = 550 rgba = [ 215 120 40 255 ] just = [ center center ] z = 699}
	displaySprite \{PARENT = cps_speed_container Id = cps_hilite_be1 tex = character_hub_hilite_bookend z = 550 rgba = [ 215 120 40 255 ] just = [ Right center ] z = 699}
	displaySprite \{PARENT = cps_speed_container Id = cps_hilite_be2 tex = character_hub_hilite_bookend z = 550 rgba = [ 215 120 40 255 ] just = [ Left center ] z = 699}
	CreateScreenElement \{Type = SpriteElement PARENT = cps_speed_container texture = gradient_128 rgba = [ 0 0 0 180 ] Pos = (0.0, 0.0) dims = (1280.0, 720.0) just = [ Left top ] z_priority = 500}
	CreateScreenElement \{Type = TextElement PARENT = cps_speed_container text = "Select Speed" font = text_a10 rgba = [ 215 120 40 255 ] Scale = 1.5 Pos = (640.0, 240.0) just = [ center center ] z_priority = 700}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{Focus practice_choose_speed_hilite Params = {Id = ps_fullspeed Pos = (640.0, 337.0)}}
			{unfocus retail_menu_unfocus Params = { Id = ps_fullspeed }}
			{pad_choose menu_choose_practice_speed_set_speed Params = { Speed = full }}
		]
	}
	CreateScreenElement {
		<text_params>
		PARENT = <Id>
		Id = ps_fullspeed
		text = "Full Speed"
	}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{Focus practice_choose_speed_hilite Params = {Id = ps_slow Pos = (640.0, 385.0)}}
			{unfocus retail_menu_unfocus Params = { Id = ps_slow }}
			{pad_choose menu_choose_practice_speed_set_speed Params = { Speed = Slow }}
		]
	}
	CreateScreenElement {
		<text_params>
		PARENT = <Id>
		Id = ps_slow
		text = "Slow"
	}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{Focus practice_choose_speed_hilite Params = {Id = ps_slower Pos = (640.0, 434.0)}}
			{unfocus retail_menu_unfocus Params = { Id = ps_slower }}
			{pad_choose menu_choose_practice_speed_set_speed Params = { Speed = slower }}
		]
	}
	CreateScreenElement {
		<text_params>
		PARENT = <Id>
		Id = ps_slower
		text = "Slower"
	}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{Focus practice_choose_speed_hilite Params = {Id = ps_slowest Pos = (640.0, 484.0)}}
			{unfocus retail_menu_unfocus Params = { Id = ps_slowest }}
			{pad_choose menu_choose_practice_speed_set_speed Params = { Speed = slowest }}
		]
	}
	CreateScreenElement {
		<text_params>
		PARENT = <Id>
		Id = ps_slowest
		text = "Slowest"
	}
	Change \{ menu_choose_practice_destroy_previous_menu = 0 }
endscript

script destroy_choose_practice_speed_menu
	if ($shutdown_game_for_signin_change_flag = 1)
		Change \{ menu_choose_practice_destroy_previous_menu = 1 }
	endif
	destroy_choose_practice_section_menu
	destroy_newspaper_menu
	destroy_menu \{ menu_id = cps_speed_container }
	destroy_menu \{ menu_id = cps_scroll }
endscript

script practice_speed_go_back
	Change \{ menu_choose_practice_destroy_previous_menu = 0 }
	menu_flow_go_back
endscript

script practice_choose_speed_hilite
	GetScreenElementDims Id = <Id>
	new_dims = (<width> * (1.25, 0.0) + (0.0, 45.0))
	SetScreenElementProps Id = cps_hilite Pos = <Pos> dims = <new_dims>
	SetScreenElementProps Id = cps_hilite_be1 Pos = (<Pos> - (<new_dims>.(0.5, 0.0) * (1.0, 0.0))+ (12.0, 0.0))
	SetScreenElementProps Id = cps_hilite_be2 Pos = (<Pos> + (<new_dims>.(0.5, 0.0) * (1.0, 0.0))- (4.0, 0.0))
endscript

script menu_choose_practice_speed_set_speed \{ Speed = full }
	switch <Speed>
		case full
			Change \{ current_speedfactor = 1.0 }
			Change \{ StructureName = PitchShiftSlow1 pitch = 1.0 }
		case Slow
			Change \{ current_speedfactor = 0.8 }
			Change \{ StructureName = PitchShiftSlow1 pitch = 1.25 }
		case slower
			Change \{ current_speedfactor = 0.666667 }
			Change \{ StructureName = PitchShiftSlow1 pitch = 1.5 }
		case slowest
			Change \{ current_speedfactor = 0.5 }
			Change \{ StructureName = PitchShiftSlow1 pitch = 2.0 }
	endswitch
	Change \{ menu_choose_practice_destroy_previous_menu = 1 }
	ui_flow_manager_respond_to_action action = continue device_num = (<device_num>)
endscript
