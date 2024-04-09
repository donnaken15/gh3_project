login_settings_menu_font = text_a10

script create_login_settings_menu
	create_menu_backdrop \{ texture = Venue_BG }
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = login_settings_container }
	rot = -3
	displaySprite PARENT = login_settings_container tex = data_settings_poster Pos = (640.0, 360.0) dims = (384.0, 768.0) just = [ center center ] rot_angle = <rot>
	Change \{menu_unfocus_color = [ 60 60 30 255 ]}
	Change \{menu_focus_color = [ 235 240 200 255 ]}
	text_params = {
		Type = TextElement
		font = $login_settings_menu_font
		rgba = $menu_unfocus_color
		rot_angle = <rot>
		z_priority = 5
	}
	new_menu \{scrollid = cds_scroll vmenuid = cds_vmenu menu_pos = (830.0, 105.0) spacing = -10 default_colors = 0 just = [ center top ]}
	CreateScreenElement \{Type = ContainerElement PARENT = cds_vmenu dims = (200.0, 52.0) event_handlers = [{ Focus menu_login_settings_on_focus }{ unfocus menu_login_settings_on_unfocus }{ pad_choose menu_login_settings_on_select }]}
	CreateScreenElement {
		<text_params>
		PARENT = <Id>
		text = "AUTO LOGIN ON"
		Id = login_on_id
		rot_angle = -3
	}
	CreateScreenElement \{Type = ContainerElement PARENT = cds_vmenu dims = (200.0, 52.0) event_handlers = [{ Focus menu_login_settings_off_focus }{ unfocus menu_login_settings_off_unfocus }{ pad_choose menu_login_settings_off_select }]}
	CreateScreenElement {
		<text_params>
		PARENT = <Id>
		text = "AUTO LOGIN OFF"
		Id = login_off_id
		rot_angle = -1
		Shadow
		shadow_rgba = [ 175 175 150 255 ]
		shadow_offs = (5.0, 5.0)
	}
	CreateScreenElement \{Type = ContainerElement PARENT = cds_vmenu dims = (200.0, 52.0) event_handlers = [{ Focus menu_login_settings_prompt_focus }{ unfocus menu_login_settings_prompt_unfocus }{ pad_choose menu_login_settings_prompt_select }]}
	CreateScreenElement {
		<text_params>
		PARENT = <Id>
		text = "ALWAYS PROMPT"
		Id = login_prompt_id
		Shadow
		shadow_rgba = [ 175 175 150 255 ]
		shadow_offs = (5.0, 5.0)
	}
	SetScreenElementLock \{ Id = login_prompt_id OFF }
	SetScreenElementLock \{ Id = login_prompt_id ON }
	GetScreenElementDims \{ Id = login_prompt_id }
	fit_text_in_rectangle Id = login_prompt_id dims = ((140.0, 0.0) + (0.0, 1.0) * <height>)only_if_larger_x = 1
	<checkmark_tex> = data_settings_checkmark
	CreateScreenElement {
		Type = SpriteElement
		PARENT = login_settings_container
		Id = login_checkmark_id
		Pos = ($login_settings_hilite_pos.loginPrompt + (100.0, -10.0))
		just = [ center center ]
		texture = <checkmark_tex>
		z_priority = 5
		rot_angle = <rot>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = login_settings_container
		Pos = ($login_settings_hilite_pos.loginOn)
		Id = ds_hilite
		just = [ center center ]
		texture = data_settings_hilite
		z_priority = 4
		rgba = [ 180 55 25 255 ]
		rot_angle = <rot>
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = login_settings_container
		text = "AUTO LOGIN SETTING"
		font = text_a10
		Pos = (650.0, 600.0)
		just = [ center center ]
		z_priority = 5
		rgba = [ 223 223 223 255 ]
		rot_angle = <rot>
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> dims = ((240.0, 0.0) + (0.0, 1.0) * <height>)Pos = (650.0, 600.0) only_if_larger_x = 1
	CreateScreenElement \{Type = SpriteElement PARENT = login_settings_container texture = Tape_H_02 Pos = (480.0, 90.0) z_priority = 20 dims = (128.0, 64.0) flip_h flip_v}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <Id>
		texture = Tape_H_02
		Pos = (10.0, 10.0)
		rgba = [ 0 0 0 128 ]
		just = [ Left top ]
		z_priority = 19
	}
	CreateScreenElement \{Type = SpriteElement PARENT = login_settings_container texture = Tape_H_02 Pos = (800.0, 630.0) z_priority = 20 dims = (128.0, 64.0) rot_angle = -25}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <Id>
		texture = Tape_H_02
		Pos = (10.0, 10.0)
		rgba = [ 0 0 0 128 ]
		just = [ Left top ]
		z_priority = 19
	}
	CreateScreenElement \{Type = SpriteElement PARENT = login_settings_container texture = tape_V_02 Pos = (820.0, 260.0) z_priority = 20 dims = (64.0, 128.0) rot_angle = -25 flip_v}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <Id>
		texture = tape_V_02
		Pos = (-20.0, 20.0)
		rgba = [ 0 0 0 128 ]
		just = [ Left top ]
		z_priority = 19
	}
	CreateScreenElement \{Type = SpriteElement PARENT = login_settings_container texture = Venue_Overlay Pos = (640.0, 360.0) just = [ center center ] dims = (1280.0, 720.0) z_priority = 99 rgba = [ 255 255 255 255 ]}
	Change \{user_control_pill_text_color = [ 0 0 0 255 ]}
	Change \{user_control_pill_color = [ 180 180 180 255 ]}
	add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
	NetSessionFunc \{ func = GetAutoLoginSetting }
	switch <autoLoginSetting>
		case autoLoginOff
			menu_login_settings_place_checkmark Pos = ($login_settings_hilite_pos.loginOff + (135.0, -10.0))Time = 0
		case autoLoginOn
			menu_login_settings_place_checkmark Pos = ($login_settings_hilite_pos.loginOn + (135.0, -10.0))Time = 0
		case autoLoginUnknown
		case autoLoginPrompt
			menu_login_settings_place_checkmark Pos = ($login_settings_hilite_pos.loginPrompt + (135.0, -10.0))Time = 0
	endswitch
endscript

script destroy_login_settings_menu \{ Destroy = 1 }
	if (<Destroy>)
		clean_up_user_control_helpers
		destroy_menu \{ menu_id = login_settings_container }
		destroy_menu \{ menu_id = cds_scroll }
	endif
endscript
login_settings_hilite_pos = { loginOn = (630.0, 141.0) loginOff = (630.0, 180.0) loginPrompt = (630.0, 225.0) }

script menu_login_settings_on_focus
	retail_menu_focus \{ Id = login_on_id }
	if ScreenElementExists \{ Id = login_on_id }
		login_on_id ::SetProps \{ no_shadow }
	endif
	if ScreenElementExists \{ Id = ds_hilite }
		ds_hilite ::DoMorph Pos = ($login_settings_hilite_pos.loginOn)Time = 0.05
	endif
endscript

script menu_login_settings_on_unfocus
	retail_menu_unfocus \{ Id = login_on_id }
	if ScreenElementExists \{ Id = login_on_id }
		login_on_id ::SetProps \{Shadow shadow_rgba = [ 175 175 150 255 ] shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_login_settings_off_focus
	retail_menu_focus \{ Id = login_off_id }
	if ScreenElementExists \{ Id = login_off_id }
		login_off_id ::SetProps \{ no_shadow }
	endif
	if ScreenElementExists \{ Id = ds_hilite }
		ds_hilite ::DoMorph Pos = ($login_settings_hilite_pos.loginOff)Time = 0.05
	endif
endscript

script menu_login_settings_off_unfocus
	retail_menu_unfocus \{ Id = login_off_id }
	if ScreenElementExists \{ Id = login_off_id }
		login_off_id ::SetProps \{Shadow shadow_rgba = [ 175 175 150 255 ] shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_login_settings_prompt_focus
	retail_menu_focus \{ Id = login_prompt_id }
	if ScreenElementExists \{ Id = login_prompt_id }
		login_prompt_id ::SetProps \{ no_shadow }
	endif
	if ScreenElementExists \{ Id = ds_hilite }
		ds_hilite ::DoMorph Pos = ($login_settings_hilite_pos.loginPrompt)Time = 0.05
	endif
endscript

script menu_login_settings_prompt_unfocus
	retail_menu_unfocus \{ Id = login_prompt_id }
	if ScreenElementExists \{ Id = login_prompt_id }
		login_prompt_id ::SetProps \{Shadow shadow_rgba = [ 175 175 150 255 ] shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_login_settings_on_select
	menu_login_settings_place_checkmark Pos = ($login_settings_hilite_pos.loginOn + (135.0, -10.0))Time = 0.25
	NetSessionFunc \{func = SetAutoLoginSetting Params = { autoLoginSetting = autoLoginOn }}
endscript

script menu_login_settings_off_select
	menu_login_settings_place_checkmark Pos = ($login_settings_hilite_pos.loginOff + (135.0, -10.0))Time = 0.25
	NetSessionFunc \{func = SetAutoLoginSetting Params = { autoLoginSetting = autoLoginOff }}
endscript

script menu_login_settings_prompt_select
	menu_login_settings_place_checkmark Pos = ($login_settings_hilite_pos.loginPrompt + (135.0, -10.0))Time = 0.25
	NetSessionFunc \{func = SetAutoLoginSetting Params = { autoLoginSetting = autoLoginPrompt }}
endscript

script menu_login_settings_place_checkmark
	SoundEvent \{ Event = Generic_menu_back_SFX }
	if ScreenElementExists \{ Id = login_checkmark_id }
		login_checkmark_id ::DoMorph Pos = <Pos> Time = <Time>
	endif
endscript
