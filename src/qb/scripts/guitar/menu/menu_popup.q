popup_warning_menu_font = fontgrid_title_gh3
popup_event_handlers_options = [
	{
		pad_up
		generic_menu_up_or_down_sound
		Params = { Up }
	}
	{
		pad_down
		generic_menu_up_or_down_sound
		Params = { Down }
	}
]
popup_event_handlers_nooptions = [
]

script create_popup_warning_menu player_device = ($primary_controller)
	PrintStruct <...>
	<menu_pos> = (640.0, 510.0)
	<menu_bg_offset> = (0.0, -28.0)
	<event_handlers> = {}
	if GotParam \{ options }
		GetArraySize <options>
		if (<array_Size> > 1)
			<event_handlers> = ($popup_event_handlers_options)
			<menu_pos> = (640.0, 490.0)
			<menu_bg_offset> = (0.0, -8.0)
		endif
	endif
	new_menu {
		scrollid = pu_warning_scroll
		vmenuid = pu_warning_vmenu
		menu_pos = <menu_pos>
		spacing = -45
		internal_just = [ center center ]
		event_handlers = <event_handlers>
		exclusive_device = <player_device>
	}
	set_focus_color \{rgba = [ 130 0 0 250 ]}
	set_unfocus_color \{rgba = [ 0 0 0 255 ]}
	CreateScreenElement \{Type = ContainerElement PARENT = root_window Id = popup_warning_container Pos = (0.0, 0.0) just = [ Left top ]}
	if NOT (GotParam no_background)
		displaySprite \{PARENT = popup_warning_container tex = brick_bg Pos = (640.0, 360.0) dims = (1280.0, 720.0) just = [ center center ] z = 96}
	endif
	offWhite = [ 223 223 223 255 ]
	z = 100
	displaySprite PARENT = popup_warning_container tex = Dialog_Title_BG flip_v Pos = (416.0, 100.0) dims = (224.0, 224.0) z = <z>
	displaySprite PARENT = popup_warning_container tex = Dialog_Title_BG Pos = (640.0, 100.0) dims = (224.0, 224.0) z = <z>
	if GotParam \{ options }
		CreateScreenElement {
			Type = VMenu
			PARENT = popup_warning_container
			Id = options_bg_id
			Pos = (<menu_pos> + <menu_bg_offset>)
			just = [ center top ]
			internal_just = [ center center ]
		}
		displaySprite PARENT = options_bg_id tex = Dialog_BG z = <z>
		displaySprite PARENT = options_bg_id tex = Dialog_BG flip_h z = <z>
	endif
	create_pause_menu_frame z = (<z> - 4)
	create_popup_warning_text <...>
	if GotParam \{ options }
		create_popup_warning_menu_options <...>
	endif
endscript

script destroy_popup_warning_menu
	destroy_pause_menu_frame
	destroy_menu_backdrop
	destroy_menu \{ menu_id = pu_warning_scroll }
	destroy_menu \{ menu_id = popup_warning_container }
endscript

script create_popup_warning_text \{ Title = "WARNING" }
	<title_scale> = 1.2
	if GotParam \{ title_props }
		title_scale = (<title_props>.Scale)
	endif
	CreateScreenElement {
		Type = TextElement
		font = ($popup_warning_menu_font)
		text = <Title>
		just = [ center center ]
		Pos = (640.0, 217.0)
		Scale = <title_scale>
		PARENT = popup_warning_container
		rgba = [ 200 200 200 255 ]
		Shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [ 0 0 0 255 ]
		z_priority = (<z> + 2)
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> dims = (280 * (1.0, 0.0) + <height> * (0.0, 1.0))only_if_larger_x = 1 only_if_larger_y = 0 start_x_scale = <title_scale> start_y_scale = <title_scale>
	if GotParam \{ textblock }
		CreateScreenElement {
			Type = TextBlockElement
			font = ($popup_warning_menu_font)
			just = [ center center ]
			Pos = (640.0, 375.0)
			dims = (700.0, 400.0)
			Scale = 0.6
			PARENT = popup_warning_container
			rgba = [ 210 130 0 250 ]
			Shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [ 0 0 0 255 ]
			z_priority = (<z> + 2)
			<textblock>
		}
	endif
	if GotParam \{ TextElement }
		CreateScreenElement {
			Type = TextElement
			font = ($popup_warning_menu_font)
			just = [ center center ]
			Pos = (640.0, 430.0)
			Scale = 0.85
			PARENT = popup_warning_container
			rgba = [ 210 130 0 250 ]
			Shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [ 0 0 0 255 ]
			z_priority = (<z> + 2)
			<TextElement>
		}
	endif
endscript

script create_popup_warning_menu_option \{ max_option_width = 450 }
	<focus_params> = { use_highlight = 1 }
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		dims = (0.0, 90.0)
		event_handlers = [
			{Focus menu_popup_focus Params = <focus_params>}
			{unfocus menu_popup_unfocus Params = <focus_params>}
			{pad_choose (<option>.func)}
		]
	}
	<container_id> = <Id>
	CreateScreenElement {
		Type = HMenu
		PARENT = <container_id>
		internal_just = [ center top ]
		just = [ center center ]
	}
	<spacer_id> = <Id>
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <spacer_id>
		local_id = hi_left_spacer
		dims = (64.0, 64.0)
	}
	CreateScreenElement {
		Type = SpriteElement
		local_id = hi_left
		PARENT = <Id>
		texture = Dialog_Highlight
		rgba = [ 255 255 255 255 ]
		Pos = (58.0, 7.0)
		just = [ Right top ]
		z_priority = (<z> + 0.3)
		Alpha = 0
		flip_v
	}
	CreateScreenElement {
		Type = TextElement
		font = ($popup_warning_menu_font)
		PARENT = <spacer_id>
		local_id = text
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		just = [ center center ]
		z_priority = (<z> + 1)
		(<option>)
	}
	GetScreenElementDims Id = <Id>
	if GotParam \{ max_option_width }
		fit_text_in_rectangle Id = <Id> dims = (<max_option_width> * (1.0, 0.0) + <height> * (0.0, 1.0))only_if_larger_x = 1
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <spacer_id>
		local_id = hi_right_spacer
		dims = (64.0, 64.0)
	}
	CreateScreenElement {
		Type = SpriteElement
		local_id = hi_right
		PARENT = <Id>
		texture = Dialog_Highlight
		rgba = [ 255 255 255 255 ]
		Pos = (0.0, 7.0)
		just = [ Left top ]
		z_priority = (<z> + 1)
		Alpha = 0
	}
	SetScreenElementLock Id = <spacer_id> ON
	SetScreenElementLock Id = <container_id> ON
endscript

script create_popup_warning_menu_options
	<PARENT> = pu_warning_vmenu
	GetArraySize <options>
	<i> = 0
	begin
		create_popup_warning_menu_option option = (<options> [ <i> ])z = <z> num_options = <array_Size> PARENT = <PARENT> max_option_width = <max_option_width>
		<i> = (<i> + 1)
	repeat <array_Size>
	<largest_width> = 0
	GetScreenElementChildren \{ Id = pu_warning_vmenu }
	GetArraySize <children>
	<i> = 0
	begin
		GetScreenElementDims Id = {(<children> [ <i> ])child = 0}
		if (<largest_width> < <width>)
			<largest_width> = <width>
		endif
		<i> = (<i> + 1)
	repeat <array_Size>
	GetScreenElementChildren \{ Id = options_bg_id }
	GetArraySize <children>
	<i> = 0
	begin
		GetScreenElementDims Id = (<children> [ <i> ])
		SetScreenElementProps Id = (<children> [ <i> ])dims = (<largest_width> * (1.0, 0.0) + <height> * (0.0, 1.0) + (32.0, 0.0))preserve_flip
		<i> = (<i> + 1)
	repeat <array_Size>
endscript

script menu_popup_focus
	GetSingleTag \{ Id }
	ResolveScreenElementID Id = {<Id> child = { 0 child = text }}
	retail_menu_focus Id = <resolved_id>
	if (<use_highlight> = 1)
		DoScreenElementMorph Id = {<Id> child = {0 child = { hi_right_spacer child = 0 }}}Alpha = 1
		DoScreenElementMorph Id = {<Id> child = {0 child = { hi_left_spacer child = 0 }}}Alpha = 1
	endif
endscript

script menu_popup_unfocus
	GetSingleTag \{ Id }
	ResolveScreenElementID Id = {<Id> child = { 0 child = text }}
	retail_menu_unfocus Id = <resolved_id>
	if (<use_highlight> = 1)
		DoScreenElementMorph Id = {<Id> child = {0 child = { hi_right_spacer child = 0 }}}Alpha = 0
		DoScreenElementMorph Id = {<Id> child = {0 child = { hi_left_spacer child = 0 }}}Alpha = 0
	endif
endscript
