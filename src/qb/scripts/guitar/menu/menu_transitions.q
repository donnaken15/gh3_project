transitions_locked = 0

script destroy_menu_transition
	if ScreenElementExists \{ Id = transition_container }
		root_window ::SetProps \{just = [ Left top ]}
		root_window ::SetProps \{ Alpha = 1 Scale = (1.0, 1.0) Pos = (0.0, 0.0) }
		DestroyScreenElement \{ Id = transition_container }
		Change \{ transitions_locked = 0 }
	endif
endscript

script menu_transition_out_right \{ transition_time = 0.125 }
	destroy_menu_transition
	Change \{ transitions_locked = 1 }
	CreateScreenElement \{Id = transition_container Type = ContainerElement PARENT = root_window Pos = (0.0, 0.0) Alpha = 0}
	CreateScreenElement \{Type = SpriteElement PARENT = transition_container texture = White just = [ Left top ] Pos = (0.0, 0.0) rgba = [ 0 0 0 255 ] dims = (1280.0, 720.0) z_priority = 5000}
	if IsWinPort
	else
		root_window ::SetProps \{just = [ Right top ]}
		RunScriptOnScreenElement Id = root_window fade_element Params = {Pos = (1280.0, 0.0) Alpha = 1 Time = <transition_time> Scale = (2.0, 1.0)}
		transition_container ::DoMorph Alpha = 1 Time = <transition_time>
	endif
endscript

script menu_transition_in_right \{ transition_time = 0.125 }
	root_window ::SetProps \{just = [ Left top ]}
	root_window ::SetProps \{ Alpha = 1 Scale = (2.0, 1.0) Pos = (0.0, 0.0) }
	RunScriptOnScreenElement Id = transition_container fade_element Params = {Pos = (0.0, 0.0) Alpha = 0 Time = <transition_time>}
	if IsWinPort
		root_window ::DoMorph Alpha = 1 Scale = 1 Pos = (0.0, 0.0) Time = <transition_time>
	else
		root_window ::DoMorph Alpha = 1 Scale = 1 Time = <transition_time>
	endif
	Change \{ transitions_locked = 0 }
	destroy_menu_transition
endscript

script menu_transition_out_left \{ transition_time = 0.125 }
	destroy_menu_transition
	Change \{ transitions_locked = 1 }
	CreateScreenElement \{Id = transition_container Type = ContainerElement PARENT = root_window Pos = (0.0, 0.0) Alpha = 0}
	CreateScreenElement \{Type = SpriteElement PARENT = transition_container texture = White just = [ Left top ] Pos = (0.0, 0.0) rgba = [ 0 0 0 255 ] dims = (1280.0, 720.0) z_priority = 5000}
	root_window ::SetProps \{just = [ Left top ]}
	if IsWinPort
		RunScriptOnScreenElement Id = root_window fade_element Params = {Pos = (0.0, 0.0) Alpha = 1 Time = <transition_time> Scale = (2.0, 1.0)}
		transition_container ::DoMorph Pos = (0.0, 0.0) Alpha = 1 Time = <transition_time>
	else
		RunScriptOnScreenElement Id = root_window fade_element Params = {Alpha = 1 Time = <transition_time> Scale = (2.0, 1.0)}
		transition_container ::DoMorph Alpha = 1 Time = <transition_time>
	endif
endscript

script menu_transition_in_left \{ transition_time = 0.125 }
	if IsWinPort
	else
		root_window ::SetProps \{just = [ Right top ]}
		root_window ::SetProps \{ Pos = (1280.0, 0.0) Alpha = 1 Scale = (2.0, 1.0) }
		RunScriptOnScreenElement Id = transition_container fade_element Params = {Pos = (0.0, 0.0) Alpha = 0 Time = <transition_time>}
		root_window ::DoMorph Alpha = 1 Scale = 1 Pos = (1280.0, 0.0) Time = <transition_time>
	endif
	destroy_menu_transition
	Change \{ transitions_locked = 0 }
endscript

script fade_element \{ Time = 0 Pos = (0.0, 0.0) Alpha = 0 Scale = 1 }
	DoMorph Id = <Id> Alpha = <Alpha> Time = <Time> Pos = <Pos> Scale = <Scale>
endscript
