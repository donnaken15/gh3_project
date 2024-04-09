winport_bb_device_num = 0
winport_bb_text_color = [ 202 243 113 255 ]
winport_bb_text_dropshadow_color = [ 0 0 0 255 ]
winport_bb_text_highlight_color = [ 64 184 246 255 ]
winport_bb_text_disable_color = [ 139 198 17 255 ]
winport_bb_kb_menuItems = [
	{ text = "Green Fret / Confirm" handler = winport_bb_choose_control actionNum = 0 }
	{ text = "Red Fret / Cancel" handler = winport_bb_choose_control actionNum = 1 }
	{ text = "Yellow Fret" handler = winport_bb_choose_control actionNum = 2 }
	{ text = "Blue Fret" handler = winport_bb_choose_control actionNum = 3 }
	{ text = "Orange Fret" handler = winport_bb_choose_control actionNum = 4 }
	{ text = "Star Power" handler = winport_bb_choose_control actionNum = 5 }
	{ text = "Whammy" handler = winport_bb_choose_control actionNum = 12 }
	{ text = "Mouse Whammy" controlName = "X-Axis" handler = winport_null_script disable }
	{ text = "Strum Up / Menu Up" handler = winport_bb_choose_control actionNum = 10 }
	{ text = "Strum Down / Menu Down" handler = winport_bb_choose_control actionNum = 9 }
	{ text = "" handler = winport_null_script disable }
	{ text = "Reset to Default Keyboard/Mouse" handler = winport_bb_reset_to_config1 }
	{ text = "Reset to Default Keyboard" handler = winport_bb_reset_to_config2 }
]
winport_bb_menuItems = [
]

script winport_null_script
endscript

script winport_create_bind_buttons
	Change \{ winport_bb_menuItems = $winport_bb_kb_menuItems }
	menuDim = (600.0, 500.0)
	menuPos = (640.0, 370.0)
	menuItemDim = (600.0, 32.0)
	menuItemOptionDim = (250.0, 32.0)
	menuItemOptionPos = (0.0, 16.0)
	menuItemOptionJust = [ Left center ]
	menuItemValueDim = (300.0, 32.0)
	menuItemValuePos = (630.0, 16.0)
	menuItemValueJust = [ Right center ]
	menuItemHiliteDim = (665.0, 50.0)
	menuItemHilitePos = (-25.0, 34.0)
	menuItemHiliteJust = [ Left center ]
	menuItemHiliteRot = -0.5
	CreateScreenElement \{Type = ContainerElement PARENT = root_window Id = screen_container Pos = (0.0, 0.0) just = [ Left top ]}
	create_menu_backdrop \{ texture = Venue_BG }
	CreateScreenElement \{Type = SpriteElement Id = light_overlay PARENT = screen_container texture = Venue_Overlay Pos = (640.0, 360.0) dims = (1280.0, 720.0) just = [ center center ] z_priority = 100}
	displaySprite \{PARENT = screen_container tex = #"0xe6bb28d4" Pos = (640.0, 360.0) Scale = (1.5, 1.7000000476837158) just = [ center center ] z = 1 rot_angle = -2}
	CreateScreenElement \{Type = TextElement PARENT = screen_container text = "KEYBOARD" Pos = (830.0, 100.0) Scale = (1.5099999904632568, 1.2999999523162842) just = [ center center ] rgba = [ 202 243 113 255 ] font = text_A5 z_priority = 10 rot_angle = -2.8 Shadow shadow_rgba = [ 0 0 0 255 ] shadow_offs = (-3.0, 3.0)}
	displaySprite \{PARENT = screen_container tex = Tape_V_01 Pos = (205.0, 65.0) dims = (96.0, 192.0) z = 5 rot_angle = -1}
	displaySprite \{PARENT = screen_container tex = Tape_V_01 rgba = [ 0 0 0 128 ] Pos = (202.0, 68.0) dims = (96.0, 192.0) z = 4 rot_angle = -1}
	displaySprite \{PARENT = screen_container tex = Tape_H_02 Pos = (945.0, 550.0) dims = (132.0, 64.0) z = 5 rot_angle = 8}
	displaySprite \{PARENT = screen_container tex = Tape_H_02 rgba = [ 0 0 0 128 ] Pos = (942.0, 553.0) dims = (132.0, 64.0) z = 4 rot_angle = 8}
	CreateScreenElement {
		Type = VMenu
		Id = menu
		PARENT = screen_container
		Pos = <menuPos>
		dims = <menuDim>
		rot_angle = -2
		just = [ center center ]
		event_handlers = $default_event_handlers
	}
	menuTextProps = {
		Type = TextElement
		font = text_a11
		Scale = (0.699999988079071, 0.5)
		rgba = $winport_bb_text_color
		z_priority = 20
		Shadow
		shadow_rgba = $winport_bb_text_dropshadow_color
		shadow_offs = (-1.5, 1.5)
	}
	GetArraySize \{ $winport_bb_menuItems }
	i = 0
	begin
		FormatText ChecksumName = itemId 'item%d' d = <i>
		FormatText ChecksumName = actionId 'action%d' d = <i>
		FormatText ChecksumName = controlId 'control%d' d = <i>
		FormatText ChecksumName = hiliteId 'hilite%d' d = <i>
		CreateScreenElement {
			Type = ContainerElement
			Id = <itemId>
			PARENT = menu
			dims = <menuItemDim>
		}
		SetScreenElementProps {
			Id = <itemId>
			event_handlers = [
				{pad_choose (($winport_bb_menuItems [ <i> ]).handler)Params = {Index = <i> menuItem = ($winport_bb_menuItems [ <i> ])}}
				{Focus winport_bb_focus Params = { Index = <i> }}
				{unfocus winport_bb_unfocus Params = { Index = <i> }}
			]
		}
		CreateScreenElement {
			Type = SpriteElement
			Id = <hiliteId>
			PARENT = <itemId>
			texture = #"0x8040f1b7"
			Pos = <menuItemHilitePos>
			dims = <menuItemHiliteDim>
			just = <menuItemHiliteJust>
			rot_angle = <menuItemHiliteRot>
			Alpha = 0
			z_priority = 3
		}
		CreateScreenElement {
			<menuTextProps>
			Id = <actionId>
			text = (($winport_bb_menuItems [ <i> ]).text)
			PARENT = <itemId>
			dims = <menuItemOptionDim>
			Pos = <menuItemOptionPos>
			just = <menuItemOptionJust>
		}
		CreateScreenElement {
			<menuTextProps>
			Id = <controlId>
			text = ""
			PARENT = <itemId>
			dims = <menuItemValueDim>
			Pos = <menuItemValuePos>
			just = <menuItemValueJust>
		}
		if StructureContains Structure = ($winport_bb_menuItems [ <i> ])name = disable
			SetScreenElementProps Id = <itemId> not_focusable
			SetScreenElementProps Id = <actionId> rgba = $winport_bb_text_disable_color
			SetScreenElementProps Id = <controlId> rgba = $winport_bb_text_disable_color
		endif
		i = (<i> + 1)
	repeat <array_Size>
	winport_bb_update_option_values
	LaunchEvent \{ Type = Focus Target = menu }
	Change \{user_control_pill_text_color = [ 0 0 0 255 ]}
	Change \{user_control_pill_color = [ 180 180 180 255 ]}
	add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
endscript

script winport_destroy_bind_buttons
	DestroyScreenElement \{ Id = screen_container }
	clean_up_user_control_helpers
endscript

script winport_bb_update_option_values
	GetArraySize \{ $winport_bb_menuItems }
	i = 0
	begin
		FormatText ChecksumName = controlId 'control%d' d = <i>
		if StructureContains Structure = ($winport_bb_menuItems [ <i> ])name = actionNum
			WinPortSioGetControlBinding deviceNum = $winport_bb_device_num actionNum = (($winport_bb_menuItems [ <i> ]).actionNum)
			WinPortSioGetControlName deviceNum = $winport_bb_device_num controlNum = <controlNum>
			SetScreenElementProps Id = <controlId> text = <controlName>
		elseif StructureContains Structure = ($winport_bb_menuItems [ <i> ])name = controlName
			SetScreenElementProps Id = <controlId> text = (($winport_bb_menuItems [ <i> ]).controlName)
		endif
		i = (<i> + 1)
	repeat <array_Size>
endscript

script winport_bb_choose_control
	LaunchEvent \{ Type = unfocus Target = menu }
	winport_bb_focus Index = <Index>
	FormatText ChecksumName = controlId 'control%d' d = <Index>
	SetScreenElementProps Id = <controlId> rgba = $winport_bb_text_highlight_color
	winport_wait_for_no_control_press deviceNum = $winport_bb_device_num actionNum = (<menuItem>.actionNum)
	winport_wait_for_control_press deviceNum = $winport_bb_device_num actionNum = (<menuItem>.actionNum)
	winport_wait_for_no_control_press deviceNum = $winport_bb_device_num actionNum = (<menuItem>.actionNum)
	WinPortSioSetControlBinding deviceNum = $winport_bb_device_num actionNum = (<menuItem>.actionNum)controlNum = <controlNum>
	SetScreenElementProps Id = <controlId> rgba = $winport_bb_text_color
	winport_bb_update_option_values
	LaunchEvent \{ Type = Focus Target = menu }
endscript

script winport_bb_reset_to_config1
	GetArraySize \{ $winport_bb_menuItems }
	i = 0
	begin
		if StructureContains Structure = ($winport_bb_menuItems [ <i> ])name = actionNum
			WinPortSioSetControlBinding deviceNum = $winport_bb_device_num actionNum = (($winport_bb_menuItems [ <i> ]).actionNum)controlNum = -1
		endif
		i = (<i> + 1)
	repeat <array_Size>
	winport_bb_update_option_values
endscript

script winport_bb_reset_to_config2
	GetArraySize \{ $winport_bb_menuItems }
	i = 0
	begin
		if StructureContains Structure = ($winport_bb_menuItems [ <i> ])name = actionNum
			WinPortSioSetControlBinding deviceNum = $winport_bb_device_num actionNum = (($winport_bb_menuItems [ <i> ]).actionNum)controlNum = -2
		endif
		i = (<i> + 1)
	repeat <array_Size>
	winport_bb_update_option_values
endscript

script winport_bb_focus
	FormatText ChecksumName = hiliteId 'hilite%d' d = <Index>
	SetScreenElementProps Id = <hiliteId> Alpha = 1
endscript

script winport_bb_unfocus
	FormatText ChecksumName = hiliteId 'hilite%d' d = <Index>
	SetScreenElementProps Id = <hiliteId> Alpha = 0
endscript

script winport_wait_for_no_control_press
	begin
		if NOT WinPortSioGetControlPress deviceNum = <deviceNum> actionNum = <actionNum>
			break
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script winport_wait_for_control_press
	begin
		if WinPortSioGetControlPress deviceNum = <deviceNum> actionNum = <actionNum>
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	return controlNum = <controlNum>
endscript
