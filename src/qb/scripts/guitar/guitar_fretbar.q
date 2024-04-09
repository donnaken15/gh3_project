thin_fretbar_timesigs = {
	t2d4 = $thin_fretbar_8note_params
	t3d4 = $thin_fretbar_8note_params
	t4d4 = $thin_fretbar_8note_params
	t5d4 = $thin_fretbar_8note_params
	t6d4 = $thin_fretbar_8note_params
	t3d8 = $thin_fretbar_16note_params
	t6d8 = $thin_fretbar_16note_params
	t12d8 = $thin_fretbar_16note_params
}
thin_fretbar_8note_params = { low_bpm = 1 high_bpm = 180 }
thin_fretbar_16note_params = { low_bpm = 1 high_bpm = 120 }
fretbar_prefix_type = { thin = 'thin' medium = 'medium' thick = 'thick' }

script create_fretbar \{ Scale = (40.0, 0.25) }
	Create2DFretbar <...>
endscript

script fretbar_iterator
	fretbar_iterator_CFunc_Setup
	begin
		if fretbar_iterator_CFunc
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	fretbar_iterator_CFunc_Cleanup
endscript

script kill_fretbar2d
	if ScreenElementExists Id = <fretbar_id>
		DestroyGem name = <fretbar_id>
	endif
endscript

script fretbar_events
	SetEventHandler response = switch_script Event = kill_objects Scr = kill_fretbar2d Params = { <...>	 }Group = gem_group
endscript

script fretbar_update_tempo
	fretbar_update_tempo_CFunc_Setup
	begin
		if fretbar_update_tempo_CFunc
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	fretbar_update_tempo_CFunc_Cleanup
endscript

script fretbar_update_hammer_on_tolerance
	fretbar_update_hammer_on_tolerance_CFunc_Setup
	begin
		if fretbar_update_hammer_on_tolerance_CFunc
			break
		endif
		wait \{ 1 GameFrame }
	repeat
	fretbar_update_hammer_on_tolerance_CFunc_Cleanup
endscript

script create_debug_measure_text
	if NOT (<fretbar_scale> = thick)
		return
	endif
	if NOT ScreenElementExists \{ Id = hud_destroygroup_windowp1 }
		return
	endif
	if NOT ScreenElementExists \{ Id = debug_measure_window }
		CreateScreenElement \{Type = ContainerElement PARENT = hud_destroygroup_windowp1 Id = debug_measure_window Pos = (0.0, 0.0) just = [ Left top ]}
	endif
	FormatText textname = measure_text "%i" i = <measure>
	FormatText ChecksumName = measure_checksum 'measuretext_%i' i = <measure>
	CreateScreenElement {
		Type = TextElement
		PARENT = debug_measure_window
		Id = <measure_checksum>
		font = text_a1
		Pos = (2000.0, 32.0)
		just = [ center top ]
		Scale = 1.0
		rgba = [ 210 210 210 250 ]
		text = <measure_text>
		z_priority = 1.0
	}
	spawnscriptnow move_debug_measure_text Params = { <...>	 }Id = debug_measure_text
endscript

script move_debug_measure_text
	begin
		if CompositeObjectExists <fretbar_id>
			<fretbar_id> ::Obj_GetPosition
			Pos = (<Pos> + (2.0, 0.0, 0.0))
			GetViewport2DPosFrom3D viewport = 1 Pos = <Pos>
			Pos = (<posx> * (1.0, 0.0) + <posy> * (0.0, 1.0))
			<measure_checksum> ::DoMorph Pos = <Pos>
			wait \{ 1 GameFrame }
		else
			DestroyScreenElement Id = <measure_checksum>
			break
		endif
	repeat
endscript

script destroy_debug_measure_text
	if ScreenElementExists \{ Id = debug_measure_window }
		DestroyScreenElement \{ Id = debug_measure_window }
	endif
	killspawnedscript \{ Id = debug_measure_text }
endscript
