battle_explanation_color_white = [ 245 220 200 255 ]
battle_explanation_color_yellow = [ 237 169 0 255 ]
battle_explanation_bullet_materials = [
	sys_BattleGEM_Green01_sys_BattleGEM_Green01
	sys_BattleGEM_RED01_sys_BattleGEM_RED01
	sys_BattleGEM_Yellow01_sys_BattleGEM_Yellow01
	sys_BattleGEM_Blue01_sys_BattleGEM_Blue01
	sys_BattleGEM_Orange01_sys_BattleGEM_Orange01
]
battle_explanation_text = {
	bossslash = {
		image = #"0xb523dc4f"
		Title = "SLASH WANTS TO BATTLE!"
		bullets = [
			{ text = "Instead of Star Power, you get BATTLE POWER" }
			{ text = "Hit the BATTLE GEMS to get a POWER-UP" }
			{ text = "Tilt your guitar upward to attack Slash and make him miss" }
			{ text = "You HAVE to make him FAIL before the end or else YOU LOSE" }
			{ text = "Be careful, he can battle back" }
		]
		prompt = "Ready to Rock?"
	}
	bosstom = {
		image = #"0x088ff884"
		Title = "MORELLO CHALLENGES YOU!"
		bullets = [
			{ text = "Instead of Star Power, you get BATTLE POWER" }
			{ text = "Hit the BATTLE GEMS to get a POWER-UP" }
			{ text = "Tilt your guitar upward to attack Tom and make him miss" }
			{ text = "You HAVE to make him FAIL before the end or else YOU LOSE" }
			{ text = "Be careful, he can battle back" }
		]
		prompt = "Ready to Rock?"
	}
	bossdevil = {
		image = #"0xcc33b0ef"
		Title = "ALL RIGHT, THIS IS IT!"
		bullets = [
			{ text = "Instead of Star Power, you get BATTLE POWER" }
			{ text = "Hit the BATTLE GEMS to get a POWER-UP" }
			{ text = "Tilt your guitar upward to attack Lou and make him miss" }
			{ text = "You HAVE to make him FAIL before the end or else YOU LOSE" }
			{ text = "Be careful, he can battle back" }
		]
		prompt = "Ready to Rock?"
	}
	Generic = {
		Title = "BATTLE MODE!"
		bullets = [
			{ text = "Instead of Star Power, you get BATTLE POWER" }
			{ text = "Hit the BATTLE GEMS to get a POWER-UP" }
			{ text = "Tilt your guitar upward to attack the other player and make them miss" }
			{ text = "You HAVE to make your opponent FAIL before the end or else you go to SUDDEN DEATH" }
			{ text = "In SUDDEN DEATH all the power-ups become the devastating DEATH DRAIN" }
		]
		prompt = "Ready to Rock?"
	}
}

script create_battle_helper_menu \{ device_num = 0 popup = 0 }
	if GameIsPaused
		UnPauseGame
	endif
	if GotParam \{ boss }
		if ($game_mode = p2_battle)
			<boss_structure> = ($battle_explanation_text.Generic)
		else
			<boss_structure> = ($battle_explanation_text.<boss>)
		endif
	else
		GetGlobalTags \{ Progression }
		<boss_structure> = ($battle_explanation_text.<boss_song>)
	endif
	menu_z = 10
	CreateScreenElement \{ Type = ContainerElement PARENT = root_window Id = battle_explanation_container }
	CreateScreenElement \{Type = SpriteElement PARENT = battle_explanation_container Id = battle_explanation_screen Pos = (640.0, 360.0) texture = battle_help_bg rgba = [ 223 223 223 255 ] just = [ center center ] dims = (1280.0, 720.0) z_priority = 0}
	CreateScreenElement \{PARENT = battle_explanation_container Type = VMenu Id = bullet_spacer Pos = (545.0, 205.0) just = [ Left top ] internal_just = [ Left top ]}
	GetArraySize \{ $battle_explanation_bullet_materials }
	<num_materials> = <array_Size>
	GetArraySize (<boss_structure>.bullets)
	<num_bullets> = <array_Size>
	<i> = 0
	begin
		CreateScreenElement \{PARENT = bullet_spacer Type = ContainerElement dims = (100.0, 100.0) just = [ Left top ]}
		<container_id> = <Id>
		CreateScreenElement {
			PARENT = <container_id>
			Type = TextBlockElement
			text = (<boss_structure>.bullets [ <i> ].text)
			local_id = text
			dims = (480.0, 0.0)
			Pos = (0.0, 0.0)
			allow_expansion
			rgba = $battle_explanation_color_white
			z_priority = 50
			line_spacing = 0.9
			font = text_A4
			just = [ Left top ]
			internal_just = [ Left top ]
			internal_scale = 0.625
			Shadow
			shadow_rgba = [ 0 0 0 255 ]
			shadow_offs = (3.0, 3.0)
			Alpha = 0
		}
		GetScreenElementDims Id = <Id>
		<container_id> ::SetProps dims = ((1.0, 0.0) * <width> + (0.0, 1.0) * <height> + (0.0, 20.0))
		Mod a = <i> b = <num_materials>
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_id>
			rgba = [ 255 255 255 255 ]
			just = [ Right top ]
			z_priority = 40
			local_id = gem
			Pos = (12.0, 7.0)
			Scale = 0.5
			Material = ($battle_explanation_bullet_materials [ <Mod> ])
			Alpha = 0
			MaterialProps = [
				{
					name = m_startFade
					Property = 1.0
				}
				{
					name = m_endFade
					Property = 1.0
				}
				{
					name = m_playerIndex
					Property = 1.0
				}
			]
		}
		RunScriptOnScreenElement Id = <container_id> battle_fly_in_anim Params = {idx = <i> container_id = <container_id>}
		<i> = (<i> + 1)
	repeat <num_bullets>
	if IsPS3
		Change \{ gHighwayStartFade = 1.0 }
		Change \{ gHighwayEndFade = 1.0 }
	endif
	if IsWinPort
		Change \{ gHighwayStartFade = 1.0 }
		Change \{ gHighwayEndFade = 1.0 }
	endif
	if StructureContains \{ Structure = boss_structure image }
		CreateScreenElement {
			Type = SpriteElement
			Id = who_wants_to_battle_image
			PARENT = battle_explanation_container
			rgba = [ 255 255 255 255 ]
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			texture = (<boss_structure>.image)
			just = [ center center ]
			z_priority = 5
			Alpha = 1
		}
	endif
	<title_offset> = (-10.0, -20.0)
	displaySprite {
		PARENT = battle_explanation_container
		tex = battle_help_flourish
		Pos = ((770.0, 165.0) + <title_offset>)
		dims = (384.0, 96.0)
		just = [ center bottom ]
		z = 50
	}
	<Id> ::DoMorph Alpha = 0.5
	displaySprite {
		PARENT = battle_explanation_container
		tex = battle_help_flourish
		Pos = ((770.0, 145.0) + <title_offset>)
		just = [ center top ]
		dims = (384.0, 96.0)
		z = 50
		flip_h
	}
	<Id> ::DoMorph Alpha = 0.5
	CreateScreenElement {
		Type = TextElement
		PARENT = battle_explanation_container
		Id = who_wants_to_battle_text
		text = (<boss_structure>.Title)
		font = text_a10
		Scale = 1
		Pos = ((770.0, 120.0) + <title_offset>)
		rgba = [ 237 169 0 255 ]
		just = [ center top ]
		z_priority = 51
		font_spacing = 5
		Shadow
		shadow_rgba = [ 0 0 0 255 ]
		shadow_offs = (3.0, 3.0)
		event_handlers = [
			{pad_choose battle_helper_continue Params = { device_num = <device_num> }}
			{ pad_back battle_helper_back }
		]
		exclusive_device = ($primary_controller)
	}
	displayText {
		PARENT = bullet_spacer
		text = (<boss_structure>.prompt)
		font = text_A4
		Scale = 0.7
		Pos = (575.0, 580.0)
		rgba = [ 237 169 0 255 ]
		just = [ Left top ]
		z = 50
	}
	RunScriptOnScreenElement Id = <Id> wait_and_show_ready
	LaunchEvent \{ Type = Focus Target = who_wants_to_battle_text }
	Change \{user_control_pill_text_color = [ 0 0 0 255 ]}
	Change \{user_control_pill_color = [ 180 180 180 255 ]}
	add_user_control_helper \{ text = "BATTLE" button = Green z = 100 }
	add_user_control_helper \{ text = "DECLINE" button = Red z = 100 }
endscript

script battle_helper_continue
	ui_flow_manager_respond_to_action action = continue device_num = <device_num>
endscript

script battle_helper_back
	if ($game_mode = p1_career)
		WriteAchievements \{ achievement = WUSS_OUT }
	endif
	ui_flow_manager_respond_to_action \{ action = go_back }
endscript

script destroy_battle_helper_menu
	clean_up_user_control_helpers
	destroy_menu \{ menu_id = battle_explanation_container }
endscript

script battle_fly_in_anim
	ResolveScreenElementID Id = {<container_id> child = text}
	<text_id> = <resolved_id>
	ResolveScreenElementID Id = {<container_id> child = gem}
	<gem_id> = <resolved_id>
	wait \{ 0.15 seconds }
	wait (<idx> * 0.4)seconds
	<gem_id> ::GetProps
	<gem_final_pos> = <Pos>
	SoundEvent \{ Event = GH3_Star_FlyIn }
	<gem_id> ::DoMorph Pos = (<gem_final_pos> + (-600.0, 0.0))Alpha = 1
	<gem_id> ::DoMorph Pos = <gem_final_pos> Time = 0.35 Motion = ease_in
	<text_id> ::DoMorph Time = 0.2 Motion = ease_in rgba = [ 255 255 255 255 ] Alpha = 1
	<text_id> ::DoMorph Time = 0.1 Motion = ease_out rgba = $battle_explanation_color_white
endscript

script wait_and_show_ready
	DoMorph \{ Alpha = 0 }
	wait \{ 2.8 seconds }
	DoMorph \{Time = 0.2 Motion = ease_in rgba = [ 255 255 255 255 ] Alpha = 1}
	DoMorph \{ Time = 0.1 Motion = ease_in rgba = $battle_explanation_color_yellow }
endscript
