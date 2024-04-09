cash_deduction_types = [
	{ desc = "CARS, SET FIRE TO" val = 2500 }
	{ desc = "WALL ART, STOLEN" val = 80 }
	{ desc = "GREEN ROOM, TRASHED" val = 210 }
	{ desc = "NOISE VIOLATIONS, PAID" val = 550 }
	{ desc = "HOTEL ROOM, TRASHED" val = 330 }
	{ desc = "DRINKS, CONSUMED" val = 300 }
]
review_string_3star = "Mediocre 3-star review. Here's your cut."
review_string_4star = "Good 4-star review. Here's your cut."
review_string_5star = "Killer 5-star review. Here's your cut."
base_deduction_index_array = [
	0
	1
	2
	3
	4
	5
]

script create_cash_reward_menu
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
	CreateScreenElement {
		Type = ContainerElement
		PARENT = root_window
		Id = cash_reward_container
		Pos = (-90.0, 0.0)
		rot_angle = 6
		exclusive_device = <exclusive_device>
	}
	stars = ($player1_status.stars)
	song_cash = ($player1_status.new_cash)
	Change \{ StructureName = player1_status new_cash = 0 }
	venue_name = (($LevelZones.($current_level)).Title)
	GetUpperCaseString <venue_name>
	CreateScreenElement \{Type = SpriteElement PARENT = cash_reward_container texture = Newspaper_BG_2P Pos = (640.0, 360.0) just = [ center center ] dims = (1280.0, 720.0) z_priority = -100}
	create_menu_backdrop \{ texture = Cash_reward_bg }
	CreateScreenElement {
		Type = TextElement
		PARENT = cash_reward_container
		Scale = (1.100000023841858, 0.8999999761581421)
		Pos = (660.0, 0.0)
		text = <UpperCaseString>
		font = ($cash_reward_font)
		rgba = [ 0 0 0 255 ]
		just = [ center top ]
		z_priority = 3
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = cash_reward_container
		Scale = (1.7999999523162842, 1.2999999523162842)
		Pos = (660.0, 40.0)
		text = "GIG MONEY"
		font = ($cash_reward_font)
		rgba = [ 150 60 35 255 ]
		just = [ center top ]
		z_priority = 3
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 600)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> dims = ((600.0, 0.0) + <height> * (0.0, 1.0))
	endif
	FormatText ChecksumName = review_text 'review_string_%vstar' v = <stars>
	CreateScreenElement {
		Type = TextElement
		PARENT = cash_reward_container
		Scale = 0.7
		Pos = (355.0, 110.0)
		text = (<review_text>)
		font = ($cash_reward_font)
		rgba = [ 0 0 0 255 ]
		just = [ Left top ]
		z_priority = 3
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> dims = ((530.0, 0.0) + <height> * (0.0, 1.0))only_if_larger_x = 1 start_x_scale = 0.7 start_y_scale = 0.7
	CreateScreenElement {
		Type = TextElement
		PARENT = cash_reward_container
		Scale = 0.7
		Pos = (355.0, 140.0)
		text = "Go buy yourself somethin' pretty."
		font = ($cash_reward_font)
		rgba = [ 0 0 0 255 ]
		just = [ Left top ]
		z_priority = 3
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> dims = ((530.0, 0.0) + <height> * (0.0, 1.0))only_if_larger_x = 1 start_x_scale = 0.7 start_y_scale = 0.7
	create_deductions_list Pos = (340.0, 195.0) dims = (550.0, 500.0) Scale = (0.8999999761581421, 0.699999988079071) received = <song_cash>
	create_you_get_text Pos = (890.0, 400.0) Scale = (2.0, 1.5) value = <song_cash>
	CreateScreenElement {
		Type = TextElement
		PARENT = cash_reward_container
		Scale = 0.8
		Pos = (880.0, 460.0)
		text = "Spend your hard-earned"
		font = ($cash_reward_font)
		rgba = [ 0 0 0 255 ]
		just = [ Right top ]
		z_priority = 3
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 510)
		fit_text_in_rectangle Id = <Id> dims = ((510.0, 0.0) + ((0.0, 1.0) * <height>))start_x_scale = 0.8 start_y_scale = 0.8
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = cash_reward_container
		Scale = 0.8
		Pos = (880.0, 495.0)
		text = "cash at the store."
		font = ($cash_reward_font)
		rgba = [ 0 0 0 255 ]
		just = [ Right top ]
		z_priority = 3
	}
	button_font = buttonsxenon
	CreateScreenElement {
		Type = TextElement
		PARENT = cash_reward_container
		Scale = 0.6
		Pos = (410.0, 560.0)
		text = "\\m0"
		font = <button_font>
		rgba = [ 255 255 255 255 ]
		just = [ Left top ]
		z_priority = 3
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = cash_reward_container
		Id = continue_button
		Scale = 0.7
		Pos = (435.0, 572.0)
		text = "CONTINUE"
		font = ($cash_reward_font)
		rgba = [ 0 0 0 255 ]
		z_priority = 3
		just = [ Left center ]
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = { action = continue }}
		]
	}
	displaySprite \{PARENT = cash_reward_container tex = Sponsored_Pill Pos = (390.0, 580.0) rgba = [ 0 0 0 255 ] just = [ Left center ]}
	GetScreenElementDims \{ Id = continue_button }
	SetScreenElementProps Id = <Id> dims = (<width> * (1.0, 0.0) + (64.0, 96.0))
	LaunchEvent \{ Type = Focus Target = continue_button }
endscript

script destroy_cash_reward_menu
	destroy_menu \{ menu_id = cash_reward_container }
	destroy_menu_backdrop
endscript
cash_reward_font = text_A4

script create_deductions_list \{ Pos = (200.0, 200.0) Scale = 1 dims = (400.0, 400.0) received = 1200 }
	dl_width = ((1.0, 0.0).<dims>)
	dl_height = ((0.0, 1.0).<dims>)
	CreateScreenElement {
		Type = ContainerElement
		PARENT = cash_reward_container
		Id = deductions_container
		Pos = <Pos>
	}
	pay = <received>
	deduction_count = 4
	PermuteArray array = ($base_deduction_index_array)NewArrayName = perm_deduction_array
	Index = 0
	begin
		perm_index = (<perm_deduction_array> [ <Index> ])
		<pay> = (<pay> + $cash_deduction_types [ <perm_index> ].val)
		<Index> = (<Index> + 1)
	repeat <deduction_count>
	FormatText textname = gross_pay_text "$%d" d = <pay>
	CreateScreenElement {
		Type = TextElement
		PARENT = deductions_container
		Pos = ((1.0, 0.0) * <dl_width>)
		Scale = <Scale>
		text = <gross_pay_text>
		font = ($cash_reward_font)
		rgba = [ 15 70 0 255 ]
		just = [ Right top ]
		z_priority = 3
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = deductions_container
		Id = cd_pay_text
		Pos = (15.0, 0.0)
		Scale = <Scale>
		text = "PAY"
		font = ($cash_reward_font)
		rgba = [ 15 70 0 255 ]
		just = [ Left top ]
		z_priority = 3
	}
	GetScreenElementDims \{ Id = cd_pay_text }
	separation_height = (<height> * 0.9)
	CreateScreenElement {
		Type = TextElement
		PARENT = deductions_container
		Pos = (((0.0, 1.0) * <separation_height>)+ (15.0, 0.0))
		Scale = (<Scale> * 0.95)
		text = "MINUS DEDUCTIONS"
		font_spacing = 4
		font = ($cash_reward_font)
		rgba = [ 150 60 35 255 ]
		just = [ Left top ]
		z_priority = 3
	}
	Index = 0
	begin
		perm_index = (<perm_deduction_array> [ <Index> ])
		deduction_string = ($cash_deduction_types [ <perm_index> ].desc)
		FormatText textname = deduction_value "-$%v" v = ($cash_deduction_types [ <perm_index> ].val)
		CreateScreenElement {
			Type = TextElement
			PARENT = deductions_container
			Pos = (((0.0, 1.0) * (<separation_height> * (<Index> + 2)))+ (15.0, 0.0))
			Scale = (<Scale> * 0.95)
			text = <deduction_string>
			font = ($cash_reward_font)
			rgba = [ 0 0 0 255 ]
			just = [ Left top ]
			z_priority = 3
		}
		GetScreenElementDims Id = <Id>
		if (<width> > 400)
			SetScreenElementProps Id = <Id> Scale = 1
			fit_text_in_rectangle Id = <Id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0))
		endif
		CreateScreenElement {
			Type = TextElement
			PARENT = deductions_container
			Pos = ((1.0, 0.0) * <dl_width> + (0.0, 1.0) * (<separation_height> * (<Index> + 2)))
			Scale = (<Scale> * 0.95)
			text = <deduction_value>
			font = ($cash_reward_font)
			rgba = [ 150 60 35 255 ]
			just = [ Right top ]
			z_priority = 3
		}
		<Index> = (<Index> + 1)
	repeat <deduction_count>
endscript

script create_you_get_text \{ value = 1200 Scale = 1 Pos = (630.0, 320.0) }
	FormatText textname = payment_text "$%v" v = <value>
	CreateScreenElement {
		Type = TextElement
		PARENT = cash_reward_container
		Id = payment_text_id
		Scale = <Scale>
		text = <payment_text>
		font = ($cash_reward_font)
		Pos = (<Pos> - (0.0, 15.0))
		rgba = [ 15 70 0 255 ]
		just = [ Right top ]
		z_priority = 3
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = cash_reward_container
		Id = you_get_id
		Scale = (<Scale> * 0.65)
		text = "You Get:"
		font = ($cash_reward_font)
		rgba = [ 0 0 0 255 ]
		just = [ Right top ]
		z_priority = 3
	}
	SoundEvent \{ Event = Cash_Sound }
	GetScreenElementDims \{ Id = payment_text_id }
	you_get_pos = (<Pos> - (1.0, 0.0) * (<width> * 1.1))
	SetScreenElementProps Id = you_get_id Pos = <you_get_pos>
endscript
