Drums_AutoNoteMapping = [
	{
		MidiNote = 70
		Scr = Countoff_NoteMap
		Params = {}
	}
]
Crowd_AutoNoteMapping = [
	{
		MidiNote = 72
		Scr = GH3_Crowd_Event_Listener
		Params = { event_type = applause override_state = 1 }
	}
	{
		MidiNote = 73
		Scr = GH3_Crowd_Event_Listener
		Params = { event_type = surge_fast override_state = 1 }
	}
	{
		MidiNote = 74
		Scr = GH3_Crowd_Event_Listener
		Params = { event_type = surge_slow override_state = 1 }
	}
	{
		MidiNote = 75
		Scr = GH3_Crowd_Event_Listener
		Params = { event_type = applause }
	}
	{
		MidiNote = 76
		Scr = GH3_Crowd_Event_Listener
		Params = { event_type = surge_fast }
	}
	{
		MidiNote = 77
		Scr = GH3_Crowd_Event_Listener
		Params = { event_type = surge_slow }
	}
	{
		MidiNote = 78
		Scr = GH3_Crowd_Event_Listener
		Params = { event_type = applause override_state = 1 }
	}
	{
		MidiNote = 79
		Scr = GH3_Crowd_Event_Listener
		Params = { event_type = surge_fast override_state = 1 }
	}
	{
		MidiNote = 80
		Scr = GH3_Crowd_Event_Listener
		Params = { event_type = surge_slow override_state = 1 }
	}
]

script NoteMap_Dummy
	Printf \{ "dummy" }
endscript

script Countoff_NoteMap
	spawnscriptnow GH_SFX_Countoff_Logic Params = { <...>  }
endscript

script notemap_startiterator
	FormatText ChecksumName = global_notemapping '%s_AutoNoteMapping' s = <event_string>
	if NOT GlobalExists name = <global_notemapping> Type = array
		return
	endif
	FormatText ChecksumName = event_checksum '%s' s = <event_string>
	SetNoteMappings section = <event_checksum> mapping = $<global_notemapping>
	spawnscriptnow notemap_iterator Params = { <...>  }
endscript

script notemap_deinit
	ClearNoteMappings \{ section = All }
	killspawnedscript \{ name = notemap_iterator }
	killspawnedscript \{ name = notemap_startiterator }
endscript

script notemap_iterator
	Printf "Notemap Iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	FormatText ChecksumName = event_array '%s_%e_notes' s = <song_prefix> e = <event_string> AddToStringLookup
	if NOT GlobalExists name = <event_array> Type = array
		Printf \{ "No Drums Notes for Drums Iterator?" }
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	event_array_size = <array_Size>
	GetSongTimeMS time_offset = <time_offset>
	if NOT (<event_array_size> = 0)
		begin
			if ((<Time> - <skipleadin>)< $<event_array> [ <array_entry> ] [ 0 ])
				break
			endif
			<array_entry> = (<array_entry> + 1)
		repeat <event_array_size>
		event_array_size = (<event_array_size> - <array_entry>)
		if NOT (<event_array_size> = 0)
			begin
				TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> ArrayOfArrays
				begin
					if TimeMarkerReached
						GetSongTimeMS time_offset = <time_offset>
						break
					endif
					wait \{ 1 GameFrame }
				repeat
				TimeMarkerReached_ClearParams
				note = ($<event_array> [ <array_entry> ] [ 1 ])
				if GetNoteMapping section = <event_checksum> note = <note>
					GetArraySize ($<event_array> [ <array_entry> ])
					velocity = 100
					if (<array_Size> > 3)
						velocity = ($<event_array> [ <array_entry> ] [ 3 ])
					endif
					spawnscriptnow (<note_data>.Scr)Params = {(<note_data>.Params)length = ($<event_array> [ <array_entry> ] [ 2 ])velocity = <velocity>}
				endif
				<array_entry> = (<array_entry> + 1)
			repeat <event_array_size>
		endif
	endif
endscript
