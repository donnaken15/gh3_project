
script sliderbar_rescale_to_bar
	<target1> = ((<value> - <min>)/ (<Max> - <min>))
	<target2> = (<Right> - <Left>)
	<target3> = (<target1> * <target2>)
	<rescaled_value> = (<target3> + <Left>)
	return x_val = <rescaled_value>
endscript

script sliderbar_add_item \{tab = tab1 font = text_a1 icon_rgba = [ 127 102 0 128 ] icon_scale = 0 icon_pos = (22.0, 9.0) text_just = [ center center ] text_pos = (0.0, 0.0) arrow_pos_up = (0.0, 8.0) arrow_pos_down = (0.0, -8.0) arrow_rgba = [ 100 90 80 255 ] up_arrow_texture = up_arrow down_arrow_texture = down_arrow dims = (0.0, 20.0)}
	if GotParam \{ is_enabled_script }
		<is_enabled_script>
		if (<success> = 0)
			return
		endif
	endif
	switch <tab>
		case tab1
			<bar_scale> = (0.9199999570846558, 1.2000000476837158)
		case tab2
			<bar_scale> = (0.8500000238418579, 1.2000000476837158)
		case tab3
			<bar_scale> = (0.7799999713897705, 1.2000000476837158)
			<font> = dialog
	endswitch
	SetScreenElementLock \{ Id = current_menu OFF }
	if NOT GotParam \{ pad_choose_params }
		<pad_choose_params> = <...>
	endif
	if GotParam \{ Index }
		if GotParam \{ pad_choose_params }
			<pad_choose_params> = (<pad_choose_params> + { parent_index = <Index> })
		else
			<pad_choose_params> = { parent_index = <Index> }
		endif
	endif
	<z_priority> = 300
	CreateScreenElement {
		Type = ContainerElement
		PARENT = current_menu
		Id = <anchor_id>
		dims = <dims>
		event_handlers = [{Focus <focus_script> Params = <focus_params>}
			{unfocus <unfocus_script> Params = <unfocus_params>}
			{pad_choose <pad_choose_script> Params = <pad_choose_params>}
		]
		<not_focusable>
		z_priority = <z_priority>
	}
	<parent_id> = <Id>
	if GotParam \{ Index }
		SetScreenElementProps {
			Id = <parent_id>
			tags = { tag_grid_x = <Index> }
		}
	endif
	if GotParam \{ not_focusable }
		<rgba> = [ 60 60 60 100 ]
	else
		rgba = [ 128 128 128 240 ]
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = <parent_id>
		font = text_a1
		text = <text>
		Scale = 0.5
		rgba = [128 , 128 , 128 , 255]
		just = <text_just>
		Pos = <text_pos>
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = (1.0, 1.0)
		Replace_Handlers
		<not_focusable>
	}
	highlight_angle = 0
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <parent_id>
		texture = DE_highlight_bar
		Pos = (-25.0, -7.0)
		rgba = [ 0 0 0 0 ]
		just = [ center center ]
		Scale = (1.899999976158142, 0.699999988079071)
		z_priority = -1
		rot_angle = <highlight_angle>
	}
	<Pos> = (-9.0, 0.0)
	if GotParam \{ bar_pos }
		<Pos> = <bar_pos>
	endif
	bar_rgba = [ 100 90 80 255 ]
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <parent_id>
		z_priority = 1
		Pos = <Pos>
		Scale = (8.0, 0.75)
		texture = roundbar_middle
		rgba = <bar_rgba>
	}
	DoScreenElementMorph Id = <Id> Alpha = 0 Time = 0
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <anchor_id>
		just = [ center bottom ]
		dims = { 200 , 200 }
		Pos = <arrow_pos_down>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <Id>
		Id = <down_arrow_id>
		texture = <down_arrow_texture>
		rgba = <arrow_rgba>
		Scale = 0.0
	}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <anchor_id>
		just = [ center top ]
		dims = { 200 , 200 }
		Pos = <arrow_pos_up>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <Id>
		Id = <up_arrow_id>
		texture = <up_arrow_texture>
		rgba = <arrow_rgba>
		Scale = 0.0
	}
	if GotParam \{ child_texture }
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <parent_id>
			texture = <child_texture>
			Pos = <icon_pos>
			rgba = <icon_rgba>
			Scale = <icon_scale>
			Id = <icon_id>
		}
	endif
	SetScreenElementLock \{ Id = current_menu ON }
endscript

script sliderbar_add_text_item
	SetScreenElementLock \{ Id = current_menu OFF }
	CreateScreenElement {
		Type = ContainerElement
		PARENT = current_menu
		event_handlers = [{Focus sliderbar_focus_text_item Params = <focus_params>}
			{ unfocus sliderbar_unfocus_text_item }
			{pad_choose <pad_choose_script> Params = <pad_choose_params>}
		]
		dims = (0.0, 20.0)
	}
	<parent_id> = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <parent_id>
		font = text_a1
		text = <text>
		Scale = 0.5
		rgba = [128 , 128 , 128 , 255]
		just = [ center top ]
		Pos = (-6.0, -6.0)
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = (1.0, 1.0)
	}
	bar_rgba = [ 100 90 80 255 ]
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <parent_id>
		z_priority = 1
		Scale = (8.0, 0.75)
		Pos = (-34.0, 2.0)
		texture = roundbar_middle
		rgba = <bar_rgba>
	}
	DoScreenElementMorph Id = <Id> Alpha = 0 Time = 0
	SetScreenElementLock \{ Id = current_menu ON }
endscript

script sliderbar_focus_text_item
	create_helper_text helper_pos = <helper_pos> $generic_helper_text_cas_z Scale = 0.9
	Obj_GetID
	Id = <ObjID>
	on_color = [ 128 123 20 255 ]
	SetScreenElementProps {
		Id = {<Id> child = 0}
		rgba = [ 90 80 70 255 ]
		shadow_rgba = [0 , 0 , 0 , 0]
	}
	DoScreenElementMorph Id = {<Id> child = 1}Alpha = 1 Time = 0
endscript

script sliderbar_unfocus_text_item
	Obj_GetID
	Id = <ObjID>
	SetScreenElementProps {
		Id = {<Id> child = 0}
		rgba = [ 110 110 110 255 ]
		shadow_rgba = $UI_text_shadow_color
	}
	DoScreenElementMorph Id = {<Id> child = 1}Alpha = 0 Time = 0
endscript
