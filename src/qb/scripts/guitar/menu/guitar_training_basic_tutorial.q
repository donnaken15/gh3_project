training_basic_tutorial_script = [
	{ call = training_basic_tutorial_startup }
	{ Time = 1000 call = training_basic_tutorial_show_title }
	{ lesson = 1 call = training_1_1_show_guitar }
	{ call = training_1_1_start_guitar_vo }
	{ rel_time = 4500 call = training_1_1_show_fret_placement }
	{ rel_time = 10000 call = training_1_1_show_strum }
	{ rel_time = 8000 call = training_1_1_show_lesson_header }
	{ call = training_1_1_zoom_guitar }
	{ call = training_1_1_wait_for_tuning_complete }
	{ call = training_1_1_tuning_complete_message }
	{ lesson = 2 call = training_1_2_start_gem_scroller }
	{ call = training_1_2_show_lesson }
	{ call = training_1_2_wait_for_hit_notes }
	{ call = training_1_2_show_complete_message }
	{ lesson = 3 call = training_1_3_start_gem_scroller }
	{ call = training_1_3_show_lesson }
	{ call = training_1_2_wait_for_hit_notes }
	{ call = training_1_3_show_complete_message }
	{ lesson = 4 call = training_1_4_start_gem_scroller }
	{ call = training_1_4_show_lesson }
	{ call = training_1_2_wait_for_hit_notes }
	{ call = training_1_4_show_complete_message }
	{ lesson = 5 call = training_1_5_start_gem_scroller }
	{ call = training_1_5_show_lesson }
	{ call = training_1_2_wait_for_hit_notes }
	{ call = training_1_5_show_complete_message }
	{ lesson = 6 call = training_1_6_show_hud }
	{ call = training_1_6_hide_hud }
	{ rel_time = 1000 call = training_1_6_complete }
	{ call = training_basic_tutorial_1_end }
]

script training_basic_tutorial_startup
	training_init_session
	LaunchEvent \{ Type = unfocus Target = root_window }
	training_create_narrator_icons
endscript

script training_create_narrator_icons
	CreateScreenElement \{PARENT = training_container Type = SpriteElement Id = god_icon just = [ center center ] texture = #"0xe87317c0" Pos = (280.0, 140.0) rot_angle = 0 rgba = [ 255 255 255 255 ] Scale = (1.399999976158142, 1.399999976158142) z_priority = 5}
	CreateScreenElement \{PARENT = training_container Type = SpriteElement Id = lou_icon just = [ center center ] texture = #"0x8e96d8d3" Pos = (280.0, 140.0) rot_angle = 0 rgba = [ 255 255 255 255 ] Scale = (1.399999976158142, 1.399999976158142) z_priority = 5}
	safe_hide \{ Id = god_icon }
	safe_hide \{ Id = lou_icon }
endscript

script training_destroy_narrator_icons
	safe_Destroy \{ Id = god_icon }
	safe_Destroy \{ Id = lou_icon }
endscript

script training_basic_tutorial_show_title
	training_show_title \{ Title = "Guitar Hero Basics Tutorial" }
	begin
		if ($transitions_locked = 0)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	create_training_pause_handler
	safe_show \{ Id = god_icon }
	training_play_sound \{ Sound = 'Tutorial_1_Intro_01_God' wait }
	training_destroy_title
endscript

script training_1_1_show_guitar
	CreateScreenElement \{PARENT = training_container Type = SpriteElement Id = guitar_sprite just = [ center center ] texture = training_guitar Pos = (630.0, 400.0) rot_angle = 0 rgba = [ 255 255 255 255 ] Scale = (0.4000000059604645, 0.4000000059604645) z_priority = 4}
	training_create_strum_sprites
	hide_strum_fingers
	safe_show \{ Id = strum_middle_sprite }
endscript

script training_1_1_start_guitar_vo
	training_play_sound \{ Sound = 'Tutorial_1_Intro_02_God' wait }
endscript

script training_create_fret_finger_sprites
	wrist_pos = (455.0, 362.0)
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = hand_wrist
		just = [ center center ]
		texture = training_hand_wrist
		Pos = <wrist_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 5
	}
	hand_pos = (407.0, 430.0)
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_none_sprite
		just = [ center center ]
		texture = training_hand_button_none
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_green_sprite
		just = [ center center ]
		texture = training_hand_button_g
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_red_sprite
		just = [ center center ]
		texture = training_hand_button_r
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_yellow_sprite
		just = [ center center ]
		texture = training_hand_button_y
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_green_red_sprite
		just = [ center center ]
		texture = training_hand_button_gr
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = fret_green_red_yellow_sprite
		just = [ center center ]
		texture = training_hand_button_gry
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 5
	}
endscript

script training_destroy_fret_finger_sprites
	safe_Destroy \{ Id = fret_none_sprite }
	safe_Destroy \{ Id = fret_green_sprite }
	safe_Destroy \{ Id = fret_red_sprite }
	safe_Destroy \{ Id = fret_yellow_sprite }
	safe_Destroy \{ Id = fret_green_red_sprite }
	safe_Destroy \{ Id = fret_green_red_yellow_sprite }
	safe_Destroy \{ Id = hand_wrist }
endscript

script training_1_1_show_fret_placement
	training_create_fret_finger_sprites
	pose_fret_fingers \{ Color = None }
	spawnscriptnow \{ training_animate_fret_fingers Id = training_spawned_script }
	training_add_arrow \{ Id = training_arrow life = 8.0 Pos = (410.0, 360.0) Scale = 0.7 }
endscript

script training_animate_fret_fingers
	wait \{ 2 seconds IgnoreSlomo }
	begin
		pose_fret_fingers \{ Color = Green }
		wait \{ 0.5 seconds IgnoreSlomo }
		pose_fret_fingers \{ Color = Red }
		wait \{ 0.5 seconds IgnoreSlomo }
		pose_fret_fingers \{ Color = Yellow }
		wait \{ 0.5 seconds IgnoreSlomo }
		pose_fret_fingers \{ Color = Red }
		wait \{ 0.5 seconds IgnoreSlomo }
	repeat 2
	pose_fret_fingers \{ Color = Green }
endscript

script pose_fret_fingers
	hide_fret_fingers
	switch (<Color>)
		case None
			safe_show \{ Id = fret_none_sprite }
		case Green
			safe_show \{ Id = fret_green_sprite }
		case Red
			safe_show \{ Id = fret_red_sprite }
		case Yellow
			safe_show \{ Id = fret_yellow_sprite }
		case green_red
			safe_show \{ Id = fret_green_red_sprite }
		case green_red_yellow
			safe_show \{ Id = fret_green_red_yellow_sprite }
	endswitch
	safe_show \{ Id = hand_wrist }
endscript

script hide_fret_fingers
	safe_hide \{ Id = fret_none_sprite }
	safe_hide \{ Id = fret_green_sprite }
	safe_hide \{ Id = fret_red_sprite }
	safe_hide \{ Id = fret_yellow_sprite }
	safe_hide \{ Id = fret_green_sprite }
	safe_hide \{ Id = fret_green_red_sprite }
	safe_hide \{ Id = fret_green_red_yellow_sprite }
	safe_hide \{ Id = hand_wrist }
endscript

script training_animate_strum_fingers
	pose_strum_fingers \{ Pos = middle }
	wait \{ 2 seconds IgnoreSlomo }
	begin
		pose_strum_fingers \{ Pos = middle }
		wait \{ 0.5 seconds IgnoreSlomo }
		pose_strum_fingers \{ Pos = Up }
		wait \{ 0.5 seconds IgnoreSlomo }
		pose_strum_fingers \{ Pos = middle }
		wait \{ 0.5 seconds IgnoreSlomo }
		pose_strum_fingers \{ Pos = Down }
		wait \{ 0.5 seconds IgnoreSlomo }
	repeat 2
	pose_strum_fingers \{ Pos = middle }
endscript

script pose_strum_fingers
	hide_strum_fingers
	switch (<Pos>)
		case middle
			Id = strum_middle_sprite
			hand_id = hand_strum_middle_sprite
		case Up
			Id = strum_up_sprite
			hand_id = hand_strum_down_sprite
		case Down
			Id = strum_down_sprite
			hand_id = hand_strum_up_sprite
	endswitch
	DoScreenElementMorph Id = <Id> Alpha = 1
	DoScreenElementMorph Id = <hand_id> Alpha = 1
endscript

script hide_strum_fingers
	safe_hide \{ Id = strum_middle_sprite }
	safe_hide \{ Id = strum_up_sprite }
	safe_hide \{ Id = strum_down_sprite }
	safe_hide \{ Id = hand_strum_middle_sprite }
	safe_hide \{ Id = hand_strum_up_sprite }
	safe_hide \{ Id = hand_strum_down_sprite }
endscript

script training_create_strum_sprites
	if IsWinPort
		strum_pos = (830.0, 398.0)
	else
		strum_pos = (850.0, 400.0)
	endif
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = strum_middle_sprite
		just = [ center center ]
		texture = training_guitar_strum
		Pos = <strum_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = strum_up_sprite
		just = [ center center ]
		texture = training_guitar_strum_up
		Pos = <strum_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 5
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = strum_down_sprite
		just = [ center center ]
		texture = training_guitar_strum_down
		Pos = <strum_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 5
	}
	if IsWinPort
		hand_strum_pos = (925.0, 358.0)
	else
		hand_strum_pos = (945.0, 360.0)
	endif
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = hand_strum_middle_sprite
		just = [ center center ]
		texture = training_hand_strum
		Pos = <hand_strum_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 6
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = hand_strum_up_sprite
		just = [ center center ]
		texture = training_hand_strum_up
		Pos = <hand_strum_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 6
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = hand_strum_down_sprite
		just = [ center center ]
		texture = training_hand_strum_down
		Pos = <hand_strum_pos>
		rot_angle = 0
		rgba = [ 255 255 255 255 ]
		Scale = (0.4000000059604645, 0.4000000059604645)
		z_priority = 6
	}
endscript

script training_destory_strum_sprites
	safe_Destroy \{ Id = strum_middle_sprite }
	safe_Destroy \{ Id = strum_up_sprite }
	safe_Destroy \{ Id = strum_down_sprite }
	safe_Destroy \{ Id = hand_strum_middle_sprite }
	safe_Destroy \{ Id = hand_strum_up_sprite }
	safe_Destroy \{ Id = hand_strum_down_sprite }
endscript

script training_1_1_show_strum
	if IsWinPort
		training_add_arrow \{ Id = training_strum_arrow life = 7 Pos = (830.0, 358.0) Scale = 0.7 }
	else
		training_add_arrow \{ Id = training_strum_arrow life = 7 Pos = (850.0, 360.0) Scale = 0.7 }
	endif
	spawnscriptnow \{ training_animate_strum_fingers Id = training_spawned_script }
endscript

script training_1_1_show_lesson_header
	training_set_lesson_header_text \{ text = "LESSON 1: GUITAR TUNING" }
	training_set_lesson_header_body \{ text = "1. HOLD Fret Button to CHOOSE note\\n2. PRESS Strum Bar up or down to PLAY note" }
	training_set_task_header_body \{ text = "Play each note 3 times to continue" }
	training_show_lesson_header
	training_play_sound \{ Sound = 'Tutorial_1_Intro_03_god' wait }
endscript

script training_1_1_zoom_guitar
	Change \{training_notes_strummed = [0 0 0 0 0]}
	Change \{ total_notes_strummed = 0 }
	training_play_sound \{ Sound = 'tutorial_1a_01_god' }
	killspawnedscript \{ name = training_animate_fret_fingers }
	killspawnedscript \{ name = training_animate_strum_fingers }
	hide_strum_fingers
	hide_fret_fingers
	if ScreenElementExists \{ Id = guitar_sprite }
		guitar_sprite ::DoMorph \{ Scale = (1.0, 1.0) Pos = (1100.0, 400.0) Time = 0.75 }
	endif
	SetMenuAutoRepeatTimes \{ (60.0, 60.0) }
	spawnscriptnow \{ training_watch_buttons Id = training_spawned_script }
	training_wait_for_sound \{ Sound = 'en_tutorial_1a_01_god' }
endscript

script training_1_1_wait_for_tuning_complete
	training_show_task_header
	if ScreenElementExists \{ Id = menu_tutorial }
		LaunchEvent \{ Type = unfocus Target = menu_tutorial }
		destroy_menu \{ menu_id = menu_tutorial }
	endif
	event_handlers = [
		{ pad_up training_strummed_guitar }
		{ pad_down training_strummed_guitar }
		{ pad_start show_training_pause_screen }
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	Change \{ lesson_complete = 0 }
	begin
		if ($lesson_complete = 1)
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	LaunchEvent \{ Type = unfocus Target = menu_tutorial }
	destroy_menu \{ menu_id = menu_tutorial }
	create_training_pause_handler
	killspawnedscript \{ name = training_watch_buttons }
	SetMenuAutoRepeatTimes \{ (0.30000001192092896, 0.05000000074505806) }
	wait \{ 2 seconds IgnoreSlomo }
endscript
training_notes_strummed = [
	0
	0
	0
	0
	0
]
total_notes_strummed = 0
total_notes_tuned = 0

script training_strummed_guitar
	GetHeldPattern controller = ($player1_status.controller)nobrokenstring
	check_button = 65536
	array_count = 0
	note_played = 0
	notes_played = 0
	begin
		if (<hold_pattern> & <check_button>)
			note_played = <array_count>
			notes_played = (<notes_played> + 1)
		endif
		<check_button> = (<check_button> / 16)
		array_count = (<array_count> + 1)
	repeat 5
	if (<notes_played> = 1)
		if ($training_notes_strummed [ <note_played> ] < 3)
			SetArrayElement ArrayName = training_notes_strummed GlobalArray Index = <note_played> NewValue = ($training_notes_strummed [ <note_played> ] + 1)
			Change total_notes_strummed = ($total_notes_strummed + 1)
			training_hit_note note = <note_played>
			spawnscriptnow GH_SFX_Training_Tuning_Strings Params = {note_played = <note_played> training_notes_strummed = ($training_notes_strummed [ <note_played> ])}
			if ($training_notes_strummed [ <note_played> ] = 3)
				FormatText ChecksumName = note_tuned 'note_tuned_%a' a = <note_played>
				Change total_notes_tuned = ($total_notes_tuned + 1)
				CreateScreenElement {
					PARENT = training_container
					Type = SpriteElement
					Id = <note_tuned>
					just = [ center center ]
					texture = training_guitar_button_tuned
					Pos = ((442.0, 396.0) + (1.0, 0.0) * (<note_played> * 67))
					rot_angle = 0
					rgba = [ 255 255 255 255 ]
					Scale = (0.36000001430511475, 0.36000001430511475)
					z_priority = 7
				}
				if (($total_notes_tuned = 1)|| ($total_notes_tuned = 4))
					GetRandomValue \{ name = random_value a = 0 b = 10 }
					if (<random_value> < 5)
						training_play_sound \{ Sound = 'Tutorial_God_Positive_01' }
					else
						training_play_sound \{ Sound = 'Tutorial_God_Positive_02' }
					endif
				endif
			endif
			if ($total_notes_strummed >= 15)
				Change \{ lesson_complete = 1 }
			endif
		endif
	endif
endscript

script training_1_1_tuning_complete_message
	if ScreenElementExists \{ Id = menu_tutorial }
		LaunchEvent \{ Type = unfocus Target = menu_tutorial }
		destroy_menu \{ menu_id = menu_tutorial }
		create_training_pause_handler
	endif
	SoundEvent \{ Event = Tutorial_Mode_Finish_Chord }
	safe_Destroy \{ Id = guitar_sprite }
	training_destroy_fret_finger_sprites
	training_destroy_pressed_notes
	safe_Destroy \{ Id = strum_middle_sprite }
	safe_Destroy \{ Id = strum_up_sprite }
	safe_Destroy \{ Id = strum_down_sprite }
	training_destroy_hit_notes
	safe_Destroy \{ Id = note_tuned_0 }
	safe_Destroy \{ Id = note_tuned_1 }
	safe_Destroy \{ Id = note_tuned_2 }
	safe_Destroy \{ Id = note_tuned_3 }
	safe_Destroy \{ Id = note_tuned_4 }
	training_hide_lesson_header
	training_hide_task_header
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [ center center ]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	wait \{ 2 seconds IgnoreSlomo }
	safe_Destroy \{ Id = tuning_complete_text }
endscript

script training_wait_for_gem_scroller_startup
	begin
		getsongtime
		Printf channel = tutorial "song time is %a " a = <songtime>
		if (<songtime> > 0)
			return
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script training_1_2_start_gem_scroller
	destroy_band
	Change \{ tutorial_disable_hud = 1 }
	training_start_gem_scroller \{ song = Tutorial_1B no_score_update }
	killspawnedscript \{ name = update_score_fast }
	if ScreenElementExists \{ Id = menu_tutorial }
		LaunchEvent \{ Type = unfocus Target = menu_tutorial }
		destroy_menu \{ menu_id = menu_tutorial }
	endif
	event_handlers = [
		{ hit_notesp1 lesson1_hit_note }
		{ missed_notep1 lesson1_missed_note }
		{ song_wonp1 training_song_won }
		{ pad_start show_training_pause_screen }
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_wait_for_gem_scroller_startup
	training_set_lesson_header_text \{ text = "LESSON 2: PLAYING NOTES" }
	training_set_lesson_header_body \{ text = "1. As notes cross the line, play them on your guitar" }
	training_show_lesson_header
	safe_show \{ Id = god_icon }
endscript

script training_1_2_show_lesson
	wait \{ 3.6 seconds IgnoreSlomo }
	training_pause_gem_scroller
	training_play_sound \{ Sound = 'Tutorial_1B_01_God' }
	wait \{ 7.1 seconds IgnoreSlomo }
	if training_are_notes_flipped
		training_add_arrow \{ Id = training_arrow life = 7.0 Pos = (742.0, 370.0) Scale = 0.7 }
	else
		training_add_arrow \{ Id = training_arrow life = 7.0 Pos = (525.0, 370.0) Scale = 0.7 }
	endif
	wait \{ 7.5 seconds IgnoreSlomo }
	if training_are_notes_flipped
		training_add_arrow \{Id = training_arrow2 life = 5 Pos = (886.0, 635.0) Scale = 0.7 rot = 90}
	else
		training_add_arrow \{Id = training_arrow2 life = 5 Pos = (380.0, 635.0) Scale = 0.7 rot = -90}
	endif
	wait \{ 6 seconds IgnoreSlomo }
	training_set_task_header_body \{ text = "Play 8 notes to continue" }
	training_show_task_header
	training_display_notes_hit \{ notes_hit = 0 }
	wait \{ 1 seconds IgnoreSlomo }
	training_play_sound \{ Sound = 'Tutorial_1B_02_God' }
	wait \{ 2 seconds IgnoreSlomo }
	training_resume_gem_scroller
endscript
notes_hit = 0

script lesson1_hit_note
	Change notes_hit = ($notes_hit + 1)
	if (($notes_hit = 1)|| ($notes_hit = 4))
		GetRandomValue \{ name = random_value a = 0 b = 10 }
		if (<random_value> < 5)
			if GotParam \{ use_lou }
				training_play_sound \{ Sound = 'Tutorial_lou_Positive_01' }
			else
				training_play_sound \{ Sound = 'Tutorial_God_Positive_01' }
			endif
		elseif (<random_value> < 10)
			if GotParam \{ use_lou }
				training_play_sound \{ Sound = 'Tutorial_lou_Positive_02' }
			else
				training_play_sound \{ Sound = 'Tutorial_God_Positive_02' }
			endif
		endif
	endif
	training_display_notes_hit \{ notes_hit = $notes_hit }
endscript
notes_missed = 0

script lesson1_missed_note
	Change notes_missed = ($notes_missed + 1)
	if (($notes_missed = 3)|| ($notes_missed = 6))
		if GotParam \{ use_lou }
			training_play_negative \{ who = lou }
		else
			training_play_negative \{ who = god }
		endif
	endif
endscript
long_notes_missed = 0

script lesson4_check_long_note
	if (<finished> = 1)
		Change notes_hit = ($notes_hit + 1)
		if NOT training_is_sound_playing \{ Sound = 'Tutorial_1D_02_God' }
			if (($notes_hit = 1)|| ($notes_hit = 4))
				training_play_positive \{ who = god }
			endif
		endif
	else
		Change long_notes_missed = ($long_notes_missed + 1)
		if ($long_notes_missed = 2)
			training_play_sound \{ Sound = 'Tutorial_1D_02_God' }
		endif
	endif
	if ($notes_hit = 0)
		return
	endif
	training_display_notes_hit \{ notes_hit = $notes_hit }
endscript

script training_1_2_wait_for_hit_notes
	begin
		if ($training_song_over = 1)
			return
		endif
		if ($notes_hit >= 8)
			return
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script training_1_2_show_complete_message
	destroy_menu \{ menu_id = menu_tutorial }
	create_training_pause_handler
	wait \{ 0.75 seconds IgnoreSlomo }
	SoundEvent \{ Event = Tutorial_Mode_Finish_Chord }
	safe_Destroy \{ Id = notes_hit_text }
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [ center center ]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	wait \{ 0.5 seconds IgnoreSlomo }
	training_play_sound \{ Sound = 'Tutorial_1B_03_God' wait }
	safe_Destroy \{ Id = tuning_complete_text }
endscript

script training_1_3_start_gem_scroller
	destroy_band
	Change \{ lesson_complete = 0 }
	Change \{ tutorial_disable_hud = 1 }
	training_start_gem_scroller \{ song = Tutorial_1C disable_hud no_score_update }
	killspawnedscript \{ name = update_score_fast }
	if ScreenElementExists \{ Id = menu_tutorial }
		LaunchEvent \{ Type = unfocus Target = menu_tutorial }
		destroy_menu \{ menu_id = menu_tutorial }
	endif
	event_handlers = [
		{ hit_notesp1 lesson1_hit_note }
		{ missed_notep1 lesson1_missed_note }
		{ song_wonp1 training_song_won }
		{ pad_start show_training_pause_screen }
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_wait_for_gem_scroller_startup
	Change \{ notes_hit = 0 }
	Change \{ notes_missed = 0 }
endscript

script training_1_3_show_lesson
	wait \{ 1 seconds IgnoreSlomo }
	training_pause_gem_scroller
	training_set_lesson_header_text \{ text = "LESSON 3: DIFFERENT NOTES" }
	training_set_lesson_header_body \{ text = "1. Match the note colors to play different notes" }
	training_show_lesson_header
	safe_show \{ Id = god_icon }
	training_play_sound \{ Sound = 'Tutorial_1C_01_God' wait }
	training_set_task_header_body \{ text = "Play some different notes, hit 8 to continue" }
	training_show_task_header
	wait \{ 2 seconds IgnoreSlomo }
	training_resume_gem_scroller
endscript

script training_1_3_wait_for_lesson_complete
	Change \{ lesson_complete = 0 }
	begin
		if ($training_song_over = 1)
			return
		endif
		if ($lesson_complete = 1)
			return
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script training_1_3_show_complete_message
	Printf \{ channel = newdebug "training_1_3_show_complete_message" }
	destroy_menu \{ menu_id = menu_tutorial }
	create_training_pause_handler
	wait \{ 0.75 seconds IgnoreSlomo }
	safe_Destroy \{ Id = notes_hit_text }
	SoundEvent \{ Event = Tutorial_Mode_Finish_Chord }
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [ center center ]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{ Sound = 'Tutorial_1C_02_God' wait }
	safe_Destroy \{ Id = tuning_complete_text }
endscript

script training_1_4_start_gem_scroller
	destroy_band
	Change \{ tutorial_disable_hud = 1 }
	training_start_gem_scroller \{ song = Tutorial_1D disable_hud no_score_update }
	killspawnedscript \{ name = update_score_fast }
	if ScreenElementExists \{ Id = menu_tutorial }
		LaunchEvent \{ Type = unfocus Target = menu_tutorial }
		destroy_menu \{ menu_id = menu_tutorial }
	endif
	event_handlers = [
		{ song_wonp1 training_song_won }
		{ whammy_offp1 lesson4_check_long_note }
		{ pad_start show_training_pause_screen }
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_set_lesson_header_text \{ text = "LESSON 4: LONG NOTES" }
	training_set_lesson_header_body \{ text = "" }
	training_show_lesson_header
	safe_show \{ Id = god_icon }
	Change \{ notes_hit = 0 }
	training_wait_for_gem_scroller_startup
endscript

script training_1_4_show_lesson
	wait \{ 3.55 seconds ignoreslowmo }
	training_pause_gem_scroller
	training_set_lesson_header_body \{ text = "1. Hold fret buttons down\\n2. Strum\\n3. Keep fret down until the whole note has played" }
	training_show_lesson_header
	training_play_sound \{ Sound = 'Tutorial_1D_01_God' }
	wait \{ 0.75 seconds IgnoreSlomo }
	if training_are_notes_flipped
		training_add_arrow \{Id = training_arrow life = 18 Pos = (725.0, 380.0) Scale = 0.7 rot = -45}
	else
		training_add_arrow \{Id = training_arrow life = 18 Pos = (545.0, 380.0) Scale = 0.7 rot = 45}
	endif
	training_wait_for_sound \{ Sound = 'Tutorial_1D_01_God' wait }
	training_set_task_header_body \{ text = "Play 8 long notes to continue" }
	training_show_task_header
	training_display_notes_hit \{ notes_hit = 0 }
	wait \{ 2 seconds IgnoreSlomo }
	training_resume_gem_scroller
	Change \{ long_notes_missed = 0 }
endscript

script training_1_4_show_complete_message
	if ScreenElementExists \{ Id = menu_tutorial }
		destroy_menu \{ menu_id = menu_tutorial }
		create_training_pause_handler
	endif
	wait \{ 0.75 seconds IgnoreSlomo }
	SoundEvent \{ Event = Tutorial_Mode_Finish_Chord }
	safe_Destroy \{ Id = notes_hit_text }
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [ center center ]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	UnPauseGH3Sounds
	UnPauseGame
	training_play_sound \{ Sound = 'Tutorial_1D_03_God' wait }
	safe_hide \{ Id = god_icon }
	safe_Destroy \{ Id = tuning_complete_text }
endscript

script training_1_5_start_gem_scroller
	destroy_band
	Change \{ tutorial_disable_hud = 1 }
	training_start_gem_scroller \{ song = Tutorial_1E disable_hud no_score_update }
	killspawnedscript \{ name = update_score_fast }
	if ScreenElementExists \{ Id = menu_tutorial }
		LaunchEvent \{ Type = unfocus Target = menu_tutorial }
		destroy_menu \{ menu_id = menu_tutorial }
	endif
	event_handlers = [
		{hit_notesp1 lesson1_hit_note Params = { use_lou }}
		{missed_notep1 lesson1_missed_note Params = { use_lou }}
		{ song_wonp1 training_song_won }
		{ pad_start show_training_pause_screen }
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_set_lesson_header_text \{ text = "LESSON 5: CHORDS" }
	training_set_lesson_header_body \{ text = "" }
	training_show_lesson_header
	safe_show \{ Id = lou_icon }
	Change \{ notes_hit = 0 }
	Change \{ notes_missed = 0 }
	training_wait_for_gem_scroller_startup
endscript

script training_1_5_show_lesson
	wait \{ 3.5 seconds IgnoreSlomo }
	training_pause_gem_scroller
	training_set_lesson_header_body \{ text = "Two notes played at the same time" }
	training_show_lesson_header
	training_play_sound \{ Sound = 'Tutorial_1E_01_lou' }
	wait \{ 6.65 seconds IgnoreSlomo }
	if training_are_notes_flipped
		training_add_arrow \{ Id = training_arrow life = 8.4 Pos = (710.0, 375.0) Scale = 0.7 }
	else
		training_add_arrow \{ Id = training_arrow life = 8.4 Pos = (556.0, 375.0) Scale = 0.7 }
	endif
	training_wait_for_sound \{ Sound = 'Tutorial_1E_01_lou' }
	training_set_task_header_body \{ text = "Play 8 chords to continue" }
	training_show_task_header
	training_display_notes_hit \{ notes_hit = 0 }
	wait \{ 2 seconds IgnoreSlomo }
	training_resume_gem_scroller
endscript

script training_1_5_show_complete_message
	if ScreenElementExists \{ Id = menu_tutorial }
		destroy_menu \{ menu_id = menu_tutorial }
		create_training_pause_handler
	endif
	wait \{ 0.75 seconds IgnoreSlomo }
	SoundEvent \{ Event = Tutorial_Mode_Finish_Chord }
	safe_Destroy \{ Id = notes_hit_text }
	training_hide_lesson_header
	training_hide_task_header
	training_destroy_gem_scroller
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [ center center ]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	wait \{ 3 seconds IgnoreSlomo }
	safe_hide \{ Id = lou_icon }
	safe_Destroy \{ Id = tuning_complete_text }
endscript

script training_destroy_gem_scroller \{ Delay = 0.5 }
	PauseGame
	PauseGH3Sounds
	wait <Delay> seconds IgnoreSlomo
	KillCamAnim \{ name = ch_view_cam }
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{Id = cs_view_cam_id name = ch_view_cam viewport = bg_viewport LockTo = World Pos = (-0.06880699843168259, 1.5990009307861328, 5.797596454620361) Quat = (0.000506000011228025, 0.9994299411773682, -0.017537998035550117) FOV = 72.0 Play_hold = 1 interrupt_current}
	UnPauseGH3Sounds
	UnPauseGame
endscript

script training_1_6_show_hud
	training_set_lesson_header_text \{ text = "LESSON 6: USER INTERFACE" }
	training_set_lesson_header_body \{ text = "" }
	training_show_lesson_header
	safe_show \{ Id = god_icon }
	training_play_sound \{ Sound = 'Tutorial_1F_01_god' }
	wait \{ 6.0 seconds IgnoreSlomo }
	player_text = 'p1'
	player_status = player1_status
	Player = 1
	Change \{ StructureName = player1_status current_health = 1.0 }
	SpawnScriptLater update_score_fast Params = { <...>	 }Id = training_spawned_script
	setup_hud <...>
	move_hud_to_default <...> Time = 0.5
	wait \{ 1.5 seconds IgnoreSlomo }
	training_add_arrow \{Id = training_arrow2 life = 6 Pos = (880.0, 590.0) Scale = 0.7 rot = -90}
	wait \{ 8.0 seconds IgnoreSlomo }
	training_set_lesson_header_body \{ text = "Yellow = OK Performance" }
	wait \{ 5.5 seconds IgnoreSlomo }
	killspawnedscript \{ name = training_set_health }
	spawnscriptnow \{training_set_health Params = { health = 1.6 }Id = training_spawned_script}
	training_set_lesson_header_body \{ text = "Yellow = OK Performance\\nGreen = Good Performance" }
	wait \{ 5 seconds IgnoreSlomo }
	killspawnedscript \{ name = training_set_health }
	spawnscriptnow \{training_set_health Params = { health = 0.4 }Id = training_spawned_script}
	training_set_lesson_header_body \{ text = "Yellow = OK Performance\\nGreen = Good Performance\\nRed = Bad Performance" }
	wait \{ 6.5 seconds IgnoreSlomo }
	killspawnedscript \{ name = training_set_health }
	spawnscriptnow \{training_set_health Params = { health = 0.0 }Id = training_spawned_script}
	training_set_lesson_header_body \{ text = "Yellow = OK Performance\\nGreen = Good Performance\\nRed = Bad Performance\\nBlinking Red = Danger!" }
	wait \{ 6.5 seconds IgnoreSlomo }
	killspawnedscript \{ name = training_set_health }
	spawnscriptnow \{training_set_health Params = { health = 1.0 }Id = training_spawned_script}
	training_add_arrow \{ Id = training_arrow2 life = 10 Pos = (285.0, 460.0) Scale = 0.7 }
	training_set_lesson_header_body \{ text = "Yellow = OK Performance\\nGreen = Good Performance\\nRed = Bad Performance\\nBlinking Red = Danger!\\nPlay Notes = Score Points" }
	training_wait_for_sound \{ Sound = 'Tutorial_1F_01_god' }
	safe_hide \{ Id = god_icon }
endscript

script training_set_health
	inc = 0.03
	begin
		current_health = ($player1_status.current_health)
		if (<current_health> < <health>)
			if ((<health> - <current_health>)< <inc>)
				Change StructureName = player1_status current_health = <health>
			else
				Change StructureName = player1_status current_health = (<current_health> + <inc>)
			endif
		else
			if ((<current_health> - <health>)< <inc>)
				Change StructureName = player1_status current_health = <health>
			else
				Change StructureName = player1_status current_health = (<current_health> - <inc>)
			endif
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script training_1_6_hide_hud
	player_text = 'p1'
	player_status = player1_status
	destroy_hud <...>
	killspawnedscript \{ name = update_score_fast }
	training_hide_lesson_header
endscript

script training_1_6_complete
	SoundEvent \{ Event = Tutorial_Mode_Finish_Chord }
	killspawnedscript \{ name = training_set_health }
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = lesson_title_text
		just = [ center center ]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Basic Tutorial Complete!"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{ Sound = 'Tutorial_1_outro' wait }
	safe_hide \{ Id = god_icon }
endscript

script training_basic_tutorial_1_end
	training_kill_session
	killspawnedscript \{ name = training_watch_buttons }
	killspawnedscript \{ name = training_animate_fret_fingers }
	killspawnedscript \{ name = training_animate_strum_fingers }
	safe_Destroy \{ Id = training_container }
	safe_Destroy \{ Id = training_arrow }
	safe_Destroy \{ Id = training_strum_arrow }
	if ScreenElementExists \{ Id = menu_tutorial }
		LaunchEvent \{ Type = unfocus Target = menu_tutorial }
		destroy_menu \{ menu_id = menu_tutorial }
	endif
	training_destroy_narrator_icons
	SetScreenElementProps \{Id = root_window event_handlers = [{ pad_start gh3_start_pressed }] Replace_Handlers}
	SetMenuAutoRepeatTimes \{ (0.30000001192092896, 0.05000000074505806) }
	Change \{ tutorial_disable_hud = 0 }
	SetGlobalTags \{training Params = { basic_lesson = complete }}
	training_check_for_all_tutorials_finished
	ui_flow_manager_respond_to_action \{ action = complete_tutorial }
endscript

script create_pressed_note_sprites
	CreateScreenElement \{PARENT = training_container Type = SpriteElement Id = green_pressed_sprite just = [ center center ] texture = training_guitar_button_down Pos = (441.0, 396.0) rot_angle = 0 rgba = [ 0 165 130 255 ] Scale = (0.36000001430511475, 0.36000001430511475) z_priority = 5}
	CreateScreenElement \{PARENT = training_container Type = SpriteElement Id = red_pressed_sprite just = [ center center ] texture = training_guitar_button_down Pos = (508.0, 396.0) rot_angle = 0 rgba = [ 230 80 90 255 ] Scale = (0.36000001430511475, 0.36000001430511475) z_priority = 5}
	CreateScreenElement \{PARENT = training_container Type = SpriteElement Id = yellow_pressed_sprite just = [ center center ] texture = training_guitar_button_down Pos = (575.0, 396.0) rot_angle = 0 rgba = [ 220 160 25 255 ] Scale = (0.36000001430511475, 0.36000001430511475) z_priority = 5}
	CreateScreenElement \{PARENT = training_container Type = SpriteElement Id = blue_pressed_sprite just = [ center center ] texture = training_guitar_button_down Pos = (642.0, 396.0) rot_angle = 0 rgba = [ 0 135 210 255 ] Scale = (0.36000001430511475, 0.36000001430511475) z_priority = 5}
	CreateScreenElement \{PARENT = training_container Type = SpriteElement Id = orange_pressed_sprite just = [ center center ] texture = training_guitar_button_down Pos = (709.0, 396.0) rot_angle = 0 rgba = [ 215 120 40 255 ] Scale = (0.36000001430511475, 0.36000001430511475) z_priority = 5}
	hide_pressed_notes
endscript

script hide_pressed_notes
	safe_hide \{ Id = green_pressed_sprite }
	safe_hide \{ Id = red_pressed_sprite }
	safe_hide \{ Id = yellow_pressed_sprite }
	safe_hide \{ Id = orange_pressed_sprite }
	safe_hide \{ Id = blue_pressed_sprite }
endscript

script training_destroy_pressed_notes
	safe_Destroy \{ Id = green_pressed_sprite }
	safe_Destroy \{ Id = red_pressed_sprite }
	safe_Destroy \{ Id = yellow_pressed_sprite }
	safe_Destroy \{ Id = orange_pressed_sprite }
	safe_Destroy \{ Id = blue_pressed_sprite }
endscript

script training_destroy_hit_notes
	safe_Destroy \{ Id = hit_green_sprite }
	safe_Destroy \{ Id = hit_yellow_sprite }
	safe_Destroy \{ Id = hit_red_sprite }
	safe_Destroy \{ Id = hit_orange_sprite }
	safe_Destroy \{ Id = hit_blue_sprite }
endscript

script show_pressed_note
	switch (<note>)
		case 0
			safe_show \{ Id = green_pressed_sprite }
		case 1
			safe_show \{ Id = red_pressed_sprite }
		case 2
			safe_show \{ Id = yellow_pressed_sprite }
		case 3
			safe_show \{ Id = blue_pressed_sprite }
		case 4
			safe_show \{ Id = orange_pressed_sprite }
	endswitch
endscript

script training_hit_note
	switch (<note>)
		case 0
			Id = hit_green_sprite
			rgba = [ 0 165 130 255 ]
		case 1
			Id = hit_red_sprite
			rgba = [ 230 80 90 255 ]
		case 2
			Id = hit_yellow_sprite
			rgba = [ 220 160 25 255 ]
		case 3
			Id = hit_blue_sprite
			rgba = [ 0 135 210 255 ]
		case 4
			Id = hit_orange_sprite
			rgba = [ 215 120 40 255 ]
	endswitch
	if ScreenElementExists Id = <Id>
		DestroyScreenElement Id = <Id>
	endif
	Scale = (0.36000001430511475, 0.36000001430511475)
	Pos = ((442.0, 396.0) + (1.0, 0.0) * (<note> * 67))
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = <Id>
		just = [ center center ]
		texture = training_guitar_button_down
		Pos = <Pos>
		rot_angle = 0
		rgba = <rgba>
		Scale = <Scale>
		z_priority = 6
	}
	DoScreenElementMorph Id = <Id> Scale = (<Scale> * 1.85)Alpha = 0 Time = 0.25
endscript

script training_watch_buttons
	create_pressed_note_sprites
	begin
		GetHeldPattern controller = ($player1_status.controller)nobrokenstring
		hide_pressed_notes
		check_button = 65536
		array_count = 0
		begin
			FormatText ChecksumName = new_arrow 'arrow_%a' a = <array_count>
			if ScreenElementExists Id = <new_arrow>
				DestroyScreenElement Id = <new_arrow>
			endif
			if (<hold_pattern> & <check_button>)
				show_pressed_note note = <array_count>
			else
			endif
			<check_button> = (<check_button> / 16)
			array_count = (<array_count> + 1)
		repeat 5
		wait \{ 1 GameFrame }
	repeat
endscript

script training_1_kill_spawned_scripts
endscript
