
script flashsounds
	EnableRemoveSoundEntry \{ Enable }
	stars
	Printf \{ "Flashing global_sfx pak" }
	UnLoadPak \{ 'zones/global/global_sfx.pak' Heap = heap_audio localized }
	WaitUnloadPak \{ 'zones/global/global_sfx.pak' }
	LoadPak \{ 'zones/global/global_sfx.pak' no_vram Heap = heap_audio localized }
	stars
	Printf \{ "Sfx Pak flashing done." }
endscript
SfxPreviewEventTree_FAM = {
	Type = FAM
	[
		{ Type = Source Anim = sk9_skater_Default }
	]
}

script SfxCreateTestFAMObject
	if CompositeObjectExists \{ SfxPreviewEventObject }
		SfxPreviewEventObject ::DIE
	endif
	Skater ::Obj_GetPosition
	Skater ::Obj_GetQuat
	CreateCompositeObject Priority = COIM_Priority_Permanent Heap = Generic {
		Components = [{ Component = SetDisplayMatrix }{ Component = AnimTree }
			{ Component = Skeleton }{ Component = Model }
			{ Component = Agent }{ Component = FAM }{ Component = Stream }]
		Params = {name = SfxPreviewEventObject Pos = <Pos> Orientation = <Quat> CloneFrom = Skater
			SkeletonName = sk9_skater species = human voice_profile = TeenMaleSkater1 sex = male
			notice_radius = 6.0 agent_stats = stats_player faction = $faction_test}
	}
	SfxPreviewEventObject ::Anim_InitTree \{Tree = SfxPreviewEventTree_FAM NodeIdDeclaration = [ FAM ]}
endscript

script SfxCreateTestObject
	if CompositeObjectExists \{ SfxPreviewEventObject }
		SfxPreviewEventObject ::DIE
	endif
	GetCurrentCameraObject
	<camid> ::Obj_GetPosition
	<camid> ::Obj_GetQuat
	Pos = (<Pos> + (10 * <Quat>))
	CreateCompositeObject Priority = COIM_Priority_Permanent Heap = Generic {
		Components = [{ Component = Sound }]
		Params = {name = SfxPreviewEventObject Pos = <Pos> Orientation = <Quat>}
	}
endscript

script SfxDestroyTestObject
	if CompositeObjectExists \{ SfxPreviewEventObject }
		SfxPreviewEventObject ::DIE
	endif
endscript

script PreviewSoundEvent
	ExtendCRC <Event> '_container' out = container_name
	if StructureContains Structure = $<container_name> Command
		Printf "Previewing SoundEvent %s" s = <Event>
		if checksumequals a = ($<container_name>.Command)b = PlaySound
			Printf \{ "Playsound!" }
			SoundEvent Event = <Event>
		elseif checksumequals a = ($<container_name>.Command)b = Obj_PlaySound
			Printf \{ "Obj_Playsound!" }
			SfxCreateTestObject
			SoundEvent Event = <Event> object = SfxPreviewEventObject
		elseif checksumequals a = ($<container_name>.Command)b = Agent_PlayVO
			Printf \{ "Agent_PlayVO!" }
			<stream_priority> = 1
			<logic_priority> = 50
			<animate_mouth> = TRUE
			<buss_id> = Default
			<no_pitch_mod> = FALSE
			<use_pos_info> = TRUE
			<can_use_stream> = TRUE
			<dropoff> = 50
			<dropoff_function> = standard
			SfxCreateTestFAMObject
			SoundEvent Event = <Event> object = SfxPreviewEventObject <...>
		else
			Printf \{ "Sound Event Command is invalid" }
		endif
		waitTime = 0
		begin
			if NOT (IsSoundEventPlaying <Event>)
				break
			endif
			if (<waitTime> > 200)
				StopSoundEvent <Event>
				break
			endif
			wait \{ 0.1 seconds }
			waitTime = (<waitTime> + 1)
		repeat
		SfxDestroyTestObject
	else
		Printf "sound event does not exist: %s" s = <container_name>
	endif
endscript
