paused_for_hardware = 0
blade_active = 0
pause_no_render = 0
sysnotify_wait_in_progress = 0
xenon_device_checked = -1
sysnotify_game_already_paused = 0
sysnotify_paused_screen_elements = [
	current_menu_anchor
	signout_warning
	dialog_box_anchor
	link_lost_dialog_anchor
	quit_dialog_anchor
	keyboard_anchor
	controller_unplugged_dialog_anchor
]

script sysnotify_wait_until_safe
	begin
		<should_wait> = 0
		if SystemUIDelayed
			<should_wait> = 1
			Printf \{ "WAITING FOR SYSTEM UI" }
		endif
		if IsTrue \{ $is_changing_levels }
			<should_wait> = 1
			Printf \{ "WAITING FOR ISCHANGINGLEVELS" }
		endif
		if IsTrue \{ $igc_playing }
			<should_wait> = 1
			Printf \{ "WAITING FOR IGC" }
		endif
		if NOT CutsceneFinished \{ name = cutscene }
			<should_wait> = 1
			Printf \{ "WAITING FOR CUTSCENE" }
		endif
		if ($ui_pro_success_screen_active = 0)
			if ScreenElementExists \{ Id = screenfader }
				<should_wait> = 1
				Printf \{ "WAITING FOR SCREENFADER" }
			endif
		endif
		if (<should_wait> = 1)
			Change \{ sysnotify_wait_in_progress = 1 }
			wait \{ 0.1 seconds }
		else
			Change \{ sysnotify_wait_in_progress = 0 }
			return
		endif
	repeat
endscript

script sysnotify_handle_pause_eject
	if IsPS3
		notify_box \{ container_id = notify_eject_static_text_container line1 = "Disc Ejected" line2 = "Please reinsert" menu_z = 510001 }
		if (RenderingEnabled)
			Change \{ pause_no_render = 0 }
			fade_overlay_on
		else
			Change \{ pause_no_render = 1 }
			StartRendering
			fade_overlay_on \{ Alpha = 1.0 }
		endif
	endif
	PauseGH3Sounds \{ no_seek }
	SetButtonEventMappings \{ block_menu_input }
	sysnotify_handle_pause <...> seek_on_unpause
endscript

script sysnotify_handle_pause_controller
	if IsPS3
		notify_box \{ container_id = notify_controller_static_text_container line1 = "YOU ARE ROCKING OUT A BIT TOO HARD" line2 = "Please ensure a controller is connected properly" menu_z = 510000 }
		if (RenderingEnabled)
			Change \{ pause_no_render = 0 }
			fade_overlay_on
		else
			Change \{ pause_no_render = 1 }
			StartRendering
			fade_overlay_on \{ Alpha = 1.0 }
		endif
		SetButtonEventMappings \{ block_menu_input }
	endif
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause_console
	if IsPS3
		if (RenderingEnabled)
			Change \{ pause_no_render = 0 }
			fade_overlay_on
		else
			if ($is_changing_levels = 0)
				Change \{ pause_no_render = 1 }
			endif
			StartRendering
			fade_overlay_on \{ Alpha = 1.0 }
		endif
	endif
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause
	Printf \{ "----------------------" }
	Printf \{ "sysnotify_handle_pause" }
	Printf \{ "----------------------" }
	if ($paused_for_hardware = 1)
		return
	endif
	if (($is_network_game)|| ($g_connection_loss_dialogue))
		return
	endif
	sysnotify_wait_until_safe
	Change \{ paused_for_hardware = 1 }
	Change \{ blade_active = 1 }
	Change \{ sysnotify_game_already_paused = 1 }
	if GameIsPaused
		Printf \{ "Game is already paused" }
		return
	endif
	Change \{ sysnotify_game_already_paused = 0 }
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if ScriptIsRunning \{ GuitarEvent_SongWon_Spawned }
		return
	endif
	if (($game_mode = tutorial)& ($playing_song = 1))
		show_training_pause_screen <...>
	else
		gh3_start_pressed <...>
	endif
endscript

script sysnotify_handle_unpause_eject
	if IsPS3
		kill_notify_box \{ container_id = notify_eject_static_text_container }
		if ($pause_no_render = 1)
			Change \{ pause_no_render = 0 }
			StopRendering
		endif
		fade_overlay_off
	endif
	if (($is_network_game)|| ($g_connection_loss_dialogue))
		UnPauseGH3Sounds \{ seek_on_unpause }
	endif
	SetButtonEventMappings \{ unblock_menu_input }
	sysnotify_handle_unpause <...> seek_on_unpause
endscript

script sysnotify_handle_unpause_controller
	if IsPS3
		kill_notify_box \{ container_id = notify_controller_static_text_container }
		if ($pause_no_render = 1)
			Change \{ pause_no_render = 0 }
			StopRendering
		endif
		fade_overlay_off
		SetButtonEventMappings \{ unblock_menu_input }
	endif
	sysnotify_handle_unpause <...>
endscript

script sysnotify_handle_unpause_console
	if IsPS3
		if ($pause_no_render = 1)
			Change \{ pause_no_render = 0 }
			StopRendering
		endif
		fade_overlay_off
		ReAcquireControllers
	endif
	sysnotify_handle_unpause <...>
endscript

script sysnotify_handle_unpause
	Printf \{ "------------------------" }
	Printf \{ "sysnotify_handle_unpause" }
	Printf \{ "------------------------" }
	if (($is_network_game)|| ($g_connection_loss_dialogue))
		return
	endif
	if ShouldGameBePausedDueToSysNotification
		return
	endif
	sysnotify_wait_until_safe
	Change \{ paused_for_hardware = 0 }
	Change \{ blade_active = 0 }
	Change \{ wait_for_sysnotify_unpause_flag = 1 }
	if NOT GameIsPaused
		return
	endif
	if ($sysnotify_game_already_paused = 0)
		if NOT ($playing_song = 1 & $is_attract_mode = 0)
			gh3_start_pressed <...>
		endif
	endif
	Change \{ sysnotify_game_already_paused = 0 }
endscript
fade_overlay_count = 0

script fade_overlay_on \{ Alpha = 0.9 }
	if IsPS3
		if NOT ScreenElementExists \{ Id = pause_fader }
			CreateScreenElement {
				Type = SpriteElement
				Id = pause_fader
				PARENT = root_window
				texture = black
				rgba = [ 0 0 0 255 ]
				Pos = (640.0, 360.0)
				dims = (1280.0, 720.0)
				just = [ center center ]
				z_priority = 509000
				Alpha = <Alpha>
			}
		endif
		Change fade_overlay_count = ($fade_overlay_count + 1)
	endif
endscript

script fade_overlay_off
	if IsPS3
		Change fade_overlay_count = ($fade_overlay_count - 1)
		if ($fade_overlay_count = 0)
			if ScreenElementExists \{ Id = pause_fader }
				DestroyScreenElement \{ Id = pause_fader }
			endif
		endif
	endif
endscript

script sysnotify_reset_user_progress
	reset_gamemode
	Change \{ attempted_xbox_autoload = 0 }
	Change \{ no_load = 0 }
	Change \{ xenon_device_checked = -1 }
	Change \{ ui_cas_skater_selected = 0 }
endscript
signin_change_happening = 0

script sysnotify_handle_signin_change
	Printf \{ "------------------------------" }
	Printf \{ "sysnotify_handle_signin_change" }
	Printf \{ "------------------------------" }
	Change \{ invite_controller = -1 }
	if ($signin_change_happening = 1)
		Printf \{ "ALREADY BEING PROCESSED" }
		return
	endif
	Change \{ signin_change_happening = 1 }
	sysnotify_wait_until_safe
	if ($ui_x360_sign_in_checked = 1)
		Change \{ ui_x360_sign_in_checked = 0 }
		Change \{ signin_change_happening = 0 }
		return
	endif
	switch <message>
		case live_connection_lost
			if InFrontEnd
				if NOT ($is_network_game)
					Change \{ signin_change_happening = 0 }
					return
				else
					sysnotify_handle_connection_loss
				endif
			else
				if NOT ($is_network_game)
					Change \{ signin_change_happening = 0 }
					return
				else
					sysnotify_handle_connection_loss
				endif
			endif
		case live_connection_gained
			if (($playing_song)& ($is_network_game = 0))
				xenon_singleplayer_session_init
				Change \{ signin_change_happening = 0 }
				return
			else
				Change \{ signin_change_happening = 0 }
				return
			endif
		case user_changed
			Printf \{ "sysnotify_handle_signin_change - user changed" }
			if ($respond_to_signin_changed = 1)
				handle_signin_changed
			endif
		default
			Printf \{ "- no response required" }
			Change \{ signin_change_happening = 0 }
			return
	endswitch
	Change \{ signin_change_happening = 0 }
endscript
sysnotify_allow_invite = 1

script sysnotify_handle_game_invite
	Printf \{ "----------------------------" }
	Printf \{ "sysnotify_handle_game_invite" }
	Printf \{ "----------------------------" }
	sysnotify_invite_go <...>
endscript

script sysnotify_invite_cancel
	sysnotify_handle_unpause
	dialog_box_exit
endscript

script sysnotify_invite_go
	Printf \{ "----sysnotify_invite_go" }
	if GotParam \{ cross_game }
		cross_game_invite_accepted <...>
	else
		sysnotify_wait_until_safe
		invite_accepted <...>
	endif
endscript

script cross_game_invite_accepted
endscript
g_connection_loss_dialogue = 0

script sysnotify_handle_connection_loss
	Printf \{ "--------------------------------" }
	Printf \{ "sysnotify_handle_connection_loss" }
	Printf \{ "--------------------------------" }
	Change \{ g_connection_loss_dialogue = 1 }
	sysnotify_wait_until_safe
	wait_for_safe_shutdown
	cleanup_sessionfuncs
	xboxlive_lost_connection_ui_cleanup
	begin
		if (main_menu_created = 1)
			wait \{ 2.0 seconds }
			break
		endif
		wait \{ 1.0 Second }
	repeat
	begin
		if NOT (ScreenElementExists Id = pause_menu_frame_container)
			break
		endif
		wait \{ 1.0 Second }
	repeat
	if (GotParam reason)
		create_link_unplugged_dialog reason = <reason>
	else
		create_link_unplugged_dialog
	endif
endscript

script sysnotify_cleanup_misc
	if ScreenElementExists \{ Id = root_window }
		LaunchEvent \{ Type = unfocus Target = root_window }
	endif
	sysnotify_cleanup_ui
	if InFrontEnd
		killspawnedscript \{ name = attract_mode_timer }
		if ScreenElementExists \{ Id = cas_category_anchor }
			DestroyScreenElement \{ Id = cas_category_anchor }
		endif
		if ScreenElementExists \{ Id = progress_anchor }
			DestroyScreenElement \{ Id = progress_anchor }
		endif
	endif
	destroy_onscreen_keyboard
	if InNetGame
		force_close_rankings \{ dont_retry }
		if LocalSkaterExists
			Skater ::Vibrate \{ OFF }
		endif
		if NOT IsObserving
			ExitSurveyorMode
		endif
		dialog_box_exit \{ anchor_id = link_lost_dialog_anchor }
		dialog_box_exit \{ anchor_id = quit_dialog_anchor }
	endif
	if ScreenElementExists \{ Id = piece_menu_hmenu }
		DestroyScreenElement \{ Id = piece_menu_hmenu }
	endif
	dialog_box_exit
	Change \{ main_menu_return_to_createamodes = 0 }
	Change \{ check_for_unplugged_controllers = 0 }
	Change \{ inside_pause = 0 }
	kill_start_key_binding
	killspawnedscript \{ name = main_menu_exit }
	GetCurrentLevel
	if (<level> = load_z_bedroom)
		if ViewportExists \{ Id = z_bedroom_select_viewport }
			z_bedroom_kill_select_bink
		endif
		z_bedroom_exit_unload
	endif
endscript

script sysnotify_cleanup_ui
	Printf \{ "--------------------------------" }
	Printf \{ "sysnotify_cleanup_ui" }
	Printf \{ "--------------------------------" }
	killspawnedscript \{ name = ui_mainmovies_wait_for_movie }
	killspawnedscript \{ name = ui_initial_interactive_screen }
	killspawnedscript \{ name = ui_attract_wait_for_movie }
	killspawnedscript \{ name = ui_mainmenu_wait_for_movie }
	killspawnedscript \{ name = attract_timer_wait }
	killspawnedscript \{ name = goal_classic_mode_post_cams }
	killspawnedscript \{ name = goal_classic_mode_show_cams }
	KillSkaterCamAnim \{ name = goal_classic_mode_cam }
	if ScreenElementExists \{ Id = ui_mainmovie_wait_anchor }
		DestroyScreenElement \{ Id = ui_mainmovie_wait_anchor }
	endif
	if IsMoviePlaying \{ TextureSlot = 0 }
		KillMovie \{ TextureSlot = 0 }
	endif
	if IsMoviePlaying \{ TextureSlot = 1 }
		KillMovie \{ TextureSlot = 1 }
	endif
	if ViewportExists \{ Id = z_mainmenu_bink_viewport }
		PushAssetContext \{ context = Z_Mainmenu }
		DestroyViewportTextureOverride \{ Id = z_mainmenu_bink_viewport }
		DestroyViewport \{ Id = z_mainmenu_bink_viewport }
		PopAssetContext
	endif
	if ViewportExists \{ Id = thp8_shop_viewport }
		PushAssetContext \{ context = Z_Shops }
		DestroyViewportTextureOverride \{ Id = thp8_shop_viewport }
		DestroyViewport \{ Id = thp8_shop_viewport }
		PopAssetContext
	endif
	Change \{ pause_fmv_playing = 0 }
	killspawnedscript \{ name = xenon_handle_first_input }
	if ScreenElementExists \{ Id = edit_tricks_menu_parts_anchor }
		DestroyScreenElement \{ Id = edit_tricks_menu_parts_anchor }
	endif
	if ScreenElementExists \{ Id = edit_tricks_sub_menu_anchor }
		DestroyScreenElement \{ Id = edit_tricks_sub_menu_anchor }
	endif
	if ScreenElementExists \{ Id = choose_trick_menu_container }
		DestroyScreenElement \{ Id = choose_trick_menu_container }
	endif
	if ScreenElementExists \{ Id = ui_mainmenu_wait_anchor }
		DestroyScreenElement \{ Id = ui_mainmenu_wait_anchor }
	endif
	if ScreenElementExists \{ Id = goal_presentation_anchor }
		DestroyScreenElement \{ Id = goal_presentation_anchor }
	endif
	if ScreenElementExists \{ Id = select_skater_anchor }
		DestroyScreenElement \{ Id = select_skater_anchor }
	endif
	killspawnedscript \{ name = goal_create_pro_success_screen }
	killspawnedscript \{ name = goal_destroy_pro_success_screen }
	killspawnedscript \{ name = goal_generic_exit_menu_and_videos }
	if ($ui_pro_success_screen_active = 1)
		if GMan_HasActiveGoals
			GMan_GetActivatedGoalId
			goal_destroy_pro_success_screen do_pause = 0 goal = <activated_goal_id> pass_pro_goal = 0
		endif
	endif
endscript

script notify_box \{ scale1 = 0.75 scale2 = 0.6 container_pos = (0.0, 0.0) }
	if ScreenElementExists Id = <container_id>
		return
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = root_window
		Id = <container_id>
		Pos = <container_pos>
	}
	menu_font = fontgrid_title_gh3
	if GotParam \{ line3 }
		displaySprite PARENT = <container_id> tex = Dialog_BG Pos = (640.0, 24.0) Scale = (3.0, 2.0) z = <menu_z> just = [ center top ]
		displaySprite PARENT = <container_id> tex = Dialog_BG flip_h Pos = (640.0, 120.0) Scale = (3.0, 2.0) z = <menu_z> just = [ center top ]
	else
		displaySprite PARENT = <container_id> tex = Dialog_BG Pos = (640.0, 32.0) Scale = (3.0, 1.5) z = <menu_z> just = [ center top ]
		displaySprite PARENT = <container_id> tex = Dialog_BG flip_h Pos = (640.0, 112.0) Scale = (3.0, 1.5) z = <menu_z> just = [ center top ]
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = <container_id>
		font = <menu_font>
		Scale = <scale1>
		rgba = [ 180 50 50 255 ]
		text = <line1>
		just = [ center top ]
		z_priority = (<menu_z> + 0.2)
		Pos = (640.0, 80.0)
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <container_id>
		font = <menu_font>
		Scale = <scale2>
		rgba = [ 0 0 0 255 ]
		text = <line2>
		just = [ center top ]
		z_priority = (<menu_z> + 0.2)
		Pos = (640.0, 124.0)
	}
	if GotParam \{ line3 }
		CreateScreenElement {
			Type = TextElement
			PARENT = <container_id>
			font = <menu_font>
			Scale = <scale2>
			rgba = [ 0 0 0 255 ]
			text = <line3>
			just = [ center top ]
			z_priority = (<menu_z> + 0.2)
			Pos = (640.0, 160.0)
		}
	endif
endscript

script kill_notify_box \{ container_id = notify_static_text_container }
	if ScreenElementExists Id = <container_id>
		DestroyScreenElement Id = <container_id>
	endif
endscript
wait_for_sysnotify_unpause_flag = 0

script wait_for_sysnotify_unpause
	Change \{ wait_for_sysnotify_unpause_flag = 0 }
	Printf \{ "Waiting for sysnotify Pause Off" }
	begin
		Printf "Waiting for sysnotify paused_for_hardware = %i" i = ($paused_for_hardware)
		if ($wait_for_sysnotify_unpause_flag = 1)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script xboxlive_lost_connection_ui_cleanup
	if ($is_network_game)
		cancel_join_server
		destroy_connection_dialog_scroller
		killspawnedscript \{ Id = client_lobby_setup }
		fadetoblack \{ON Time = 0 Alpha = 1.0 z_priority = 20000 Id = invite_screenfader}
		wait \{ 1 GameFrame }
		StopRendering
		shutdown_game_for_signin_change \{ unloadcontent = 0 }
		StartRendering
		wait \{ 60 gameframes }
		fadetoblack \{ OFF Time = 0 Id = invite_screenfader }
		wait \{ 1 GameFrame }
	endif
endscript
