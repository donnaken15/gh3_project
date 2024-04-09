setlist_random_images_scroll_num = 0
setlist_random_images_highest_num = 0
setlist_random_bg_images = [
	{ texture = Setlist_Shoeprint flippable shoeprint }
	{
		texture = Setlist_Gum
		flippable
		dims = (128.0, 128.0)
		loffset = (20.0, 0.0)
		roffset = (160.0, 0.0)
	}
	{
		texture = setlist_coin
		flippable
		dims = (96.0, 96.0)
		loffset = (70.0, 0.0)
		roffset = (115.0, 0.0)
	}
	{
		texture = setlist_wrigleys_gum
		dims = (450.0, 450.0)
		minRot = -10
		maxRot = 70
		loffset = (30.0, 0.0)
		only_left
		center_just
	}
	{ texture = setlist_ernieBall dims = (384.0, 384.0) only_right roffset = (100.0, 0.0) }
	{ texture = #"0x119aad82" dims = (256.0, 256.0) loffset = (-50.0, 0.0) roffset = (50.0, 0.0) }
]
setlist_solid_lines = [ Setlist_Page1_Line_Solid1 Setlist_Page1_Line_Solid2 Setlist_Page1_Line_Solid3 ]
setlist_dotted_lines = [ Setlist_Page1_Line_Dotted1 Setlist_Page1_Line_Dotted2 Setlist_Page1_Line_Dotted3 ]
setlist_loop_stars = [ Setlist_Page1_Loop_Star1 Setlist_Page1_Loop_Star2 Setlist_Page1_Loop_Star3 ]
setlist_event_handlers = [
	{
		pad_up
		setlist_scroll
		Params = { Dir = Up }
	}
	{
		pad_down
		setlist_scroll
		Params = { Dir = Down }
	}
	{ pad_back setlist_go_back }
	{
		pad_option2
		change_tab
		Params = { tab = tab_setlist button = 1 }
	}
	{
		pad_option
		change_tab
		Params = { tab = tab_bonus button = 1 }
	}
	{
		pad_L1
		change_tab
		Params = { tab = tab_downloads button = 1 }
	}
	{ pad_start menu_show_gamercard }
]
setlist_line_index = 0
setlist_line_max = 26
setlist_menu_pos = (340.0, 440.0)
setlist_begin_text = (0.0, 0.0)
setlist_background_pos = (0.0, 0.0)
setlist_background_loop_pos = (0.0, 676.0)
setlist_background_loop_num = 0
setlist_page1_loop_pos = (160.0, 768.0)
setlist_page1_num = 0
setlist_selection_index = 0
setlist_selection_tier = 1
setlist_selection_song = 0
setlist_selection_found = 0
setlist_num_songs = 0
setlist_previous_tier = 1
setlist_previous_song = 0
setlist_previous_tab = tab_setlist
setlist_clip_last_rot = 0
setlist_clip_rot_neg = 0
setlist_solid_line_pos = (0.0, 0.0)
setlist_dotted_line_pos = (0.0, 0.0)
setlist_solid_line_add = (0.0, 80.0)
setlist_line_num = 0
setlist_page3_pos = (210.0, 86.0)
setlist_page3_num = 0
setlist_page3_dims = (1254.0, 533.0)
setlist_page2_pos = (240.0, 50.0)
setlist_page2_num = 0
setlist_page2_dims = (819.0, 666.0)
setlist_page1_dims = (922.0, 512.0)
setlist_text_z = 4.1
g_gh3_setlist = NULL
current_tab = tab_setlist
setlist_page1_z = 0
setlist_page2_z = 0
setlist_page3_z = 0
current_setlist_songpreview = None
target_setlist_songpreview = None
setlist_songpreview_changing = 0

script display_as_made_famous_by \{ rot_angle = -7 Time = 0.25 }
	destroy_menu \{ menu_id = setlist_original_artist }
	CreateScreenElement {
		Type = ContainerElement
		PARENT = root_window
		Id = setlist_original_artist
		rot_angle = <rot_angle>
		Alpha = 0
	}
	displaySprite {
		PARENT = setlist_original_artist
		tex = White
		dims = (130.0, 50.0)
		just = [ center top ]
		Pos = <Pos>
		rgba = [ 0 0 0 255 ]
		z = 500
	}
	displaySprite {
		PARENT = setlist_original_artist
		tex = White
		just = [ center top ]
		dims = (130.0, 25.0)
		Pos = (<Pos> + (0.0, 25.0))
		rgba = [ 223 223 223 255 ]
		z = 501
	}
	displayText {
		PARENT = setlist_original_artist
		text = "AS MADE"
		font = text_a3
		just = [ center top ]
		Pos = (<Pos>)
		z = 502
		Scale = (0.800000011920929, 0.5)
		rgba = [ 223 223 223 255 ]
		noshadow
	}
	fit_text_in_rectangle Id = <Id> dims = (75.0, 15.0)
	displayText {
		PARENT = setlist_original_artist
		text = "FAMOUS BY"
		just = [ center top ]
		font = text_a3
		Pos = (<Pos> + (0.0, 25.0))
		z = 502
		Scale = (0.7249999642372131, 0.5)
		rgba = [ 0 0 0 255 ]
		noshadow
	}
	fit_text_in_rectangle Id = <Id> dims = (90.0, 15.0)
	DoScreenElementMorph Id = setlist_original_artist Alpha = 1 Time = <Time>
endscript

script set_song_icon
	if NOT GotParam \{ no_wait }
		wait \{ 0.5 seconds }
	endif
	if NOT GotParam \{ song }
		<song> = ($target_setlist_songpreview)
	endif
	if (<song> = None & $current_tab = tab_setlist)
		return
	endif
	if ($current_tab = tab_setlist)
		get_tier_from_song song = <song>
		get_progression_globals game_mode = ($game_mode)
		FormatText ChecksumName = tiername 'tier%d' d = <tier_number>
		if StructureContains Structure = ($<tier_global>.<tiername>)setlist_icon
			song_icon = ($<tier_global>.<tiername>.setlist_icon)
		else
			song_icon = setlist_icon_generic
		endif
	elseif ($current_tab = tab_downloads)
		song_icon = setlist_icon_download
	else
		song_icon = setlist_icon_generic
	endif
	mini_rot = randomrange (-5.0, 5.0)
	if ScreenElementExists \{ Id = sl_clipart }
		SetScreenElementProps Id = sl_clipart texture = <song_icon>
		DoScreenElementMorph Id = sl_clipart Alpha = 1 Time = 0.25 rot_angle = <mini_rot>
	endif
	if ScreenElementExists \{ Id = sl_clipart_shadow }
		SetScreenElementProps Id = sl_clipart_shadow texture = <song_icon>
		DoScreenElementMorph Id = sl_clipart_shadow Alpha = 1 Time = 0.25 rot_angle = <mini_rot>
	endif
	if ScreenElementExists \{ Id = sl_clip }
		GetScreenElementProps \{ Id = sl_clip }
		rot_clip_a = <rot_angle>
		rot_clip_b = (<rot_clip_a> + 10)
		SetScreenElementProps Id = sl_clip rot_angle = <rot_clip_b>
		DoScreenElementMorph Id = sl_clip Alpha = 1 rot_angle = <rot_clip_a> Time = 0.25
	endif
	if NOT (<song> = None)
		get_song_original_artist song = <song>
		if ($we_have_songs = TRUE & <original_artist> = 0)
			if ScreenElementExists \{ Id = sl_clipart }
				GetScreenElementProps \{ Id = sl_clipart }
			endif
		endif
	endif
endscript

script get_tier_from_song
	num_tiers = ($g_gh3_setlist.num_tiers)
	tier_index = 1
	begin
		FormatText ChecksumName = tier_name 'tier%d' d = <tier_index>
		GetArraySize ($g_gh3_setlist.<tier_name>.songs)
		song_index = 0
		begin
			song_checksum = ($g_gh3_setlist.<tier_name>.songs [ <song_index> ])
			if (<song_checksum> = <song>)
				return tier_number = <tier_index>
			endif
			<song_index> = (<song_index> + 1)
		repeat <array_Size>
		<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	Printf \{ "Did not find tier!" }
	return \{ tier_number = 1 }
endscript

script clear_setlist_clip_and_art
	destroy_menu \{ menu_id = setlist_original_artist }
	if ScreenElementExists \{ Id = sl_clipart }
		SetScreenElementProps \{ Id = sl_clipart Alpha = 0 }
	endif
	if ScreenElementExists \{ Id = sl_clipart_shadow }
		SetScreenElementProps \{ Id = sl_clipart_shadow Alpha = 0 }
	endif
	if ScreenElementExists \{ Id = sl_clip }
		SetScreenElementProps \{ Id = sl_clip Alpha = 0 }
	endif
endscript

script setlist_go_back
	if (($transitions_locked = 0)& ($is_network_game = 0))
		LaunchEvent \{ Type = unfocus Target = vmenu_setlist }
	endif
	begin
		if ($changing_tab = 0)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	if ($is_network_game = 1)
		if ($g_tie_breaker_song = 0)
			net_setlist_go_back
		endif
	else
		ui_flow_manager_respond_to_action action = go_back create_params = {Player = ($current_num_players)}
	endif
endscript

script displaySprite \{just = [ Left top ] rgba = [ 255 255 255 255 ] dims = {}BlendMode = {}internal_just = {}Scale = {}Alpha = 1}
	if GotParam \{ rot_angle }
		rot_struct = { rot_angle = <rot_angle> }
	else
		rot_struct = {}
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <Id>
		PARENT = <PARENT>
		texture = <tex>
		dims = <dims>
		rgba = <rgba>
		Pos = <Pos>
		just = <just>
		internal_just = <internal_just>
		z_priority = <z>
		Scale = <Scale>
		<rot_struct>
		Blend = <BlendMode>
		Alpha = <Alpha>
	}
	if GotParam \{ flip_v }
		<Id> ::SetProps flip_v
	endif
	if GotParam \{ flip_h }
		<Id> ::SetProps flip_h
	endif
	return Id = <Id>
endscript

script displayText \{Id = {}just = [ Left top ] rgba = [ 210 130 0 250 ] font = text_A5 rot = 0}
	CreateScreenElement {
		Type = TextElement
		PARENT = <PARENT>
		font = <font>
		Scale = <Scale>
		rgba = <rgba>
		text = <text>
		Id = <Id>
		Pos = <Pos>
		just = <just>
		rot_angle = <rot>
		z_priority = <z>
		font_spacing = <font_spacing>
	}
	if GotParam \{ noshadow }
		<Id> ::SetProps noshadow
	else
		<Id> ::SetProps Shadow shadow_offs = (3.0, 3.0) shadow_rgba [ 0 0 0 255 ]
	endif
	return Id = <Id>
endscript

script create_setlist_menu
	if (($is_network_game = 1)& ($net_can_send_approval = 1))
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = song
		}
	endif
	if ($is_network_game = 1)
		Change \{ current_tab = tab_setlist }
		Change \{ setlist_previous_tier = 1 }
		Change \{ setlist_previous_song = 0 }
		Change \{ setlist_previous_tab = tab_setlist }
	endif
	if ($end_credits = 1 & $current_song = bossdevil)
		Progression_EndCredits
		return
	endif
	Change \{ boss_wuss_out = 0 }
	if ($progression_play_completion_movie = 1)
		get_progression_globals game_mode = ($game_mode)
		FormatText ChecksumName = tiername 'tier%i' i = ($progression_completion_tier)
		if StructureContains Structure = ($<tier_global>.<tiername>)completion_movie
			Menu_Music_Off
			PlayMovieAndWait movie = ($<tier_global>.<tiername>.completion_movie)
			get_movie_id_by_name movie = ($<tier_global>.<tiername>.completion_movie)
			SetGlobalTags <Id> Params = { unlocked = 1 }
		endif
		Change \{ progression_play_completion_movie = 0 }
	endif
	Change \{ progression_unlocked_guitar = -1 }
	Change \{ progression_unlocked_guitar2 = -1 }
	Change \{ rich_presence_context = presence_song_list }
	Menu_Music_Off
	get_progression_globals game_mode = ($game_mode)
	Change g_gh3_setlist = <tier_global>
	create_setlist_scrolling_menu
	Change \{ setlist_page3_z = 3.3 }
	Change \{ setlist_page2_z = 3.4 }
	Change \{ setlist_page1_z = 3.5 }
	Change \{ setlist_random_images_scroll_num = 0 }
	Change \{ setlist_random_images_highest_num = 0 }
	change_tab tab = ($setlist_previous_tab)
	setlist_display_random_bg_image
	if ($is_network_game)
		Change \{ setlist_previous_tier = 1 }
		Change \{ setlist_previous_song = 0 }
		Change \{ setlist_previous_tab = tab_setlist }
		create_setlist_popup
	endif
	Change \{ disable_menu_sounds = 1 }
	begin
		if ($setlist_selection_tier >= $setlist_previous_tier)
			if ($setlist_selection_song >= $setlist_previous_song)
				break
			endif
		endif
		last_tier = ($setlist_selection_tier)
		last_song = ($setlist_selection_song)
		LaunchEvent \{ Type = pad_down Target = vmenu_setlist }
		if (<last_tier> = $setlist_selection_tier)
			if (<last_song> = $setlist_selection_song)
				break
			endif
		endif
	repeat
	Change \{ disable_menu_sounds = 0 }
	if ($setlist_selection_found = 1)
		FormatText \{ ChecksumName = tier_checksum 'tier%s' s = $setlist_selection_tier }
		song = ($g_gh3_setlist.<tier_checksum>.songs [ $setlist_selection_song ])
		Change target_setlist_songpreview = <song>
	else
		Change \{ target_setlist_songpreview = None }
	endif
	SpawnScriptLater \{ setlist_songpreview_monitor }
	if (($is_network_game = 1)& ($net_can_send_approval = 1))
		net_lobby_state_message \{ current_state = song action = approval }
		Change \{ net_can_send_approval = 0 }
	endif
endscript

script create_setlist_scrolling_menu
	kill_start_key_binding
	UnPauseGame
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
			$game_mode = p2_faceoff ||
			$game_mode = p2_pro_faceoff ||
			$game_mode = p2_battle)
			exclusive_mp_controllers = [ 0 , 0 ]
			SetArrayElement ArrayName = exclusive_mp_controllers Index = 0 NewValue = ($player1_device)
			SetArrayElement ArrayName = exclusive_mp_controllers Index = 1 NewValue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	if ($is_network_game = 1)
		if NOT ($net_current_flow_state = song)
			no_focus_value = 1
		else
			no_focus_value = 0
		endif
	else
		no_focus_value = 1
	endif
	new_menu {
		scrollid = scrolling_setlist
		vmenuid = vmenu_setlist
		tierlist = $g_gh3_setlist
		use_backdrop = 0
		no_wrap
		z = -1
		event_handlers = $setlist_event_handlers
		on_choose = setlist_choose_song
		on_right = setlist_debug_completesong
		on_l3 = setlist_debug_unlockall
		on_left = setlist_debug_unlockall
		exclusive_device = <exclusive_device>
		no_focus = <no_focus_value>
	}
	if ($is_network_game = 1)
		if ($current_tab = tab_downloads)
			net_dl_content_compatabilty_warning \{ PARENT = gamertag_container z = 10000 Pos = (320.0, 580.0) }
		else
			if ScreenElementExists \{ Id = dl_content_warning }
				DestroyScreenElement \{ Id = dl_content_warning }
			endif
		endif
	endif
	set_focus_color \{rgba = [ 200 120 0 250 ]}
	set_unfocus_color \{rgba = [ 50 30 10 255 ]}
endscript

script destroy_setlist_scrolling_menu
	destroy_menu \{ menu_id = scrolling_setlist }
	clean_up_user_control_helpers
endscript

script destroy_setlist_songpreview_monitor
	UnPauseSpawnedScript \{ setlist_songpreview_monitor }
	begin
		if ($setlist_songpreview_changing = 0)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	killspawnedscript \{ name = setlist_songpreview_monitor }
	if NOT ($current_setlist_songpreview = None)
		get_song_prefix song = ($current_setlist_songpreview)
		FormatText ChecksumName = song_preview '%s_preview' s = <song_prefix>
		stopsound <song_preview>
		SongUnLoadFSBIfDownloaded
	endif
endscript

script destroy_setlist_menu
	killspawnedscript \{ name = net_match_download_songs }
	destroy_setlist_songpreview_monitor
	Change setlist_previous_tier = ($setlist_selection_tier)
	Change setlist_previous_song = ($setlist_selection_song)
	Change setlist_previous_tab = ($current_tab)
	Change \{ target_setlist_songpreview = None }
	destroy_menu \{ menu_id = setlist_original_artist }
	destroy_menu \{ menu_id = scrolling_setlist }
	destroy_menu \{ menu_id = setlist_menu }
	destroy_menu \{ menu_id = setlist_loops_menu }
	destroy_menu \{ menu_id = setlist_bg_container }
	reset_vars \{ del }
	clean_up_user_control_helpers
	destroy_setlist_popup
endscript

script setlist_choose_song \{ device_num = 0 }
	if GotParam \{ song_count }
		if ($is_network_game = 1)
			net_request_song Tier = <Tier> song_count = <song_count>
		else
			if ($transitions_locked = 0)
				LaunchEvent \{ Type = unfocus Target = vmenu_setlist }
			endif
			FormatText ChecksumName = tier_checksum 'tier%s' s = <Tier>
			Change current_song = ($g_gh3_setlist.<tier_checksum>.songs [ <song_count> ])
			SetGlobalTags Progression Params = { current_tier = <Tier> }
			SetGlobalTags Progression Params = { current_song_count = <song_count> }
			Change \{ current_level = $g_last_venue_selected }
			get_song_struct song = ($current_song)
			if ((StructureContains Structure = <song_struct> boss)|| $game_mode = p2_battle)
				get_current_battle_first_play
				if (<first_battle_play> = 1 || (StructureContains Structure = <song_struct> boss))
					ui_flow_manager_respond_to_action action = show_help device_num = (<device_num>)create_params = {boss = (<song_struct>.checksum)}
					return
				endif
			endif
			enable_pause
			ui_flow_manager_respond_to_action action = continue device_num = (<device_num>)
		endif
	endif
endscript

script setlist_debug_completesong
	if ($game_mode = training || $is_network_game = 1)
		return
	endif
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		level = ($current_level)
		FormatText ChecksumName = tier_checksum 'tier%s' s = <Tier>
		Change current_song = ($g_gh3_setlist.<tier_checksum>.songs [ <song_count> ])
		SetGlobalTags Progression Params = { current_tier = <Tier> }
		SetGlobalTags Progression Params = { current_song_count = <song_count> }
		PrintStruct <...>
		load_songqpak song_name = ($current_song)async = 0
		setup_gemarrays song_name = ($current_song)difficulty = ($current_difficulty)player_status = player1_status
		calc_songscoreinfo
		Change StructureName = player1_status score = ($player1_status.base_score * 2.8 + 1)
		Progression_SongWon
		if ($game_mode = p1_quickplay)
			menu_top_rockers_check_for_new_top_score
		endif
		songpreview = ($current_setlist_songpreview)
		change_tab tab = ($current_tab)
		Change current_setlist_songpreview = <songpreview>
		if ($current_song = bossslash || $current_song = bosstom || $current_song = bossdevil)
			boss_character = -1
			if ($current_song = bossslash)
				<boss_character> = 0
			elseif ($current_song = bosstom)
				<boss_character> = 1
			elseif ($current_song = bossdevil)
				<boss_character> = 2
			endif
			if (<boss_character> >= 0)
				unlocked_for_purchase = 1
				GetGlobalTags ($Secret_Characters [ <boss_character> ].Id)
				if (<unlocked_for_purchase> = 0)
					SetGlobalTags ($Secret_Characters [ <boss_character> ].Id)Params = { unlocked_for_purchase = 1 }
				endif
			endif
		endif
		Change \{ disable_menu_sounds = 1 }
		begin
			if (<Tier> = $setlist_selection_tier)
				if (<song_count> = $setlist_selection_song)
					break
				endif
			endif
			last_tier = ($setlist_selection_tier)
			last_song = ($setlist_selection_song)
			LaunchEvent \{ Type = pad_down Target = vmenu_setlist }
			if (<last_tier> = $setlist_selection_tier)
				if (<last_song> = $setlist_selection_song)
					break
				endif
			endif
		repeat
		Change \{ disable_menu_sounds = 0 }
		Change \{ StructureName = player1_status new_cash = 0 }
		Change \{ progression_play_completion_movie = 0 }
		Change \{ progression_unlock_tier_last_song = 0 }
		Change current_level = <level>
		Change \{ end_credits = 0 }
	endif
endscript

script setlist_debug_unlockall
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		if ($game_mode = training || $is_network_game = 1)
			return
		endif
		level = ($current_level)
		get_progression_globals game_mode = ($game_mode)
		GlobalTags_UnlockAll SongList = <tier_global>
		GlobalTags_UnlockAll \{ SongList = GH3_Bonus_Songs }
		Change \{ StructureName = player1_status notes_hit = 100 }
		Change \{ StructureName = player1_status total_notes = 100 }
		Change \{ StructureName = player2_status notes_hit = 100 }
		Change \{ StructureName = player2_status total_notes = 100 }
		if ($game_mode = p1_career || $game_mode = p2_career)
			UpdateAtoms \{ name = Progression }
		endif
		UpdateAtoms \{ name = achievement }
		songpreview = ($current_setlist_songpreview)
		change_tab tab = ($current_tab)
		Change current_setlist_songpreview = <songpreview>
		Change \{ disable_menu_sounds = 1 }
		begin
			if (<Tier> = $setlist_selection_tier)
				if (<song_count> = $setlist_selection_song)
					break
				endif
			endif
			last_tier = ($setlist_selection_tier)
			last_song = ($setlist_selection_song)
			LaunchEvent \{ Type = pad_down Target = vmenu_setlist }
			if (<last_tier> = $setlist_selection_tier)
				if (<last_song> = $setlist_selection_song)
					break
				endif
			endif
		repeat
		Change \{ disable_menu_sounds = 0 }
		Change \{ StructureName = player1_status new_cash = 0 }
		Change \{ progression_play_completion_movie = 0 }
		Change \{ progression_unlock_tier_last_song = 0 }
		Change current_level = <level>
		Change \{ end_credits = 0 }
	endif
endscript

script setlist_scroll \{ Dir = Down }
	if ($setlist_num_songs = 0)
		return
	endif
	if (<Dir> = Down)
		if ($setlist_selection_index + 1 = $setlist_num_songs)
			return
		endif
	else
		if ($setlist_selection_index - 1 < 0)
			return
		endif
	endif
	generic_menu_up_or_down_sound <Dir>
	FormatText \{ ChecksumName = textid 'id_song%i' i = $setlist_selection_index AddToStringLookup = TRUE }
	retail_menu_unfocus Id = <textid>
	SetScreenElementProps Id = <textid> no_shadow
	if (<Dir> = Down)
		jump_tier = 0
		Change setlist_selection_index = ($setlist_selection_index + 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		begin
			FormatText ChecksumName = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
			FormatText \{ ChecksumName = tier_checksum 'tier%s' s = $setlist_selection_tier }
			GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
			Change setlist_selection_song = ($setlist_selection_song + 1)
			if ($setlist_selection_song = <array_Size>)
				Change \{ setlist_selection_song = 0 }
				Change setlist_selection_tier = ($setlist_selection_tier + 1)
				jump_tier = 1
			endif
			FormatText ChecksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = ($setlist_selection_song + 1)s = $setlist_selection_tier AddToStringLookup = TRUE
			for_bonus = 0
			if ($current_tab = tab_bonus)
				<for_bonus> = 1
			endif
			if IsSongAvailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [ $setlist_selection_song ])for_bonus = <for_bonus>
				break
			endif
		repeat
		jump_tier_amt = (0.0, -240.0)
		if ($setlist_selection_index = 1)
			song_jump_amt = (0.0, -160.0)
			GetScreenElementProps \{ Id = sl_clipart }
			SetScreenElementProps Id = sl_clipart Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{ Id = sl_clipart_shadow }
			SetScreenElementProps Id = sl_clipart_shadow Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{ Id = sl_clip }
			SetScreenElementProps Id = sl_clip Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{ Id = sl_highlight }
			SetScreenElementProps Id = sl_highlight Pos = (<Pos> - (0.0, 80.0))
		else
			song_jump_amt = (0.0, -80.0)
		endif
	else
		jump_tier = 0
		Change setlist_selection_index = ($setlist_selection_index - 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		begin
			FormatText ChecksumName = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
			FormatText \{ ChecksumName = tier_checksum 'tier%s' s = $setlist_selection_tier }
			GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
			Change setlist_selection_song = ($setlist_selection_song - 1)
			if ($setlist_selection_song = -1)
				Change setlist_selection_tier = ($setlist_selection_tier - 1)
				FormatText ChecksumName = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
				FormatText \{ ChecksumName = tier_checksum 'tier%s' s = $setlist_selection_tier }
				GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
				Change setlist_selection_song = (<array_Size> - 1)
				jump_tier = 1
			endif
			FormatText ChecksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = ($setlist_selection_song + 1)s = $setlist_selection_tier AddToStringLookup = TRUE
			for_bonus = 0
			if ($current_tab = tab_bonus)
				<for_bonus> = 1
			endif
			if IsSongAvailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [ $setlist_selection_song ])for_bonus = <for_bonus>
				break
			endif
		repeat
		jump_tier_amt = (0.0, 240.0)
		if ($setlist_selection_index = 0)
			song_jump_amt = (0.0, 160.0)
			GetScreenElementProps \{ Id = sl_clipart }
			SetScreenElementProps Id = sl_clipart Pos = (<Pos> + (0.0, 80.0))
			GetScreenElementProps \{ Id = sl_clipart_shadow }
			SetScreenElementProps Id = sl_clipart_shadow Pos = (<Pos> + (0.0, 80.0))
			GetScreenElementProps \{ Id = sl_clip }
			SetScreenElementProps Id = sl_clip Pos = (<Pos> + (0.0, 80.0))
			GetScreenElementProps \{ Id = sl_highlight }
			SetScreenElementProps Id = sl_highlight Pos = (<Pos> + (0.0, 80.0))
		else
			song_jump_amt = (0.0, 80.0)
		endif
	endif
	FormatText \{ ChecksumName = tier_checksum 'tier%s' s = $setlist_selection_tier }
	song = ($g_gh3_setlist.<tier_checksum>.songs [ $setlist_selection_song ])
	Change target_setlist_songpreview = <song>
	clear_setlist_clip_and_art
	killspawnedscript \{ name = set_song_icon }
	spawnscriptnow \{ set_song_icon }
	FormatText \{ ChecksumName = textid 'id_song%i' i = $setlist_selection_index AddToStringLookup = TRUE }
	retail_menu_focus Id = <textid>
	SetScreenElementProps Id = <textid> Shadow
	<not_header> = 1
	if ($current_tab = tab_setlist)
		if (<jump_tier> = 1)
			Change setlist_begin_text = ($setlist_begin_text + <jump_tier_amt>)
			SetScreenElementProps \{ Id = scrolling_setlist Pos = $setlist_begin_text }
			Change setlist_background_pos = ($setlist_background_pos + <jump_tier_amt>)
			<not_header> = 0
		endif
	endif
	if (<not_header>)
		Change setlist_begin_text = ($setlist_begin_text + <song_jump_amt>)
		SetScreenElementProps \{ Id = scrolling_setlist Pos = $setlist_begin_text }
		Change setlist_background_pos = ($setlist_background_pos + <song_jump_amt>)
	endif
	SetScreenElementProps \{ Id = setlist_menu Pos = $setlist_background_pos }
	SetScreenElementProps \{ Id = setlist_bg_container Pos = $setlist_background_pos }
	SetScreenElementProps \{ Id = setlist_loops_menu Pos = $setlist_background_pos }
	if ($setlist_clip_rot_neg)
		SetScreenElementProps Id = sl_clip rot_angle = (0 - $setlist_clip_last_rot)
		Change \{ setlist_clip_rot_neg = 0 }
	else
		GetRandomValue \{ name = rot a = 10.0 b = -30.0 }
		SetScreenElementProps Id = sl_clip rot_angle = <rot>
		Change setlist_clip_last_rot = <rot>
		Change \{ setlist_clip_rot_neg = 1 }
	endif
	if (<Dir> = Down)
		Change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num + 1)
		if ($setlist_random_images_scroll_num > $setlist_random_images_highest_num)
			Change setlist_random_images_highest_num = ($setlist_random_images_scroll_num)
			Mod a = ($setlist_random_images_highest_num)b = 4
			if (<Mod> = 0)
				setlist_display_random_bg_image
			endif
		endif
		Change setlist_background_loop_num = ($setlist_background_loop_num + 1)
		if ($setlist_background_loop_num = 10)
			Change \{ setlist_background_loop_num = 0 }
			Change setlist_background_loop_pos = ($setlist_background_loop_pos + (0.0, 1308.0))
			displaySprite \{PARENT = setlist_menu tex = Setlist_BG_Loop Pos = $setlist_background_loop_pos dims = (1280.0, 1308.0) z = 3.1}
		endif
		Change setlist_page1_num = ($setlist_page1_num + 1)
		if ($setlist_page1_num = 4)
			Change \{ setlist_page1_num = 0 }
			Change setlist_page1_loop_pos = ($setlist_page1_loop_pos + (0.0, 512.0))
			displaySprite \{PARENT = setlist_loops_menu tex = Setlist_Page1_Loop Pos = $setlist_page1_loop_pos dims = $setlist_page1_dims z = $setlist_page1_z}
		endif
		if ($current_tab = tab_bonus)
			Change setlist_page2_num = ($setlist_page2_num + 1)
			if ($setlist_page2_num = 5)
				Change \{ setlist_page2_num = 0 }
				Change setlist_page2_pos = ($setlist_page2_pos + (0.0, 665.5))
				displaySprite \{PARENT = setlist_loops_menu tex = Setlist_Page2_Loop Pos = $setlist_page2_pos dims = $setlist_page2_dims z = $setlist_page2_z}
			endif
		endif
		Change setlist_line_num = ($setlist_line_num + 1)
		if ($setlist_line_num = 1)
			Change \{ setlist_line_num = 0 }
			<i> = 1
			if NOT (<not_header>)
				<i> = 3
			endif
			begin
				if ($setlist_line_index = $setlist_line_max)
					Change \{ setlist_line_index = 0 }
				endif
				<rand> = Random (@ 0 @ 1 @ 2)
				<line> = ($setlist_solid_lines[<rand>])
				displaySprite PARENT = setlist_menu tex = <line> Pos = $setlist_solid_line_pos dims = (896.0, 16.0) z = ($setlist_page1_z + 0.1)
				Change setlist_line_index = ($setlist_line_index + 1)
				if ($setlist_line_index = $setlist_line_max)
					Change \{ setlist_line_index = 0 }
				endif
				<rand> = Random (@ 0 @ 1 @ 2)
				<line> = ($setlist_dotted_lines[<rand>])
				displaySprite PARENT = setlist_menu tex = <line> Pos = $setlist_dotted_line_pos dims = (896.0, 16.0) z = ($setlist_page1_z + 0.1)
				Change setlist_line_index = ($setlist_line_index + 1)
				Change setlist_solid_line_pos = (($setlist_solid_line_pos)+ ($setlist_solid_line_add))
				Change setlist_dotted_line_pos = (($setlist_dotted_line_pos)+ ($setlist_solid_line_add))
			repeat <i>
		endif
		Change setlist_page3_num = ($setlist_page3_num + 1)
		if ($setlist_page3_num = 5)
			Change \{ setlist_page3_num = 0 }
			Change setlist_page3_pos = ($setlist_page3_pos + (0.0, 532.0))
			displaySprite \{PARENT = setlist_loops_menu tex = Setlist_Page3_Loop Pos = $setlist_page3_pos dims = $setlist_page3_dims z = $setlist_page3_z}
		endif
	else
		Change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num - 1)
		Change setlist_background_loop_num = ($setlist_background_loop_num - 1)
		Change setlist_page1_num = ($setlist_page1_num - 1)
		Change setlist_line_num = ($setlist_line_num - 1)
		Change setlist_line_index = ($setlist_line_index + 1)
		if ($setlist_line_index = $setlist_line_max)
			Change \{ setlist_line_index = 0 }
		endif
		Change setlist_page3_num = ($setlist_page3_num - 1)
		Change setlist_page2_num = ($setlist_page2_num - 1)
	endif
	if GotParam \{ Up }
		generic_menu_up_or_down_sound \{ Up }
	endif
	if GotParam \{ Down }
		generic_menu_up_or_down_sound \{ Down }
	endif
endscript

script setlist_display_random_bg_image
	side = 0
	old_image = 0
	begin
		can_left = 1
		can_right = 1
		flippable = 0
		mydims = (128.0, 128.0)
		minRot = -5
		maxRot = 5
		loffset = (0.0, 0.0)
		roffset = (0.0, 0.0)
		just = [ Left top ]
		GetArraySize ($setlist_random_bg_images)
		begin
			GetRandomValue a = 0 b = (<array_Size> -1)Integer name = randimage
			myimage = ($setlist_random_bg_images [ <randimage> ].texture)
			if NOT (<myimage> = <old_image>)
				if StructureContains Structure = ($setlist_random_bg_images [ <randimage> ])flippable
					<flippable> = 1
				endif
				if StructureContains Structure = ($setlist_random_bg_images [ <randimage> ])dims
					<mydims> = ($setlist_random_bg_images [ <randimage> ].dims)
				endif
				if StructureContains Structure = ($setlist_random_bg_images [ <randimage> ])minRot
					<minRot> = ($setlist_random_bg_images [ <randimage> ].minRot)
				endif
				if StructureContains Structure = ($setlist_random_bg_images [ <randimage> ])maxRot
					<maxRot> = ($setlist_random_bg_images [ <randimage> ].maxRot)
				endif
				if StructureContains Structure = ($setlist_random_bg_images [ <randimage> ])loffset
					<loffset> = ($setlist_random_bg_images [ <randimage> ].loffset)
				endif
				if StructureContains Structure = ($setlist_random_bg_images [ <randimage> ])roffset
					<roffset> = ($setlist_random_bg_images [ <randimage> ].roffset)
				endif
				if StructureContains Structure = ($setlist_random_bg_images [ <randimage> ])only_left
					<can_right> = 0
				endif
				if StructureContains Structure = ($setlist_random_bg_images [ <randimage> ])only_right
					<can_left> = 0
				endif
				if StructureContains Structure = ($setlist_random_bg_images [ <randimage> ])center_just
					<just> = [ center center ]
				endif
				<old_image> = <myimage>
				break
			endif
		repeat
		GetRandomValue \{ a = 300 b = 600 Integer name = randdown }
		if (<side> = 0)
			if (<can_left> = 1)
				imagepos = (($setlist_random_images_highest_num * (0.0, 300.0))+ ((0.0, 1.0) * <randdown>)+ <loffset>)
			else
				imagepos = (($setlist_random_images_highest_num * (0.0, 300.0))+ ((0.0, 1.0) * <randdown>)+ <roffset> + (1000.0, 0.0))
			endif
		else
			if (<can_right> = 1)
				imagepos = (($setlist_random_images_highest_num * (0.0, 300.0))+ ((0.0, 1.0) * <randdown>)+ <roffset> + (1000.0, 0.0))
			else
				imagepos = (($setlist_random_images_highest_num * (0.0, 300.0))+ ((0.0, 1.0) * <randdown>)+ <loffset>)
			endif
		endif
		imageflag = {}
		if (<flippable> = 1)
			GetRandomValue \{ a = 1 b = 3 Integer name = randflip }
			if (<randflip> = 1)
				imageflag = { flip_h flip_v }
			elseif (<randflip> = 2)
				imageflag = { flip_h }
			else
				imageflag = { flip_v }
			endif
		endif
		GetRandomValue a = <minRot> b = <maxRot> name = randrot
		if StructureContains Structure = ($setlist_random_bg_images [ <randimage> ])shoeprint
			displaySprite PARENT = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 BlendMode = subtract
			displaySprite PARENT = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 BlendMode = subtract
			displaySprite PARENT = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 BlendMode = subtract
		else
			displaySprite PARENT = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = 6.0 <imageflag> just = <just>
			displaySprite PARENT = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = 6.0 <imageflag> just = <just>
		endif
		<side> = 1
	repeat 2
endscript

script setlist_songpreview_monitor
	begin
		if NOT ($current_setlist_songpreview = $target_setlist_songpreview)
			Change \{ setlist_songpreview_changing = 1 }
			song = ($target_setlist_songpreview)
			SongUnLoadFSB
			wait \{ 0.5 Second }
			if ($target_setlist_songpreview != <song> || $target_setlist_songpreview = None)
				Change \{ current_setlist_songpreview = None }
				Change \{ setlist_songpreview_changing = 0 }
			else
				get_song_prefix song = <song>
				get_song_struct song = <song>
				if StructureContains Structure = <song_struct> streamname
					song_prefix = (<song_struct>.streamname)
				endif
				if NOT SongLoadFSB song_prefix = <song_prefix>
					Change \{ setlist_songpreview_changing = 0 }
					DownloadContentLost
					return
				endif
				FormatText ChecksumName = song_preview '%s_preview' s = <song_prefix>
				get_song_struct song = <song>
				SoundBussUnlock \{ Music_Setlist }
				if StructureContains Structure = <song_struct> name = band_playback_volume
					setlistvol = ((<song_struct>.band_playback_volume))
					SetSoundBussParams {Music_Setlist = { vol = <setlistvol> }}
				else
					SetSoundBussParams \{Music_Setlist = { vol = 0.0 }}
				endif
				SoundBussLock \{ Music_Setlist }
				PlaySound <song_preview> buss = Music_Setlist
				Change current_setlist_songpreview = <song>
				Change \{ setlist_songpreview_changing = 0 }
			endif
		elseif NOT ($current_setlist_songpreview = None)
			song = ($current_setlist_songpreview)
			get_song_prefix song = <song>
			FormatText ChecksumName = song_preview '%s_preview' s = <song_prefix>
			if NOT issoundplaying <song_preview>
				Change \{ setlist_songpreview_changing = 1 }
				if NOT SongLoadFSB song_prefix = <song_prefix>
					Change \{ setlist_songpreview_changing = 0 }
					DownloadContentLost
					return
				endif
				PlaySound <song_preview> buss = Music_Setlist
				Change \{ setlist_songpreview_changing = 0 }
			endif
		endif
		wait \{ 1 GameFrame }
	repeat
endscript
changing_tab = 0

script change_tab \{ tab = tab_setlist button = 0 }
	Change \{ changing_tab = 1 }
	if ($current_tab = <tab> & <button> = 1)
		Change \{ changing_tab = 0 }
		return
	endif
	if (<tab> = tab_setlist)
		if NOT ($current_tab = <tab>)
			menu_setlist_setlist_tab_sound
		endif
		get_progression_globals game_mode = ($game_mode)
	elseif (<tab> = tab_bonus)
		if NOT ($current_tab = <tab>)
			menu_setlist_bonus_tab_sound
		endif
		get_progression_globals game_mode = ($game_mode)Bonus
	elseif (<tab> = tab_downloads)
		if NOT ($current_tab = <tab>)
			menu_setlist_downloads_tab_sound
		endif
		get_progression_globals game_mode = ($game_mode)Download
	endif
	Change g_gh3_setlist = <tier_global>
	Change current_tab = <tab>
	destroy_setlist_scrolling_menu
	create_setlist_scrolling_menu
	reset_vars \{ del }
	destroy_menu \{ menu_id = setlist_original_artist }
	destroy_menu \{ menu_id = setlist_loops_menu }
	destroy_menu \{ menu_id = setlist_menu }
	CreateScreenElement \{Type = ContainerElement PARENT = root_window Id = setlist_loops_menu Pos = (0.0, 0.0) just = [ Left top ]}
	switch <tab>
		case tab_setlist
			Change \{ setlist_page3_z = 3.3 }
			Change \{ setlist_page2_z = 3.4 }
			Change \{ setlist_page1_z = 3.5 }
			displaySprite \{PARENT = setlist_loops_menu tex = Setlist_Page1_Loop Pos = $setlist_page1_loop_pos dims = $setlist_page1_dims z = $setlist_page1_z}
			displaySprite PARENT = setlist_loops_menu tex = Setlist_Page3_Loop Pos = ($setlist_page3_pos + (-180.0, 614.0))dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_downloads
			Change \{ setlist_page3_z = 3.5 }
			Change \{ setlist_page2_z = 3.4 }
			Change \{ setlist_page1_z = 3.3 }
			displaySprite \{PARENT = setlist_loops_menu tex = Setlist_Page1_Loop Pos = $setlist_page1_loop_pos dims = $setlist_page1_dims z = $setlist_page1_z}
			Change setlist_page3_pos = ($setlist_page3_pos + (0.0, 40.0))
			displaySprite PARENT = setlist_loops_menu tex = Setlist_Page3_Loop Pos = ($setlist_page3_pos + (-180.0, 614.0))dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_bonus
			Change \{ setlist_page3_z = 3.3 }
			Change \{ setlist_page2_z = 3.8 }
			Change \{ setlist_page1_z = 3.4 }
			displaySprite \{PARENT = setlist_loops_menu tex = Setlist_Page1_Loop Pos = $setlist_page1_loop_pos dims = $setlist_page1_dims z = $setlist_page1_z}
			displaySprite PARENT = setlist_loops_menu tex = Setlist_Page3_Loop Pos = ($setlist_page3_pos + (-180.0, 614.0))dims = $setlist_page3_dims z = $setlist_page3_z
			displaySprite PARENT = setlist_loops_menu tex = Setlist_Page2_Loop Pos = ($setlist_page2_pos + (0.0, 553.0))dims = $setlist_page2_dims z = $setlist_page2_z
	endswitch
	create_sl_assets <tab>
	SetScreenElementProps \{ Id = setlist_bg_container Pos = (0.0, 0.0) }
	Change \{ setlist_random_images_scroll_num = 0 }
	Change setlist_page2_pos = ($setlist_page2_pos + (0.0, 553.0))
	Change setlist_page3_pos = ($setlist_page3_pos + (-180.0, 614.0))
	SetScreenElementProps \{ Id = sl_page3_head z_priority = $setlist_page3_z }
	SetScreenElementProps \{ Id = sl_page2_head z_priority = $setlist_page2_z }
	SetScreenElementProps \{ Id = sl_page1_head z_priority = $setlist_page1_z }
	if ($setlist_selection_found = 1)
		FormatText \{ ChecksumName = tier_checksum 'tier%s' s = $setlist_selection_tier }
		song = ($g_gh3_setlist.<tier_checksum>.songs [ $setlist_selection_song ])
		Change target_setlist_songpreview = <song>
	else
		Change \{ target_setlist_songpreview = None }
	endif
	killspawnedscript \{ name = set_song_icon }
	spawnscriptnow \{set_song_icon Params = { no_wait }}
	if ($is_network_game = 0)
		LaunchEvent \{ Type = Focus Target = vmenu_setlist }
	else
		if ($net_current_flow_state = song)
			LaunchEvent \{ Type = Focus Target = vmenu_setlist }
		endif
	endif
	Change \{ changing_tab = 0 }
endscript

script reset_vars
	if GotParam \{ del }
		Change \{ setlist_begin_text = (0.0, 0.0) }
		Change \{ setlist_background_pos = (0.0, 0.0) }
		Change \{ setlist_background_loop_pos = (0.0, 676.0) }
		Change \{ setlist_background_loop_num = 0 }
		Change \{ setlist_selection_index = 0 }
		destroy_menu \{ menu_id = sl_overshadow }
		destroy_menu \{ menu_id = sl_clipart }
		destroy_menu \{ menu_id = sl_clipart_shadow }
		destroy_menu \{ menu_id = sl_clip }
		destroy_menu \{ menu_id = sl_bg_helper }
		destroy_menu \{ menu_id = sl_highlight }
		destroy_menu \{ menu_id = sl_fixed }
	endif
	Change \{ setlist_page1_num = 0 }
	Change \{ setlist_page1_loop_pos = (157.0, 768.0) }
	Change \{ setlist_line_num = 0 }
	Change \{ setlist_page3_pos = (210.0, 86.0) }
	Change \{ setlist_page3_num = 0 }
	Change \{ setlist_page2_num = 0 }
	Change \{ setlist_page2_pos = (240.0, 50.0) }
	Change \{ setlist_line_index = 0 }
	Change \{ setlist_clip_last_rot = 0 }
	Change \{ setlist_clip_rot_neg = 0 }
endscript

script IsSongAvailable \{ for_bonus = 0 }
	if ($coop_dlc_active = 1)
		if (<song> = paintitblack)
			return \{ FALSE }
		endif
	endif
	if ($is_network_game = 1)
		if is_song_downloaded song_checksum = <song>
			GetGlobalTags <song>
			if (<available_on_other_client> = 1)
				return \{ TRUE }
			endif
		endif
	else
		if NOT is_song_downloaded song_checksum = <song>
			return \{ FALSE }
		endif
		if (<Download> = 1)
			return \{ TRUE }
		elseif (<for_bonus> = 1)
			GetGlobalTags <song> param = unlocked
		else
			GetGlobalTags <song_checksum> param = unlocked
		endif
		if (<unlocked> = 1)
			return \{ TRUE }
		endif
	endif
	return \{ FALSE }
endscript
we_have_songs = FALSE

script create_sl_assets
	CreateScreenElement \{Type = ContainerElement PARENT = root_window Id = setlist_menu Pos = (0.0, 0.0) just = [ Left top ]}
	if NOT ScreenElementExists \{ Id = setlist_bg_container }
		CreateScreenElement \{Type = ContainerElement PARENT = root_window Id = setlist_bg_container Pos = (0.0, 0.0) just = [ Left top ]}
	endif
	displaySprite \{Id = sl_bg_head PARENT = setlist_menu tex = Setlist_BG_Head Pos = (0.0, 0.0) dims = (1280.0, 676.0) z = 3.1}
	displaySprite \{Id = sl_bg_loop PARENT = setlist_menu tex = Setlist_BG_Loop Pos = $setlist_background_loop_pos dims = (1280.0, 1352.0) z = 3.1}
	begin
		displaySprite \{PARENT = setlist_menu tex = Setlist_Shoeprint Pos = (850.0, -70.0) dims = (640.0, 768.0) Alpha = 0.15 z = 3.2 flip_v rot_angle = 10 BlendMode = subtract}
	repeat 3
	displaySprite \{Id = sl_page3_head PARENT = setlist_menu tex = Setlist_Page3_Head Pos = $setlist_page3_pos dims = (922.0, 614.0) z = $setlist_page3_z}
	displaySprite \{Id = sl_page2_head PARENT = setlist_menu tex = Setlist_Page2_Head Pos = $setlist_page2_pos dims = (819.0, 553.0) z = $setlist_page2_z}
	displaySprite \{flip_h Id = sl_page1_head PARENT = setlist_menu tex = Setlist_Page1_Head Pos = (160.0, 0.0) dims = (922.0, 768.0) z = $setlist_page1_z}
	displaySprite PARENT = setlist_menu tex = Setlist_Page1_Line_Red Pos = (320.0, 12.0) dims = (8.0, 6400.0) z = ($setlist_page1_z + 0.1)
	<title_pos> = (300.0, 383.0)
	displaySprite Id = sl_page1_head_lines PARENT = setlist_menu tex = Setlist_Page1_Head_Lines Pos = (176.0, 64.0) dims = (896.0, 320.0) z = ($setlist_page1_z + 0.1)
	<begin_line> = (176.0, 420.0)
	<solid_line_pos> = (176.0, 340.0)
	<dotted_line_pos> = (176.0, 380.0)
	<dotted_line_add> = ($setlist_solid_line_add)
	begin
		<rand> = Random (@ 0 @ 1 @ 2)
		<line> = ($setlist_solid_lines[<rand>])
		<solid_line_pos> = (<solid_line_pos> + $setlist_solid_line_add)
		displaySprite PARENT = setlist_menu tex = <line> Pos = <solid_line_pos> dims = (883.0, 16.0) z = ($setlist_page1_z + 0.1)
	repeat 8
	begin
		<rand> = Random (@ 0 @ 1 @ 2)
		<line> = ($setlist_dotted_lines[<rand>])
		<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
		displaySprite PARENT = setlist_menu tex = <line> Pos = <dotted_line_pos> dims = (883.0, 16.0) z = ($setlist_page1_z + 0.1)
	repeat 8
	<solid_line_pos> = (<solid_line_pos> + $setlist_solid_line_add)
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	Change setlist_solid_line_pos = <solid_line_pos>
	Change setlist_dotted_line_pos = <dotted_line_pos>
	Change \{ setlist_num_songs = 0 }
	if English
		setlist_header_tex = Setlist_Page1_Title
	elseif French
		setlist_header_tex = Setlist_Page1_Title_fr
	elseif German
		setlist_header_tex = Setlist_Page1_Title_de
	elseif Spanish
		setlist_header_tex = Setlist_Page1_Title_sp
	elseif Italian
		setlist_header_tex = Setlist_Page1_Title_it
	elseif #"0x6eaa363c"
		setlist_header_tex = Setlist_Page1_Title
	endif
	if GotParam \{ tab_setlist }
		displaySprite Id = sl_page1_title PARENT = setlist_menu tex = <setlist_header_tex> Pos = (330.0, 220.0) dims = (512.0, 128.0) Alpha = 0.7 z = ($setlist_page1_z + 0.2)rot_angle = 0
		displaySprite PARENT = sl_page1_title tex = <setlist_header_tex> Pos = (-5.0, 10.0) dims = (512.0, 128.0) Alpha = 0.2 z = ($setlist_page1_z + 0.2)rot_angle = -2
		GetUpperCaseString ($g_gh3_setlist.tier1.Title)
		displayText Id = sl_text_1 PARENT = setlist_menu Scale = (1.0, 1.0) text = <UpperCaseString> rgba = [ 195 80 45 255 ] Pos = <title_pos> z = $setlist_text_z noshadow
	endif
	if GotParam \{ tab_downloads }
		displayText \{PARENT = setlist_menu Id = sl_text_1 text = "DOWNLOADED SONGS" font = text_a10 Scale = 2 Pos = (330.0, 220.0) rgba = [ 50 30 20 255 ] z = $setlist_text_z noshadow}
		displaySprite PARENT = setlist_menu tex = Setlist_Page1_Line_Red Pos = (320.0, 216.0) dims = (8.0, 6400.0) z = ($setlist_page1_z - 0.2)
	endif
	if GotParam \{ tab_bonus }
		displayText \{PARENT = setlist_menu Id = sl_text_1 text = "BONUS SONGS" font = text_a10 Scale = 2 Pos = (330.0, 220.0) rgba = [ 50 30 20 255 ] z = $setlist_text_z noshadow}
		displaySprite PARENT = setlist_menu tex = Setlist_Page1_Line_Red Pos = (320.0, 216.0) dims = (8.0, 6400.0) z = ($setlist_page1_z - 0.2)
	endif
	<text_pos> = (<title_pos> + (40.0, 54.0))
	if ((GotParam tab_setlist)|| (GotParam tab_bonus)|| (GotParam tab_downloads))
		num_tiers = ($g_gh3_setlist.num_tiers)
		<Tier> = 0
		Change \{ setlist_selection_index = 0 }
		Change \{ setlist_selection_tier = 1 }
		Change \{ setlist_selection_song = 0 }
		Change \{ setlist_selection_found = 0 }
		begin
			<Tier> = (<Tier> + 1)
			setlist_prefix = ($g_gh3_setlist.prefix)
			FormatText ChecksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
			FormatText ChecksumName = tier_checksum 'tier%s' s = <Tier>
			GetGlobalTags <tiername> param = unlocked
			if (<unlocked> = 1 || $is_network_game = 1)
				if NOT (<Tier> = 1)
					<text_pos> = (<text_pos> + (-40.0, 110.0))
					GetUpperCaseString ($g_gh3_setlist.<tier_checksum>.Title)
					displayText PARENT = setlist_menu Scale = (1.0, 1.0) text = <UpperCaseString> rgba = [ 190 75 40 255 ] Pos = <text_pos> z = $setlist_text_z noshadow
					<text_pos> = (<text_pos> + (40.0, 50.0))
				endif
				Change \{ we_have_songs = FALSE }
				GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
				num_songs = <array_Size>
				num_songs_unlocked = 0
				song_count = 0
				if (<array_Size> > 0)
					begin
						setlist_prefix = ($g_gh3_setlist.prefix)
						FormatText ChecksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1)s = <Tier> AddToStringLookup = TRUE
						for_bonus = 0
						if ($current_tab = tab_bonus)
							<for_bonus> = 1
						endif
						if IsSongAvailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [ <song_count> ])for_bonus = <for_bonus>
							if ($setlist_selection_found = 0)
								Change setlist_selection_tier = <Tier>
								Change setlist_selection_song = <song_count>
								Change \{ setlist_selection_found = 1 }
							endif
							get_song_title song = ($g_gh3_setlist.<tier_checksum>.songs [ <song_count> ])
							get_song_prefix song = ($g_gh3_setlist.<tier_checksum>.songs [ <song_count> ])
							get_song_artist song = ($g_gh3_setlist.<tier_checksum>.songs [ <song_count> ])
							FormatText \{ ChecksumName = textid 'id_song%i' i = $setlist_num_songs AddToStringLookup = TRUE }
							CreateScreenElement {
								Type = TextElement
								Id = <textid>
								PARENT = setlist_menu
								Scale = (0.8500000238418579, 0.8500000238418579)
								text = <song_title>
								Pos = <text_pos>
								rgba = [ 50 30 10 255 ]
								z_priority = $setlist_text_z
								font = text_A5
								just = [ Left top ]
								font_spacing = 0.5
								no_shadow
								shadow_offs = (1.0, 1.0)
								shadow_rgba = [ 0 0 0 255 ]
							}
							get_difficulty_text_nl difficulty = ($current_difficulty)
							get_song_prefix song = ($g_gh3_setlist.<tier_checksum>.songs [ <song_count> ])
							FormatText ChecksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
							GetGlobalTags <song_checksum>
							GetGlobalTags <songname>
							if ($game_mode = p1_quickplay)
								get_quickplay_song_stars song = <song_prefix>
							endif
							if NOT ($game_mode = training || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
								if Progression_IsBossSong tier_global = $g_gh3_setlist Tier = <Tier> song = ($g_gh3_setlist.<tier_checksum>.songs [ <song_count> ])
									stars = 0
								endif
								if ($game_mode = p1_quickplay)
									GetGlobalTags <songname> param = percent100
								else
									GetGlobalTags <song_checksum> param = percent100
								endif
								if (<stars> > 2)
									<star_space> = (20.0, 0.0)
									<star_pos> = (<text_pos> + (660.0, 0.0))
									begin
										if (<percent100> = 1)
											<star> = Setlist_Goldstar
										else
											<rand> = Random (@ 0 @ 1 @ 2)
											<star> = ($setlist_loop_stars[<rand>])
										endif
										<star_pos> = (<star_pos> - <star_space>)
										displaySprite PARENT = setlist_menu tex = <star> rgba = [ 233 205 166 255 ] z = $setlist_text_z Pos = <star_pos>
									repeat <stars>
								endif
								GetGlobalTags <song_checksum> param = score
								if ($game_mode = p1_quickplay)
									get_quickplay_song_score song = <song_prefix>
								endif
								if (<score> > 0)
									if Progression_IsBossSong tier_global = $g_gh3_setlist Tier = <Tier> song = ($g_gh3_setlist.<tier_checksum>.songs [ <song_count> ])
										if (<score> = 1)
											FormatText \{ textname = score_text "WUSSED OUT" }
										else
											FormatText \{ textname = score_text "BATTLE WON" }
										endif
									else
										FormatText textname = score_text "%d" d = <score> usecommas
									endif
									<score_pos> = (<text_pos> + (660.0, 40.0))
									CreateScreenElement {
										Type = TextElement
										PARENT = setlist_menu
										Scale = (0.75, 0.75)
										text = <score_text>
										Pos = <score_pos>
										rgba = [ 100 120 160 255 ]
										z_priority = $setlist_text_z
										font = text_A5
										just = [ Right top ]
										noshadow
									}
								endif
							endif
							<text_pos> = (<text_pos> + (60.0, 40.0))
							FormatText \{ ChecksumName = artistid 'artist_id%d' d = $setlist_num_songs }
							GetUpperCaseString <song_artist>
							song_artist = <UpperCaseString>
							displayText PARENT = setlist_menu Scale = (0.6000000238418579, 0.6000000238418579) Id = <artistid> text = <song_artist> rgba = [ 60 100 140 255 ] Pos = <text_pos> z = $setlist_text_z font_spacing = 1 noshadow
							<text_pos> = (<text_pos> + (-60.0, 40.0))
							Change setlist_num_songs = ($setlist_num_songs + 1)
							num_songs_unlocked = (<num_songs_unlocked> + 1)
							Change \{ we_have_songs = TRUE }
						endif
						song_count = (<song_count> + 1)
					repeat <num_songs>
				endif
				if ((($game_mode = p1_career)|| ($game_mode = p2_career))& (GotParam tab_setlist)& $is_demo_mode = 0)
					GetGlobalTags <tiername> param = complete
					if (<complete> = 0)
						GetGlobalTags <tiername> param = boss_unlocked
						GetGlobalTags <tiername> param = encore_unlocked
						if (<encore_unlocked> = 1)
							FormatText \{ textname = completeText "Beat encore song to continue" }
						elseif (<boss_unlocked> = 1)
							FormatText \{ textname = completeText "Beat boss song to continue" }
						else
							GetGlobalTags <tiername> param = num_songs_to_progress
							FormatText textname = completeText "Beat %d of %p songs to continue" d = <num_songs_to_progress> p = <num_songs_unlocked>
						endif
						displayText PARENT = setlist_menu Scale = (0.6000000238418579, 0.6000000238418579) text = <completeText> Pos = (<text_pos> + (160.0, 0.0))z = $setlist_text_z rgba = [ 30 30 30 255 ] noshadow
					endif
				endif
			endif
		repeat <num_tiers>
	endif
	if ((($game_mode = p1_career)|| ($game_mode = p2_career))& $is_demo_mode = 0)
		get_progression_globals game_mode = ($game_mode)
		summation_career_score tier_global = <tier_global>
		FormatText textname = total_score_text "Career Score: %d" d = <career_score> usecommas
		displayText {
			PARENT = setlist_menu
			Scale = 0.7
			text = <total_score_text>
			Pos = ((640.0, 120.0) + (<text_pos>.(0.0, 1.0) * (0.0, 1.0)))
			just = [ center top ]
			z = $setlist_text_z
			rgba = [ 30 30 30 255 ]
			noshadow
		}
	endif
	Change \{ setlist_begin_text = $setlist_menu_pos }
	if ($setlist_num_songs > 0)
		retail_menu_focus \{ Id = id_song0 }
		SetScreenElementProps \{ Id = id_song0 Shadow }
	endif
	CreateScreenElement \{Type = ContainerElement PARENT = root_window Id = sl_fixed Pos = (0.0, 0.0) just = [ Left top ]}
	<clip_pos> = (160.0, 390.0)
	displaySprite Id = sl_clipart PARENT = sl_fixed Pos = <clip_pos> dims = (160.0, 160.0) z = ($setlist_text_z + 0.1)rgba = [ 200 200 200 255 ]
	displaySprite Id = sl_clipart_shadow PARENT = sl_fixed Pos = (<clip_pos> + (3.0, 3.0))dims = (160.0, 160.0) z = ($setlist_text_z)rgba = [ 0 0 0 128 ]
	<clip_pos> = (<clip_pos> + (15.0, 50.0))
	displaySprite Id = sl_clip PARENT = sl_fixed tex = Setlist_Clip just = [ -0.5 -0.9 ] Pos = <clip_pos> dims = (141.0, 102.0) z = ($setlist_text_z + 0.2)
	if ($current_tab = tab_setlist)
		hilite_dims = (737.0, 80.0)
	elseif ($current_tab = tab_downloads)
		hilite_dims = (722.0, 80.0)
	elseif ($current_tab = tab_bonus)
		hilite_dims = (690.0, 80.0)
	endif
	displaySprite Id = sl_highlight PARENT = sl_fixed tex = White Pos = (326.0, 428.0) dims = <hilite_dims> z = ($setlist_text_z - 0.1)rgba = [ 255 255 255 128 ]
	<bg_helper_pos> = (140.0, 585.0)
	<helper_rgba> = [ 105 65 7 160 ]
	Change \{ user_control_pill_gap = 100 }
	if ($current_tab = tab_setlist)
		setlist_show_helperbar Pos = (<bg_helper_pos> + (64.0, 4.0))
	elseif ($current_tab = tab_bonus)
		setlist_show_helperbar {
			Pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = "SETLIST"
			text_option2 = "DOWNLOADS"
			button_option1 = "\\b6"
			button_option2 = "\\b8"
		}
	else
		setlist_show_helperbar {
			Pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = "SETLIST"
			text_option2 = "BONUS"
			button_option1 = "\\b6"
			button_option2 = "\\b7"
		}
	endif
	displaySprite \{Id = sl_overshadow rgba = [ 105 65 7 160 ] PARENT = root_window tex = Setlist_Overshadow Pos = (0.0, 0.0) dims = (1280.0, 720.0) z = 5.0}
endscript

script get_quickplay_song_score
	get_difficulty_text_nl difficulty = ($current_difficulty)
	FormatText ChecksumName = songname '%s_%d' s = <song> d = <difficulty_text_nl>
	GetGlobalTags <songname>
	return score = <bestscore>
endscript

script get_quickplay_song_stars
	get_difficulty_text_nl difficulty = ($current_difficulty)
	FormatText ChecksumName = songname '%s_%d' s = <song> d = <difficulty_text_nl>
	GetGlobalTags <songname>
	return stars = <beststars>
endscript

script setlist_show_helperbar \{text_option1 = "BONUS" text_option2 = "DOWNLOADS" button_option1 = "\\b7" button_option2 = "\\b8" spacing = 16}
	if NOT English
		Change \{ pill_helper_max_width = 65 }
	endif
	text_options = [
		"UP/DOWN"
		"SELECT"
		"BACK"
	]
	button_options = [
		"\\bb"
		"\\m0"
		"\\m1"
	]
	i = 0
	begin
		if (<i> > 2)
			if (<i> = 3)
				<text1> = <button_option1>
			else
				<text1> = <button_option2>
			endif
		else
			<text1> = (<button_options>[<i>])
		endif
		if (<i> > 2)
			if (<i> = 3)
				<text2> = <text_option1>
			else
				<text2> = <text_option2>
			endif
		else
			<text2> = (<text_options>[<i>])
		endif
		switch <text1>
			case "\\bb"
				<button> = strumbar
			case "\\m0"
				<button> = Green
			case "\\m1"
				<button> = Red
			case "\\b6"
				<button> = Yellow
			case "\\b7"
				<button> = Blue
			case "\\b8"
				<button> = Orange
		endswitch
		Change \{user_control_pill_text_color = [ 0 0 0 255 ]}
		Change \{user_control_pill_color = [ 180 180 180 255 ]}
		if ($is_network_game = 1)
			if IsHost
				if ($host_songs_to_pick > 0)
					if NOT (($g_tie_breaker_song = 1)& (<i> = 2))
						add_user_control_helper text = <text2> button = <button> z = 100
					endif
				endif
			else
				if ($client_songs_to_pick > 0)
					if NOT (($g_tie_breaker_song = 1)& (<i> = 2))
						add_user_control_helper text = <text2> button = <button> z = 100
					endif
				endif
			endif
		else
			add_user_control_helper text = <text2> button = <button> z = 100
		endif
		<i> = (<i> + 1)
	repeat 5
	tabs_text = [ "setlist" "bonus" "downloads" ]
	setlist_text_positions = [ (300.0, 70.0) (624.0, 102.0) (870.0, 120.0) ]
	download_text_positions = [ (300.0, 70.0) (624.0, 102.0) (870.0, 160.0) ]
	buttons_text = [ "\\b7" "\\b6" "\\b8" ]
	setlist_button_positions = [ (580.0, 90.0) (260.0, 65.0) (830.0, 110.0) ]
	download_button_positions = [ (580.0, 90.0) (260.0, 65.0) (830.0, 150.0) ]
	i = 0
	begin
		button_text_pos = (<setlist_button_positions>[<i>])
		if ($current_tab = tab_downloads)
			<button_text_pos> = (<download_button_positions>[<i>])
		endif
		displayText PARENT = setlist_menu Scale = 1 text = (<buttons_text>[<i>]) rgba = [ 128 128 128 255 ] Pos = <button_text_pos> z = 50 font = buttonsxenon
		tab_text_pos = (<setlist_text_positions>[<i>])
		if ($current_tab = tab_downloads)
			<tab_text_pos> = (<download_text_positions>[<i>])
		endif
		displayText PARENT = setlist_menu Scale = 1 text = (<tabs_text>[<i>]) rgba = [ 0 0 0 255 ] Pos = <tab_text_pos> z = 50 noshadow
		<i> = (<i> + 1)
	repeat 3
endscript
