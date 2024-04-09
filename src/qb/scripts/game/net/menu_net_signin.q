loginTextColor = [ 255 200 0 255 ]
gPrivateMatchId = 0

script create_winport_connection_status_screen
	Printf \{ "--- create_winport_connection_status_screen" }
	create_menu_backdrop \{ texture = Online_Background }
	z = 110
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = connectionStatusContainer Pos = (0.0, 0.0) }
	CreateScreenElement \{Type = VScrollingMenu PARENT = connectionStatusContainer just = [ center top ] dims = (500.0, 150.0) Pos = (640.0, 465.0) z_priority = 1}
	menu_id = <Id>
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Pos = (298.0, 0.0)
		just = [ center top ]
		internal_just = [ center top ]
		dims = (500.0, 150.0)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound Params = { Up }}
			{pad_down generic_menu_up_or_down_sound Params = { Down }}
			{ pad_back cancel_winport_connection_status_screen }
		]
	}
	vmenu_id = <Id>
	Change \{menu_focus_color = [ 180 50 50 255 ]}
	Change \{menu_unfocus_color = [ 0 0 0 255 ]}
	create_pause_menu_frame \{ PARENT = connectionStatusContainer z = 5 }
	displaySprite \{PARENT = connectionStatusContainer tex = Dialog_Title_BG dims = (224.0, 224.0) z = 9 Pos = (640.0, 100.0) just = [ Right top ] flip_v}
	displaySprite \{PARENT = connectionStatusContainer tex = Dialog_Title_BG dims = (224.0, 224.0) z = 9 Pos = (640.0, 100.0) just = [ Left top ]}
	CreateScreenElement \{Type = TextElement PARENT = connectionStatusContainer font = fontgrid_title_gh3 Scale = 1.2 rgba = [ 223 223 223 250 ] text = "Online" just = [ center top ] z_priority = 10.0 Pos = (640.0, 182.0) Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [ 0 0 0 255 ]}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = connectionStatusContainer
		Id = statusMessage
		font = text_A4
		Scale = 0.8
		rgba = [ 210 210 210 250 ]
		just = [ center top ]
		internal_just = [ center top ]
		internal_scale = <Scale>
		z_priority = <z>
		Pos = (640.0, 310.0)
		dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	if NOT (NetSessionFunc func = IsConnected)
		add_user_control_helper \{ text = "CANCEL" button = Red z = 100 }
		LaunchEvent Type = Focus Target = <vmenu_id>
		NetSessionFunc \{ func = OnlineSignIn }
		begin
			NetSessionFunc \{ func = GetNetworkStatus }
			switch (<CurrentNetworkTask>)
				case "START_NETWORK"
					switch (<CurrentNetworkStatus>)
						case "PENDING"
							statusText = "Initializing Online Services"
						case "DONE"
							statusText = "Online Services Ready"
						case "FAILED"
							statusText = "Unable to Initialize Online Services"
							success = FALSE
						default
							statusText = "Internal Error: Unexpected Network State!"
							success = FALSE
					endswitch
				case "CHECK_DNS"
					switch (<CurrentNetworkStatus>)
						case "PENDING"
							statusText = "Locating Game Servers"
						case "DONE"
							statusText = "Game Servers Located"
							success = TRUE
						case "FAILED"
							statusText = "Unable to locate Game Servers"
							success = FALSE
						default
							statusText = "Internal Error: Unexpected Network State!"
							success = FALSE
					endswitch
				default
					statusText = "Internal Error: Unexpected Network State!"
					success = FALSE
			endswitch
			SetScreenElementProps Id = statusMessage text = <statusText>
			fit_text_into_menu_item \{ Id = statusMessage max_width = 480 }
			if GotParam \{ success }
				clean_up_user_control_helpers
				if (<success> = FALSE)
					add_user_control_helper \{ text = "BACK" button = Red z = 100 }
					return
				endif
				break
			endif
			wait \{ 1 Frame }
			if NOT (ScreenElementExists Id = connectionStatusContainer)
				return
			endif
		repeat
	endif
	if NOT (NetSessionFunc func = HasExistingLogin)
		SetScreenElementProps \{ Id = statusMessage text = "Existing Login Not Found.\\nDo you want to Create a New Account or Use an Existing Account?" }
		fit_text_into_menu_item \{ Id = statusMessage max_width = 480 }
		displaySprite \{PARENT = connectionStatusContainer Id = options_bg_1 tex = Dialog_BG Pos = (640.0, 500.0) dims = (320.0, 64.0) z = 9 just = [ center botom ]}
		displaySprite \{PARENT = connectionStatusContainer Id = options_bg_2 tex = Dialog_BG Pos = (640.0, 530.0) dims = (320.0, 64.0) z = 9 just = [ center top ] flip_h}
		CreateScreenElement {
			Type = ContainerElement
			PARENT = <vmenu_id>
			dims = (100.0, 50.0)
			event_handlers = [
				{ Focus net_warning_focus }
				{ unfocus net_warning_unfocus }
				{ pad_choose start_winport_account_create_screen }
				{ pad_back cancel_winport_connection_status_screen }
			]
		}
		container_id = <Id>
		CreateScreenElement {
			Type = TextElement
			PARENT = <container_id>
			local_id = text
			font = fontgrid_title_gh3
			Scale = 0.85
			rgba = ($menu_unfocus_color)
			text = "NEW ACCOUNT"
			just = [ center top ]
			z_priority = (<z> + 0.1)
		}
		fit_text_into_menu_item Id = <Id> max_width = 200
		GetScreenElementDims Id = <Id>
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_id>
			local_id = bookend_left
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [ Right center ]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2))+ (-5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_id>
			local_id = bookend_right
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [ Left center ]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2))+ (5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
		}
		CreateScreenElement {
			Type = ContainerElement
			PARENT = <vmenu_id>
			dims = (100.0, 50.0)
			event_handlers = [
				{ Focus net_warning_focus }
				{ unfocus net_warning_unfocus }
				{ pad_choose start_winport_account_login_screen }
				{ pad_back cancel_winport_connection_status_screen }
			]
		}
		container_id = <Id>
		CreateScreenElement {
			Type = TextElement
			PARENT = <container_id>
			local_id = text
			font = fontgrid_title_gh3
			Scale = 0.85
			rgba = ($menu_unfocus_color)
			text = "EXISTING ACCOUNT"
			just = [ center top ]
			z_priority = (<z> + 0.1)
		}
		fit_text_into_menu_item Id = <Id> max_width = 200
		GetScreenElementDims Id = <Id>
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_id>
			local_id = bookend_left
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [ Right center ]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2))+ (-5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_id>
			local_id = bookend_right
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [ Left center ]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2))+ (5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
		}
		add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
		add_user_control_helper \{ text = "BACK" button = Red z = 100 }
		add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
		LaunchEvent Type = Focus Target = <vmenu_id>
		return
	endif
	if NOT (NetSessionFunc func = IsLoggedIn)
		ui_flow_manager_respond_to_action \{ action = account_login }
	endif
	ui_flow_manager_respond_to_action \{ action = goto_online_menu }
endscript

script destroy_winport_connection_status_screen
	DestroyScreenElement \{ Id = connectionStatusContainer }
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script cancel_winport_connection_status_screen
	NetSessionFunc \{ func = ResetNetwork }
	ui_flow_manager_respond_to_action \{ action = back }
endscript

script create_winport_account_create_screen
	create_winport_account_management_screen \{ mode = createAccount Title = "Account Creation" container = accountCreateContainer }
endscript

script destroy_winport_account_create_screen
	destroy_winport_account_management_screen \{ container = accountCreateContainer }
endscript

script start_winport_account_create_screen
	ui_flow_manager_respond_to_action \{ action = account_create }
endscript

script create_winport_account_login_screen
	NetSessionFunc \{ func = GetAutoLoginSetting }
	if (<autoLoginSetting> = autoLoginOn & NetSessionFunc func = HasExistingLogin)
		NetSessionFunc \{func = InitializeLoginFields Params = { loginMode = loginAccount }}
		ui_flow_manager_respond_to_action \{ action = executeLogin }
	else
		create_winport_account_management_screen \{mode = loginAccount Title = "Account Login" container = accountLoginContainer yellowButtonText = "CHANGE PASSWORD" yellowButtonAction = start_winport_account_change_screen blueButtonText = "NEW ACCOUNT" blueButtonAction = start_winport_account_create_screen}
	endif
endscript

script destroy_winport_account_login_screen
	destroy_winport_account_management_screen \{ container = accountLoginContainer }
endscript

script start_winport_account_login_screen
	ui_flow_manager_respond_to_action \{ action = account_login }
endscript

script create_winport_account_change_screen
	create_winport_account_management_screen \{mode = changeAccount Title = "Change Password" container = accountChangeContainer yellowButtonText = "RESET PASSWORD" yellowButtonAction = start_winport_account_reset_screen}
endscript

script destroy_winport_account_change_screen
	destroy_winport_account_management_screen \{ container = accountChangeContainer }
endscript

script start_winport_account_change_screen
	ui_flow_manager_respond_to_action \{ action = account_change }
endscript

script create_winport_account_reset_screen
	create_winport_account_management_screen \{mode = resetAccount Title = "Reset Password" container = accountResetContainer yellowButtonText = "DELETE ACCOUNT" yellowButtonAction = start_winport_account_delete_screen}
endscript

script destroy_winport_account_reset_screen
	destroy_winport_account_management_screen \{ container = accountResetContainer }
endscript

script start_winport_account_reset_screen
	ui_flow_manager_respond_to_action \{ action = account_reset }
endscript

script create_winport_account_delete_screen
	create_winport_account_management_screen \{ mode = deleteAccount Title = "Delete Account" container = accountDeleteContainer }
endscript

script destroy_winport_account_delete_screen
	destroy_winport_account_management_screen \{ container = accountDeleteContainer }
endscript

script start_winport_account_delete_screen
	ui_flow_manager_respond_to_action \{ action = account_delete }
endscript

script create_change_password_submenu
	create_winport_account_management_screen \{ mode = changeAccount Title = "Change Password" container = accountChangeContainer yellowButtonAction = winport_null_action }
endscript

script destroy_change_password_submenu
	destroy_winport_account_management_screen \{ container = accountChangeContainer }
endscript

script create_account_delete_submenu
	create_winport_account_management_screen \{ mode = deleteAccount Title = "Delete Account" container = accountDeleteSubmenuContainer yellowButtonAction = winport_null_action }
endscript

script destroy_account_delete_submenu
	destroy_winport_account_management_screen \{ container = accountDeleteSubmenuContainer }
endscript

script winport_null_action
endscript

script create_winport_account_management_screen
	Printf \{ "--- create_winport_account_management_screen" }
	z = 110
	create_menu_backdrop \{ texture = Online_Background }
	if ((GotParam yellowButtonAction)& (GotParam blueButtonAction))
		Handlers = [
			{ Focus net_warning_focus }
			{ unfocus net_warning_unfocus }
			{pad_choose ui_flow_manager_respond_to_action Params = { action = executeLogin }}
			{ pad_option2 <yellowButtonAction> }
			{ pad_option <blueButtonAction> }
			{pad_back cancel_winport_account_management_screen Params = { mode = <mode> }}
		]
	elseif (GotParam yellowButtonAction)
		Handlers = [
			{ Focus net_warning_focus }
			{ unfocus net_warning_unfocus }
			{pad_choose ui_flow_manager_respond_to_action Params = { action = executeLogin }}
			{ pad_option2 <yellowButtonAction> }
			{pad_back cancel_winport_account_management_screen Params = { mode = <mode> }}
		]
	elseif (GotParam blueButtonAction)
		Handlers = [
			{ Focus net_warning_focus }
			{ unfocus net_warning_unfocus }
			{pad_choose ui_flow_manager_respond_to_action Params = { action = executeLogin }}
			{ pad_option <blueButtonAction> }
			{pad_back cancel_winport_account_management_screen Params = { mode = <mode> }}
		]
	else
		Handlers = [
			{ Focus net_warning_focus }
			{ unfocus net_warning_unfocus }
			{pad_choose ui_flow_manager_respond_to_action Params = { action = executeLogin }}
			{pad_back cancel_winport_account_management_screen Params = { mode = <mode> }}
		]
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = root_window
		Id = <container>
		Pos = (0.0, 0.0)
		event_handlers = <Handlers>
	}
	NetSessionFunc func = InitializeLoginFields Params = { loginMode = <mode> }
	displaySprite PARENT = <container> tex = Dialog_Title_BG dims = (300.0, 230.0) z = 9 Pos = (640.0, 40.0) just = [ Right top ] flip_v
	displaySprite PARENT = <container> tex = Dialog_Title_BG dims = (300.0, 230.0) z = 9 Pos = (640.0, 40.0) just = [ Left top ]
	CreateScreenElement {
		Type = TextElement
		PARENT = <container>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = [ 223 223 223 250 ]
		text = <Title>
		just = [ center top ]
		z_priority = 10.0
		Pos = (640.0, 125.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [ 0 0 0 255 ]
	}
	fit_text_in_rectangle Id = <Id> dims = (400.0, 75.0) Pos = (640.0, 125.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center
	CreateScreenElement {
		Type = TextElement
		PARENT = <container>
		Id = capsLockField
		font = text_A4
		Scale = 0.6
		rgba = [ 255 0 0 255 ]
		text = "(Caps Lock Is On)"
		just = [ center top ]
		z_priority = 10.0
		Pos = (640.0, 530.0)
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [ 0 0 0 255 ]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <container>
		font = text_A4
		Scale = 0.6
		rgba = [ 180 180 180 255 ]
		text = "Game Experience May Change During Online Play"
		just = [ center top ]
		z_priority = 10.0
		Pos = (640.0, 560.0)
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [ 0 0 0 255 ]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <container>
		font = text_A4
		Scale = 1.0
		rgba = [ 180 180 180 255 ]
		text = "*Please use the keyboard to enter all account information*"
		just = [ center top ]
		z_priority = 10.0
		Pos = (640.0, 595.0)
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [ 0 0 0 255 ]
	}
	fit_text_in_rectangle Id = <Id> dims = (600.0, 25.0) Pos = (640.0, 595.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center keep_ar = 1
	<Pos> = (375.0, 290.0)
	create_winport_login_field container = <container> Pos = <Pos> label = "Username: " labelId = usernameLabelId prefixId = usernamePrefixId cursorId = usernameCursorId suffixId = usernameSuffixId ang = -2.0
	GetScreenElementDims \{ Id = usernameLabelId }
	lineHeight = (<height> + 8)
	if (<mode> = loginAccount || <mode> = deleteAccount || <mode> = changeAccount)
		Pos = (<Pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field container = <container> Pos = <Pos> label = "Password: " labelId = passwordLabelId prefixId = passwordPrefixId cursorId = passwordCursorId suffixId = passwordSuffixId ang = 0.2
	endif
	if (<mode> = createAccount || <mode> = changeAccount || <mode> = resetAccount)
		Pos = (<Pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field container = <container> Pos = <Pos> label = "New Password: " labelId = newPassword1LabelId prefixId = newPassword1PrefixId cursorId = newPassword1CursorId suffixId = newPassword1SuffixId ang = -0.6
		Pos = (<Pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field container = <container> Pos = <Pos> label = "Repeat New Password: " labelId = newPassword2LabelId prefixId = newPassword2PrefixId cursorId = newPassword2CursorId suffixId = newPassword2SuffixId ang = 0.5
	endif
	if (<mode> = createAccount || <mode> = resetAccount)
		Pos = (<Pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field container = <container> Pos = <Pos> label = "License: " labelId = licenseLabelId prefixId = licensePrefixId cursorId = licenseCursorId suffixId = licenseSuffixId ang = 1.5
	endif
	add_user_control_helper \{ text = "ACCEPT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	if GotParam \{ yellowButtonText }
		add_user_control_helper text = <yellowButtonText> button = Yellow z = 100
	endif
	if GotParam \{ blueButtonText }
		add_user_control_helper text = <blueButtonText> button = Blue z = 100
	endif
	LaunchEvent Type = Focus Target = <container>
	begin
		if (IsCapsLockOn)
			SetScreenElementProps \{ Id = capsLockField Alpha = 1.0 }
		else
			SetScreenElementProps \{ Id = capsLockField Alpha = 0.0 }
		endif
		update_winport_login_field \{Field = username labelId = usernameLabelId prefixId = usernamePrefixId cursorId = usernameCursorId suffixId = usernameSuffixId}
		update_winport_login_field \{Field = password labelId = passwordLabelId prefixId = passwordPrefixId cursorId = passwordCursorId suffixId = passwordSuffixId}
		update_winport_login_field \{Field = newPassword1 labelId = newPassword1LabelId prefixId = newPassword1PrefixId cursorId = newPassword1CursorId suffixId = newPassword1SuffixId}
		update_winport_login_field \{Field = newPassword2 labelId = newPassword2LabelId prefixId = newPassword2PrefixId cursorId = newPassword2CursorId suffixId = newPassword2SuffixId}
		update_winport_login_field \{Field = license labelId = licenseLabelId prefixId = licensePrefixId cursorId = licenseCursorId suffixId = licenseSuffixId}
		wait \{ 1 Frame }
		if NOT (ScreenElementExists Id = <container>)
			return
		endif
		NetSessionFunc \{ func = GetLoginEntry }
		if (<loginEntry> = loginAccepted)
			break
		endif
		if (<loginEntry> = loginAborted)
			break
		endif
		if ((GotParam yellowButtonAction)& (<loginEntry> = loginOption1))
			Printf \{ "Got yellowButtonAction button" }
			break
		endif
		if ((GotParam blueButtonAction)& (<loginEntry> = loginOption2))
			Printf \{ "Got blueButtonAction button" }
			break
		endif
	repeat
	switch <loginEntry>
		case loginAccepted
			ui_flow_manager_respond_to_action \{ action = executeLogin }
		case loginOption1
			Printf \{ "Executing option 1" }
			ui_flow_manager_respond_to_action \{ action = executeOption1 }
		case loginOption2
			Printf \{ "Executing option 2" }
			ui_flow_manager_respond_to_action \{ action = executeOption2 }
		case loginAborted
			cancel_winport_account_management_screen mode = <mode>
	endswitch
endscript

script destroy_winport_account_management_screen
	NetSessionFunc \{ func = DestroyLoginFields }
	if (ScreenElementExists Id = <container>)
		DestroyScreenElement Id = <container>
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script cancel_winport_account_management_screen
	if (<mode> = loginAccount)
		if (NetSessionFunc func = HasExistingLogin)
			ui_flow_manager_respond_to_action \{ action = back_to_main }
		else
			ui_flow_manager_respond_to_action \{ action = back_to_connection_status }
		endif
	else
		ui_flow_manager_respond_to_action \{ action = back }
	endif
endscript

script create_winport_login_field
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <container>
		rot_angle = <ang>
	}
	rotContainer = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <rotContainer>
		Id = <labelId>
		font = fontgrid_title_gh3
		Scale = 0.8
		rgba = $loginTextColor
		text = <label>
		just = [ Left top ]
		z_priority = 10.0
		Pos = <Pos>
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [ 0 0 0 255 ]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <rotContainer>
		Id = <prefixId>
		font = fontgrid_title_gh3
		Scale = 0.8
		rgba = $loginTextColor
		text = ""
		just = [ Left top ]
		z_priority = 10.0
		Pos = (300.0, 300.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [ 0 0 0 255 ]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <rotContainer>
		Id = <cursorId>
		font = fontgrid_title_gh3
		Scale = (0.5, 0.800000011920929)
		rgba = $loginTextColor
		text = "I"
		just = [ Left top ]
		z_priority = 10.0
		Pos = (400.0, 300.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [ 0 0 0 255 ]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <rotContainer>
		Id = <suffixId>
		font = fontgrid_title_gh3
		Scale = 0.8
		rgba = $loginTextColor
		text = ""
		just = [ Left top ]
		z_priority = 10.0
		Pos = (500.0, 300.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [ 0 0 0 255 ]
	}
	RunScriptOnScreenElement Id = <cursorId> winport_cursor_blinker Params = { blinkId = <cursorId> }
endscript

script update_winport_login_field
	if NOT (ScreenElementExists Id = <labelId>)
		return
	endif
	NetSessionFunc func = GetLoginField Params = { Field = <Field> }
	if (<Active> = 1)
		SetScreenElementProps Id = <prefixId> text = <prefix>
		SetScreenElementProps Id = <cursorId> text = "I"
		SetScreenElementProps Id = <suffixId> text = <suffix>
	else
		SetScreenElementProps Id = <prefixId> text = <prefix>
		SetScreenElementProps Id = <cursorId> text = ""
		SetScreenElementProps Id = <suffixId> text = ""
	endif
	GetScreenElementDims Id = <labelId>
	GetScreenElementPosition Id = <labelId>
	Pos = (<ScreenElementPos> + ((1.0, 0.0) * <width>))
	SetScreenElementProps Id = <prefixId> Pos = <Pos>
	GetScreenElementPosition Id = <prefixId>
	GetScreenElementDims Id = <prefixId>
	Pos = (<ScreenElementPos> + ((1.0, 0.0) * <width>))
	SetScreenElementProps Id = <cursorId> Pos = <Pos>
	GetScreenElementPosition Id = <cursorId>
	GetScreenElementDims Id = <cursorId>
	Pos = (<ScreenElementPos> + ((1.0, 0.0) * <width>))
	SetScreenElementProps Id = <suffixId> Pos = <Pos>
endscript

script winport_cursor_blinker
	begin
		if NOT (ScreenElementExists Id = <blinkId>)
			return
		endif
		DoScreenElementMorph Id = <blinkId> Alpha = 0 Time = 0.5
		wait \{ 0.5 seconds }
		if NOT (ScreenElementExists Id = <blinkId>)
			return
		endif
		DoScreenElementMorph Id = <blinkId> Alpha = 1.0 Time = 0.5
		wait \{ 0.5 seconds }
	repeat
endscript

script create_winport_account_create_status_screen
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_create_status_screen
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_login_status_screen
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_login_status_screen
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_change_status_screen
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_change_status_screen
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_reset_status_screen
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_reset_status_screen
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_delete_status_screen
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_delete_status_screen
	destroy_winport_account_management_status_screen
endscript

script create_account_change_submenu_status_screen
	create_winport_account_management_status_screen
endscript

script destroy_account_change_submenu_status_screen
	destroy_winport_account_management_status_screen
endscript

script create_account_delete_submenu_status_screen
	create_winport_account_management_status_screen
endscript

script destroy_account_delete_submenu_status_screen
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_management_status_screen
	Printf \{ "--- create_winport_account_management_status_screen" }
	create_menu_backdrop \{ texture = Online_Background }
	z = 110
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = accountStatusContainer Pos = (0.0, 0.0) }
	CreateScreenElement \{Type = VScrollingMenu PARENT = accountStatusContainer just = [ center top ] dims = (500.0, 150.0) Pos = (640.0, 465.0) z_priority = 1}
	menu_id = <Id>
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = (298.0, 0.0)
		just = [ center top ]
		internal_just = [ center top ]
		dims = (500.0, 150.0)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound Params = { Up }}
			{pad_down generic_menu_up_or_down_sound Params = { Down }}
		]
	}
	vmenu_id = <Id>
	Change \{menu_focus_color = [ 180 50 50 255 ]}
	Change \{menu_unfocus_color = [ 0 0 0 255 ]}
	create_pause_menu_frame \{ PARENT = accountStatusContainer z = 5 }
	displaySprite \{PARENT = accountStatusContainer tex = Dialog_Title_BG dims = (224.0, 224.0) z = 9 Pos = (640.0, 100.0) just = [ Right top ] flip_v}
	displaySprite \{PARENT = accountStatusContainer tex = Dialog_Title_BG dims = (224.0, 224.0) z = 9 Pos = (640.0, 100.0) just = [ Left top ]}
	CreateScreenElement \{Type = TextElement PARENT = accountStatusContainer font = fontgrid_title_gh3 Scale = 1.2 rgba = [ 223 223 223 250 ] text = "Online" just = [ center top ] z_priority = 10.0 Pos = (640.0, 182.0) Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [ 0 0 0 255 ]}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = accountStatusContainer
		Id = statusMessage
		font = text_A4
		Scale = 0.8
		rgba = [ 210 210 210 250 ]
		just = [ center top ]
		internal_just = [ center top ]
		internal_scale = <Scale>
		z_priority = <z>
		Pos = (640.0, 310.0)
		dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	LaunchEvent Type = Focus Target = <vmenu_id>
	NetSessionFunc \{ func = ExecuteLoginTask }
	begin
		NetSessionFunc \{ func = GetNetworkStatus }
		switch (<CurrentNetworkTask>)
			case "CREATE_ACCOUNT"
				switch (<CurrentNetworkStatus>)
					case "PENDING"
						statusText = "Requesting Account Creation"
					case "DONE"
						statusText = "Account Created"
						success = TRUE
					case "FAILED"
						statusText = "Unable to Create Account"
						success = FALSE
					default
						statusText = "Internal Error: Unexpected Network State!"
						success = FALSE
				endswitch
			case "LOGIN_ACCOUNT"
				switch (<CurrentNetworkStatus>)
					case "PENDING"
						statusText = "Authorizing Account"
					case "DONE"
						statusText = "Account Authorized"
						success = TRUE
					case "FAILED"
						statusText = "Unable to Authorize Account"
						success = FALSE
					default
						statusText = "Internal Error: Unexpected Network State!"
						success = FALSE
				endswitch
			case "CHANGE_ACCOUNT"
				switch (<CurrentNetworkStatus>)
					case "PENDING"
						statusText = "Requesting Password Change"
					case "DONE"
						statusText = "Password Changed"
						success = TRUE
					case "FAILED"
						statusText = "Unable to Change Password"
						success = FALSE
					default
						statusText = "Internal Error: Unexpected Network State!"
						success = FALSE
				endswitch
			case "RESET_ACCOUNT"
				switch (<CurrentNetworkStatus>)
					case "PENDING"
						statusText = "Requesting Account Reset"
					case "DONE"
						statusText = "Account Password Reset"
						success = TRUE
					case "FAILED"
						statusText = "Unable to Reset Account"
						success = FALSE
					default
						statusText = "Internal Error: Unexpected Network State!"
						success = FALSE
				endswitch
			case "DELETE_ACCOUNT"
				switch (<CurrentNetworkStatus>)
					case "PENDING"
						statusText = "Requesting Account Deletion"
					case "DONE"
						statusText = "Account Deleted"
						success = TRUE
					case "FAILED"
						statusText = "Unable to Delete Account"
						success = FALSE
					default
						statusText = "Internal Error: Unexpected Network State!"
						success = FALSE
				endswitch
			default
				Printf "Unexpected state = %s" s = <CurrentNetworkTask>
				statusText = "Internal Error: Unexpected Network State!"
				success = FALSE
		endswitch
		SetScreenElementProps Id = statusMessage text = <statusText>
		fit_text_into_menu_item \{ Id = statusMessage max_width = 480 }
		if GotParam \{ success }
			break
		endif
		wait \{ 1 Frame }
		if NOT (ScreenElementExists Id = accountStatusContainer)
			return
		endif
	repeat
	if (<success> = FALSE)
		NetSessionFunc \{ func = GetAutoLoginSetting }
		if (<autoLoginSetting> = autoLoginOn & NetSessionFunc func = HasExistingLogin)
			NetSessionFunc \{func = SetAutoLoginSetting Params = { autoLoginSetting = autoLoginPrompt }}
		endif
		NetSessionFunc \{ func = GetFailureCode }
		switch <FailureCode>
			case 666
				statusText = "New password fields do not match"
			case 667
				statusText = "Authorization Service failed"
			case 668
				statusText = "Usernames must be between 6 and 16 characters long"
			case 669
				statusText = "Passwords must be between 6 and 16 characters long"
			case 700
				statusText = "Task Succeeded"
			case 701
				statusText = "Bad Authorization Request"
			case 702
				statusText = "Server Configuration Error"
			case 703
				statusText = "Invalid Game Title Id"
			case 704
				statusText = "Invalid Account Information"
			case 705
				statusText = "Illegal Authorization Request"
			case 706
				statusText = "Invalid License Code"
			case 707
				statusText = "Username Already Exists"
			case 708
				statusText = "Invalid Username Format"
			case 709
				statusText = "Username Declined"
			case 710
				statusText = "Too Many Accounts for License Code"
			case 711
				statusText = "Account Migration not Supported"
			case 712
				statusText = "Title has been disabled"
			case 713
				statusText = "Account has Expired"
			case 714
				statusText = "Account is Locked"
			case 715
				statusText = "Authentication Error: Online functions will not be available until Guitar Hero III is quit and relaunched."
			case 716
				statusText = "Incorrect Password"
		endswitch
		SetScreenElementProps Id = statusMessage text = <statusText>
		fit_text_into_menu_item \{ Id = statusMessage max_width = 480 }
		displaySprite \{PARENT = accountStatusContainer Id = options_bg_1 tex = Dialog_BG Pos = (640.0, 500.0) dims = (320.0, 64.0) z = 9 just = [ center botom ]}
		displaySprite \{PARENT = accountStatusContainer Id = options_bg_2 tex = Dialog_BG Pos = (640.0, 530.0) dims = (320.0, 64.0) z = 9 just = [ center top ] flip_h}
		CreateScreenElement {
			Type = ContainerElement
			PARENT = <vmenu_id>
			dims = (100.0, 50.0)
			event_handlers = [
				{ Focus net_warning_focus }
				{ unfocus net_warning_unfocus }
				{pad_choose ui_flow_manager_respond_to_action Params = { action = errorAction }}
				{pad_back ui_flow_manager_respond_to_action Params = { action = errorAction }}
			]
		}
		container_id = <Id>
		CreateScreenElement {
			Type = TextElement
			PARENT = <container_id>
			local_id = text
			font = fontgrid_title_gh3
			Scale = 0.85
			rgba = ($menu_unfocus_color)
			text = "TRY AGAIN"
			just = [ center top ]
			z_priority = (<z> + 0.1)
		}
		fit_text_into_menu_item Id = <Id> max_width = 480
		GetScreenElementDims Id = <Id>
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_id>
			local_id = bookend_left
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [ Right center ]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2))+ (-5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_id>
			local_id = bookend_right
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [ Left center ]
			Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2))+ (5.0, 0.0))
			z_priority = (<z> + 0.1)
			Scale = (1.0, 1.0)
		}
		clean_up_user_control_helpers
		add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
		add_user_control_helper \{ text = "BACK" button = Red z = 100 }
		LaunchEvent Type = Focus Target = <vmenu_id>
		return
	endif
	wait \{ 3 seconds }
	ui_flow_manager_respond_to_action \{ action = successAction }
	NetSessionFunc \{ func = stats_init }
endscript

script destroy_winport_account_management_status_screen
	if (ScreenElementExists Id = accountStatusContainer)
		DestroyScreenElement \{ Id = accountStatusContainer }
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_join_private_menu
	Printf \{ "--- create_join_private_menu" }
	z = 110
	create_menu_backdrop \{ texture = Online_Background }
	CreateScreenElement \{Type = ContainerElement PARENT = root_window Id = private_menu_container Pos = (0.0, 0.0) event_handlers = [{ Focus net_warning_focus }{ unfocus net_warning_unfocus }{ pad_choose executeJoinAttempt }{pad_back ui_flow_manager_respond_to_action Params = { action = back }}]}
	NetSessionFunc \{func = InitializeLoginFields Params = { loginMode = matchUsername }}
	displaySprite \{PARENT = private_menu_container tex = Dialog_Title_BG dims = (300.0, 250.0) z = 9 Pos = (640.0, 50.0) just = [ Right top ] flip_v}
	displaySprite \{PARENT = private_menu_container tex = Dialog_Title_BG dims = (300.0, 250.0) z = 9 Pos = (640.0, 50.0) just = [ Left top ]}
	CreateScreenElement \{Type = TextElement PARENT = private_menu_container font = fontgrid_title_gh3 Scale = 1.0 rgba = [ 223 223 223 250 ] text = "Join Private Match" just = [ center top ] z_priority = 10.0 Pos = (640.0, 145.0) Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [ 0 0 0 255 ]}
	fit_text_in_rectangle Id = <Id> dims = (400.0, 75.0) Pos = (640.0, 145.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center
	CreateScreenElement \{Type = TextElement PARENT = private_menu_container font = text_A4 Scale = 1.0 rgba = [ 180 180 180 255 ] text = "*Please use the keyboard to enter the Username of the match to join*" just = [ center top ] z_priority = 10.0 Pos = (640.0, 590.0) Shadow shadow_offs = (1.0, 1.0) shadow_rgba = [ 0 0 0 255 ]}
	fit_text_in_rectangle Id = <Id> dims = (600.0, 25.0) Pos = (640.0, 590.0) only_if_larger_x = 1 only_if_larger_y = 1 just = center keep_ar = 1
	<Pos> = (375.0, 320.0)
	create_winport_login_field container = private_menu_container Pos = <Pos> label = "Match Username: " labelId = usernameLabelId prefixId = usernamePrefixId cursorId = usernameCursorId suffixId = usernameSuffixId ang = -2.0
	add_user_control_helper \{ text = "ACCEPT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	LaunchEvent \{ Type = Focus Target = private_menu_container }
	begin
		update_winport_login_field \{Field = matchUsername labelId = usernameLabelId prefixId = usernamePrefixId cursorId = usernameCursorId suffixId = usernameSuffixId}
		wait \{ 1 Frame }
		if NOT (ScreenElementExists Id = private_menu_container)
			return
		endif
		NetSessionFunc \{ func = GetLoginEntry }
		if ((<loginEntry> = loginAccepted)|| (<loginEntry> = loginAborted))
			break
		endif
	repeat
	switch <loginEntry>
		case loginAccepted
			executeJoinAttempt
		case loginAborted
			ui_flow_manager_respond_to_action \{ action = back }
	endswitch
endscript

script executeJoinAttempt
	NetSessionFunc \{ func = GeneratePrivateMatchId }
	Change gPrivateMatchId = <privateMatchId>
	ui_flow_manager_respond_to_action \{ action = attempt_join }
endscript

script destroy_join_private_menu
	NetSessionFunc \{ func = DestroyLoginFields }
	DestroyScreenElement \{ Id = private_menu_container }
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_logout_submenu
	Printf \{ "--- create_logout_submenu" }
	create_menu_backdrop \{ texture = Online_Background }
	z = 110
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = logoutContainer Pos = (0.0, 0.0) }
	CreateScreenElement \{Type = VScrollingMenu PARENT = logoutContainer just = [ center top ] dims = (500.0, 150.0) Pos = (640.0, 465.0) z_priority = 1}
	menu_id = <Id>
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Pos = (298.0, 0.0)
		just = [ center top ]
		internal_just = [ center top ]
		dims = (500.0, 150.0)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound Params = { Up }}
			{pad_down generic_menu_up_or_down_sound Params = { Down }}
			{pad_back ui_flow_manager_respond_to_action Params = { action = back }}
		]
	}
	vmenu_id = <Id>
	Change \{menu_focus_color = [ 180 50 50 255 ]}
	Change \{menu_unfocus_color = [ 0 0 0 255 ]}
	create_pause_menu_frame \{ PARENT = logoutContainer z = 5 }
	displaySprite \{PARENT = logoutContainer tex = Dialog_Title_BG dims = (224.0, 224.0) z = 9 Pos = (640.0, 100.0) just = [ Right top ] flip_v}
	displaySprite \{PARENT = logoutContainer tex = Dialog_Title_BG dims = (224.0, 224.0) z = 9 Pos = (640.0, 100.0) just = [ Left top ]}
	CreateScreenElement \{Type = TextElement PARENT = logoutContainer font = fontgrid_title_gh3 Scale = 1.2 rgba = [ 223 223 223 250 ] text = "LOG OUT" just = [ center top ] z_priority = 10.0 Pos = (640.0, 182.0) Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [ 0 0 0 255 ]}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = logoutContainer
		Id = statusMessage
		text = "Selecting Logout will end your current Online session.	Your scores will not be tracked in the leaderboard until you login again."
		font = text_A4
		Scale = 0.8
		rgba = [ 210 210 210 250 ]
		just = [ center top ]
		internal_just = [ center top ]
		internal_scale = <Scale>
		z_priority = <z>
		Pos = (640.0, 300.0)
		dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	fit_text_into_menu_item \{ Id = statusMessage max_width = 470 }
	displaySprite \{PARENT = logoutContainer Id = options_bg_1 tex = Dialog_BG Pos = (640.0, 500.0) dims = (320.0, 64.0) z = 9 just = [ center botom ]}
	displaySprite \{PARENT = logoutContainer Id = options_bg_2 tex = Dialog_BG Pos = (640.0, 530.0) dims = (320.0, 64.0) z = 9 just = [ center top ] flip_h}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <vmenu_id>
		dims = (100.0, 50.0)
		event_handlers = [
			{ Focus net_warning_focus }
			{ unfocus net_warning_unfocus }
			{ pad_choose executeLogout }
			{pad_back ui_flow_manager_respond_to_action Params = { action = back }}
		]
	}
	container_id = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <container_id>
		local_id = text
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($menu_unfocus_color)
		text = "LOG OUT"
		just = [ center top ]
		z_priority = (<z> + 0.1)
	}
	fit_text_into_menu_item Id = <Id> max_width = 200
	GetScreenElementDims Id = <Id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		Alpha = 0.0
		just = [ Right center ]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2))+ (-5.0, 0.0))
		z_priority = (<z> + 0.1)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		Alpha = 0.0
		just = [ Left center ]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2))+ (5.0, 0.0))
		z_priority = (<z> + 0.1)
		Scale = (1.0, 1.0)
	}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <vmenu_id>
		dims = (100.0, 50.0)
		event_handlers = [
			{ Focus net_warning_focus }
			{ unfocus net_warning_unfocus }
			{pad_choose ui_flow_manager_respond_to_action Params = { action = back }}
			{pad_back ui_flow_manager_respond_to_action Params = { action = back }}
		]
	}
	container_id = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <container_id>
		local_id = text
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($menu_unfocus_color)
		text = "STAY ONLINE"
		just = [ center top ]
		z_priority = (<z> + 0.1)
	}
	fit_text_into_menu_item Id = <Id> max_width = 200
	GetScreenElementDims Id = <Id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		Alpha = 0.0
		just = [ Right center ]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2))+ (-5.0, 0.0))
		z_priority = (<z> + 0.1)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		Alpha = 0.0
		just = [ Left center ]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2))+ (5.0, 0.0))
		z_priority = (<z> + 0.1)
		Scale = (1.0, 1.0)
	}
	add_user_control_helper \{ text = "SELECT" button = Green z = 100 }
	add_user_control_helper \{ text = "BACK" button = Red z = 100 }
	add_user_control_helper \{ text = "UP/DOWN" button = strumbar z = 100 }
	LaunchEvent Type = Focus Target = <vmenu_id>
endscript

script destroy_logout_submenu
	DestroyScreenElement \{ Id = logoutContainer }
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script executeLogout
	NetSessionFunc \{ func = ResetNetwork }
	wait \{ 1.0 Second }
	destroy_logout_submenu
	start_flow_manager \{ flow_state = main_menu_fs }
endscript

script create_account_submenu \{ menu_title = "ACCOUNT MANAGEMENT" menu_id = online_account_menu vmenu_id = online_account_vmenu }
	Change \{ online_main_menu_pos = (640.0, 110.0) }
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = account_submenu_anchor Pos = (0.0, 0.0) }
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = account_submenu_anchor
		Id = <menu_id>
		just = [ center top ]
		dims = (400.0, 480.0)
		Pos = (($online_main_menu_pos)+ (0.0, 75.0))
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = (47.5, 0.0)
		just = [ Left top ]
		internal_just = [ center top ]
		dims = (400.0, 480.0)
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action Params = { action = back }}
			{ pad_back generic_menu_pad_back }
			{pad_up generic_menu_up_or_down_sound Params = { Up }}
			{pad_down generic_menu_up_or_down_sound Params = { Down }}
		]
	}
	CreateScreenElement \{ Type = ContainerElement PARENT = account_submenu_anchor Id = online_account_submenu_container Pos = (0.0, 0.0) }
	CreateScreenElement \{ Type = ContainerElement PARENT = online_account_submenu_container Id = online_account_submenu_text_container Pos = (0.0, 0.0) }
	CreateScreenElement \{ Type = ContainerElement PARENT = account_submenu_anchor Id = online_info_pane_container Pos = (0.0, 0.0) }
	create_menu_backdrop \{ texture = Online_Background }
	displaySprite Id = online_frame PARENT = online_account_submenu_container tex = Online_Frame_Large Pos = ($online_main_menu_pos)dims = (660.0, 480.0) just = [ center top ] z = 2
	displaySprite Id = Online_Frame_Crown PARENT = online_account_submenu_container tex = Online_Frame_Crown Pos = (($online_main_menu_pos)+ (0.0, -62.0))dims = (256.0, 105.0) just = [ center top ] z = 3
	CreateScreenElement {
		Type = TextElement
		PARENT = online_account_submenu_text_container
		Id = online_title
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_dark_purple)
		Pos = (($online_main_menu_pos)+ (0.0, 35.0))
		text = <menu_title>
		just = [ center top ]
		z_priority = 4.0
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 420)
		SetScreenElementProps {
			Id = <Id>
			Scale = 1.0
		}
		scale_element_to_size {
			Id = <Id>
			target_width = 420
			target_height = <height>
		}
	endif
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = "Log Out"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = { action = execute_logout }
		line_spacing = 50
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = "Change Password"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = { action = execute_change_password }
		line_spacing = 50
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		text = "Delete Account"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = { action = execute_delete_account }
		line_spacing = 50
	}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	create_online_main_menu_helper_buttons
	LaunchEvent Type = Focus Target = <vmenu_id>
endscript

script destroy_account_submenu
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{ Id = account_submenu_anchor }
		DestroyScreenElement \{ Id = account_submenu_anchor }
	endif
endscript
