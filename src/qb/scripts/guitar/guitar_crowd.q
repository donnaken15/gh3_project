current_crowd = 1.0
average_crowd = 1.0
total_crowd = 0.0
max_crowd = 0.0
crowd_scale = 2.0
health_scale = 2.0
crowd_debug_mode = 0
viewercam_nofail = 0

script crowd_reset
	if ($game_mode = tutorial)
		return
	endif
	if GetNodeFlag \{ LS_ENCORE_POST }
		Change \{ current_crowd = 1.6666 }
		Change \{ average_crowd = 1.6666 }
	else
		Change \{ current_crowd = 1.0 }
		Change \{ average_crowd = 1.0 }
	endif
	Change \{ total_crowd = 0.0 }
	Change \{ max_crowd = 0.0 }
	Change \{ last_time_in_lead = 0.0 }
	Change \{ last_time_in_lead_player = -1 }
	if (<Player> = 1)
		StopSoundEvent \{ $CurrentlyPlayingOneShotSoundEvent }
		if ($game_mode = training)
			BG_Crowd_Front_End_Silence \{ immediate = 1 }
		elseif ($end_credits = 1 ||
			GetNodeFlag LS_ENCORE_POST)
			Printf \{ channel = SFX "crowd_reset LS_ENCORE_POST" }
			Change_Crowd_Looping_SFX \{ crowd_looping_state = Good }
		else
			Printf \{ channel = SFX "NOT - crowd_reset LS_ENCORE_POST" }
			Change_Crowd_Looping_SFX \{ crowd_looping_state = neutral }
		endif
	endif
	if GetNodeFlag \{ LS_ENCORE_POST }
		if NOT ($game_mode = p2_battle)
			Change StructureName = <player_status> current_health = 1.6666
		else
			Change StructureName = <player_status> current_health = 1.0
		endif
	else
		Change StructureName = <player_status> current_health = 1.0
	endif
	if ($game_mode = p2_battle & $battle_sudden_death = 1)
		Change StructureName = <player_status> current_health = ($<player_status>.save_health)
	endif
	CrowdReset
endscript

script forcescore
	switch $debug_forcescore
		case poor
			health = ($health_poor_medium / 2)
		case medium
			health = (($health_poor_medium + $health_medium_good)/ 2)
		case Good
			health = (($health_medium_good + $health_scale)/ 2)
		default
			health = ($health_poor_medium / 2)
	endswitch
	Change StructureName = <player_status> current_health = <health>
	Change current_crowd = <health>
endscript
z_wikker_crowd_models = [
	{
		name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = { name = crowd1 }
	}
	{
		name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = { name = crowd2 }
	}
	{
		name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = { name = crowd3 }
	}
	{
		name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = { name = crowd4 }
	}
	{
		name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = { name = crowd5 }
	}
	{
		name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = { name = crowd6 }
	}
]
z_dive_crowd_models = [
	{
		name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = { name = crowd1 }
	}
	{
		name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = { name = crowd2 }
	}
	{
		name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = { name = crowd3 }
	}
	{
		name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = { name = crowd4 }
	}
	{
		name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = { name = crowd5 }
	}
	{
		name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = { name = crowd6 }
	}
]
z_artdeco_crowd_models = [
	{
		name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = { name = crowd1 }
	}
	{
		name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = { name = crowd2 }
	}
	{
		name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = { name = crowd3 }
	}
	{
		name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = { name = crowd4 }
	}
	{
		name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = { name = crowd5 }
	}
	{
		name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = { name = crowd6 }
	}
]
z_prison_crowd_models = [
	{
		name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = { name = crowd1 }
	}
	{
		name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = { name = crowd2 }
	}
	{
		name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = { name = crowd3 }
	}
	{
		name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = { name = crowd4 }
	}
	{
		name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = { name = crowd5 }
	}
	{
		name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = { name = crowd6 }
	}
]
z_party_crowd_models = [
	{
		name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = { name = crowd1 }
	}
	{
		name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = { name = crowd2 }
	}
	{
		name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = { name = crowd3 }
	}
	{
		name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = { name = crowd4 }
	}
	{
		name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = { name = crowd5 }
	}
	{
		name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = { name = crowd6 }
	}
]
z_hell_crowd_models = [
	{
		name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Biker_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = { name = crowd1 }
	}
	{
		name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Biker_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = { name = crowd2 }
	}
	{
		name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Biker_01.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = { name = crowd3 }
	}
	{
		name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Biker_02.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = { name = crowd4 }
	}
	{
		name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_Biker_01.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = { name = crowd5 }
	}
	{
		name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_biker_02.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = { name = crowd6 }
	}
]
z_training_crowd_models = [
	{
		name = crowd1
		Camera = crowd1_cam
		Model = 'Characters\\Musicians\\Sec_Barker.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_training/z_training.tex`
		AssetContext = z_training
		TriggerScript = Z_Training_Crowd_Peds
	}
	{
		name = crowd2
		Camera = crowd2_cam
		Model = 'Characters\\Musicians\\Sec_Punk.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_training/z_training.tex`
		AssetContext = z_training
		TriggerScript = Z_Training_Crowd_Peds
	}
	{
		name = crowd3
		Camera = crowd3_cam
		Model = 'Characters\\Musicians\\Sec_Pro_Stabb.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_training/z_training.tex`
		AssetContext = z_training
		TriggerScript = Z_Training_Crowd_Peds
	}
]
z_Budokan_crowd_models = [
	{
		name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = { name = crowd1 }
	}
	{
		name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = { name = crowd2 }
	}
	{
		name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = { name = crowd3 }
	}
	{
		name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = { name = crowd4 }
	}
	{
		name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = { name = crowd5 }
	}
	{
		name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = { name = crowd6 }
	}
]
z_video_crowd_models = [
	{
		name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = { name = crowd1 }
		roty = -90
	}
	{
		name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = { name = crowd2 }
		roty = -90
	}
	{
		name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = { name = crowd3 }
		roty = -90
	}
	{
		name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = { name = crowd4 }
	}
	{
		name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = { name = crowd5 }
	}
	{
		name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = { name = crowd6 }
	}
	{
		name = crowd7
		Camera = crowd7_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd7_cam_viewport
		texture = viewport7
		textureasset = `tex/zones/Demo/tw_billboard07.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = { name = crowd7 }
		roty = 90
	}
	{
		name = crowd8
		Camera = crowd8_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd8_cam_viewport
		texture = viewport8
		textureasset = `tex/zones/Demo/tw_billboard08.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = { name = crowd8 }
		roty = 90
	}
]

script create_crowd_models
	if IsWinPort
		WinPortGfxGetOptionValue \{ option = 2 }
		if (<value> = 0)
			return
		endif
		crowdOption = <value>
	endif
	if ($disable_crowd = 1)
		return
	endif
	GetPakManCurrentName \{ map = Zones }
	FormatText ChecksumName = crowd_models '%s_crowd_models' s = <pakname>
	if NOT GlobalExists name = <crowd_models>
		return
	endif
	Change crowd_model_array = <crowd_models>
	GetArraySize $<crowd_models>
	if IsWinPort
		if (<crowdOption> = 1)
			<array_Size> = (<array_Size> / 2)
		endif
	endif
	array_count = 0
	begin
		Pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
		viewport = ($<crowd_models> [ <array_count> ].Id)
		Camera = ($<crowd_models> [ <array_count> ].Camera)
		if NOT StructureContains Structure = ($<crowd_models> [ <array_count> ])remap_only
			MemPushContext \{ BottomUpHeap }
			CreateFromStructure {
				Pos = <Pos>
				Quat = (0.0, 1.0, 0.0)
				Class = GameObject
				Type = Ghost
				CreatedAtStart
				($<crowd_models> [ <array_count> ])
				SuspendDistance = 0
				lod_dist1 = 400
				lod_dist2 = 401
				Profile = $Profile_Ped_Crowd_Obj
				LightGroup = Crowd
				object_type = Crowd
				ProfileColor = 49344
				profilebudget = 200
				use_jq
			}
			model_id = ($<crowd_models> [ <array_count> ].name)
			extra_model = 'Real_Crowd\\Crowd_HandL_Lighter.skin'
			<model_id> ::AddGeom lhand_lighter Model = <extra_model> LightGroup = Crowd
			extra_model = 'Real_Crowd\\Crowd_HandL_Rock.skin'
			<model_id> ::AddGeom lhand_rock Model = <extra_model> LightGroup = Crowd
			extra_model = 'Real_Crowd\\Crowd_HandL_Clap.skin'
			<model_id> ::AddGeom lhand_clap Model = <extra_model> LightGroup = Crowd
			extra_model = 'Real_Crowd\\Crowd_HandL_Fist.skin'
			<model_id> ::AddGeom lhand_fist Model = <extra_model> LightGroup = Crowd
			extra_model = 'Real_Crowd\\Crowd_HandR_Lighter.skin'
			<model_id> ::AddGeom rhand_lighter Model = <extra_model> LightGroup = Crowd
			extra_model = 'Real_Crowd\\Crowd_HandR_Rock.skin'
			<model_id> ::AddGeom rhand_rock Model = <extra_model> LightGroup = Crowd
			extra_model = 'Real_Crowd\\Crowd_HandR_Clap.skin'
			<model_id> ::AddGeom rhand_clap Model = <extra_model> LightGroup = Crowd
			extra_model = 'Real_Crowd\\Crowd_HandR_Fist.skin'
			<model_id> ::AddGeom rhand_fist Model = <extra_model> LightGroup = Crowd
			<model_id> ::SwitchOffAtomic lhand_lighter
			<model_id> ::SwitchOffAtomic lhand_rock
			<model_id> ::SwitchOffAtomic lhand_fist
			<model_id> ::SwitchOnAtomic lhand_clap
			<model_id> ::SwitchOffAtomic rhand_lighter
			<model_id> ::SwitchOffAtomic rhand_rock
			<model_id> ::SwitchOffAtomic rhand_fist
			<model_id> ::SwitchOnAtomic rhand_clap
			if StructureContains Structure = ($<crowd_models> [ <array_count> ])roty
				($<crowd_models> [ <array_count> ].name)::Obj_SetOrientation Y = ($<crowd_models> [ <array_count> ].roty)
				apply_correction = 0
			else
				apply_correction = 1
			endif
			MemPopContext \{ BottomUpHeap }
			style = imposter_rendering
			if (<array_Size> <= 6)
				if IsXenon
					style = imposter_rendering_highres
				endif
			endif
			CreateScreenElement {
				PARENT = root_window
				just = [ center center ]
				Type = ViewportElement
				Id = <viewport>
				texture = ($<crowd_models> [ <array_count> ].texture)
				Pos = (2000.0, 200.0)
				dims = (64.0, 64.0)
				Alpha = 1
				style = <style>
			}
			CreateCompositeObjectInstance {
				Priority = $COIM_Priority_Permanent
				Heap = Generic
				Components = [
					{ Component = Camera }
				]
				Params = {
					name = <Camera>
					viewport = <viewport>
					object_type = Crowd
					ProfileColor = 12632064
					profilebudget = 10
					use_jq
					far_clip = 20
				}
			}
			SetActiveCamera viewport = <viewport> Id = <Camera>
			<Camera> ::SetHFOV hFOV = 20.0
			SetViewportProperties viewport = <viewport> no_resolve_depthstencilbuffer = TRUE
			AddCrowdModelCam Camera = <Camera> Pos = <Pos> viewport = <viewport> apply_correction = <apply_correction>
		endif
		SetSearchAllAssetContexts
		CreateViewportTextureOverride {
			Id = <viewport>
			viewportid = <viewport>
			texture = ($<crowd_models> [ <array_count> ].textureasset)
			texdict = ($<crowd_models> [ <array_count> ].texdict)
		}
		SetSearchAllAssetContexts \{ OFF }
		<array_count> = (<array_count> + 1)
	repeat <array_Size>
endscript

script update_crowd_model_cam
	crowd_scaler = 25
	begin
		GetViewportCameraOrient \{ viewport = bg_viewport }
		GetVectorComponents <at>
		Angle = (<X> * <crowd_scaler>)
		RotateVector vector = <at> ry = <Angle>
		at = <result_vector>
		RotateVector vector = <Left> ry = <Angle>
		Left = <result_vector>
		RotateVector vector = <Up> ry = <Angle>
		Up = <result_vector>
		posdir = (<model_pos> + (0.0, 1.0, 0.0) + (<at> * 3.5))
		<Camera> ::Obj_SetPosition Position = <posdir>
		<Camera> ::Obj_SetOrientation Dir = <at> Only handles upright cameras
		SetViewportCameraOrient viewport = <viewport> at = <at> Left = <Left> Up = <Up>
		<Camera> ::UnPause
		wait \{ 1 GameFrame }
	repeat
endscript

script destroy_crowd_models
	ClearCrowdModelCams
	crowd_models = $crowd_model_array
	if (<crowd_models> = None)
		return
	endif
	GetArraySize <crowd_models>
	array_count = 0
	begin
		if NOT StructureContains Structure = (<crowd_models> [ <array_count> ])remap_only
			killspawnedscript \{ name = update_crowd_model_cam }
			if CompositeObjectExists name = (<crowd_models> [ <array_count> ].Camera)
				(<crowd_models> [ <array_count> ].Camera)::DIE
			endif
			if ScreenElementExists Id = (<crowd_models> [ <array_count> ].Id)
				SetSearchAllAssetContexts
				DestroyViewportTextureOverride Id = (<crowd_models> [ <array_count> ].Id)
				SetSearchAllAssetContexts \{ OFF }
				DestroyScreenElement Id = (<crowd_models> [ <array_count> ].Id)
			endif
			if CompositeObjectExists name = (<crowd_models> [ <array_count> ].name)
				(<crowd_models> [ <array_count> ].name)::DIE
			endif
		endif
		<array_count> = (<array_count> + 1)
	repeat <array_Size>
	Change \{ crowd_model_array = None }
endscript

script set_crowd_hand \{ hand = Left Type = clap }
	Obj_GetID
	name = <ObjID>
	if (<hand> = Left)
		switch (<Type>)
			case lighter
				part = lhand_lighter
			case rock
				part = lhand_rock
			case clap
				part = lhand_clap
			case fist
				part = lhand_fist
		endswitch
		<name> ::SwitchOffAtomic lhand_lighter
		<name> ::SwitchOffAtomic lhand_rock
		<name> ::SwitchOffAtomic lhand_clap
		<name> ::SwitchOffAtomic lhand_fist
		<name> ::SwitchOnAtomic <part>
	else
		switch (<Type>)
			case lighter
				part = rhand_lighter
			case rock
				part = rhand_rock
			case clap
				part = rhand_clap
			case fist
				part = rhand_fist
		endswitch
		<name> ::SwitchOffAtomic rhand_lighter
		<name> ::SwitchOffAtomic rhand_rock
		<name> ::SwitchOffAtomic rhand_clap
		<name> ::SwitchOffAtomic rhand_fist
		<name> ::SwitchOnAtomic <part>
	endif
endscript

script Crowd_SetHand \{ name = crowd1 hand = Left Type = clap }
	if CompositeObjectExists <name>
		<name> ::set_crowd_hand hand = <hand> Type = <Type>
	endif
endscript

script Crowd_StartLighters
	killspawnedscript \{ name = crowd_monitor_performance }
	spawnscriptnow \{ crowd_monitor_performance }
endscript

script crowd_monitor_performance
	lighters_on = FALSE
	begin
		get_skill_level
		if (<skill> != Bad)
			if (<lighters_on> = FALSE)
				Crowd_AllSetHand \{ hand = Right Type = lighter }
				Crowd_AllPlayAnim \{ Anim = Special }
				lighters_on = TRUE
				Crowd_ToggleLighters \{ ON }
			endif
		else
			if (<lighters_on> = TRUE)
				Crowd_AllSetHand \{ hand = Right Type = clap }
				Crowd_AllPlayAnim \{ Anim = Idle }
				lighters_on = FALSE
				Crowd_ToggleLighters \{ OFF }
			endif
		endif
		wait \{ 1 GameFrame }
	repeat
endscript

script Crowd_StopLighters
	killspawnedscript \{ name = crowd_monitor_performance }
	Crowd_AllSetHand \{ hand = Right Type = clap }
	Crowd_AllPlayAnim \{ Anim = Idle }
	Crowd_ToggleLighters \{ OFF }
endscript

script Crowd_AllSetHand
	Crowd_SetHand name = crowd1 hand = <hand> Type = <Type>
	Crowd_SetHand name = crowd2 hand = <hand> Type = <Type>
	Crowd_SetHand name = crowd3 hand = <hand> Type = <Type>
	Crowd_SetHand name = crowd4 hand = <hand> Type = <Type>
	Crowd_SetHand name = crowd5 hand = <hand> Type = <Type>
	Crowd_SetHand name = crowd6 hand = <hand> Type = <Type>
	Crowd_SetHand name = crowd7 hand = <hand> Type = <Type>
	Crowd_SetHand name = crowd8 hand = <hand> Type = <Type>
endscript

script Crowd_AllPlayAnim
	wait \{ 1 GameFrame }
	Crowd_PlayAnim name = crowd1 Anim = <Anim>
	wait \{ 1 GameFrame }
	Crowd_PlayAnim name = crowd2 Anim = <Anim>
	wait \{ 1 GameFrame }
	Crowd_PlayAnim name = crowd3 Anim = <Anim>
	wait \{ 1 GameFrame }
	Crowd_PlayAnim name = crowd4 Anim = <Anim>
	wait \{ 1 GameFrame }
	Crowd_PlayAnim name = crowd5 Anim = <Anim>
	wait \{ 1 GameFrame }
	Crowd_PlayAnim name = crowd6 Anim = <Anim>
	wait \{ 1 GameFrame }
	Crowd_PlayAnim name = crowd7 Anim = <Anim>
	wait \{ 1 GameFrame }
	Crowd_PlayAnim name = crowd8 Anim = <Anim>
endscript

script Crowd_PlayAnim \{ name = crowd1 Anim = Idle }
	if NOT CompositeObjectExists <name>
		return
	endif
	if StructureContains Structure = ($Crowd_Profiles)name = <name>
		anim_set = ($Crowd_Profiles.<name>.anim_set)
		<name> ::Obj_KillSpawnedScript name = crowd_play_adjusting_random_anims
		<name> ::Obj_SpawnScriptNow crowd_play_adjusting_random_anims Params = {anim_set = <anim_set> Anim = <Anim>}
	else
		Printf channel = Crowd "animset not found for %a......" a = <name>
	endif
endscript

script crowd_create_lighters
	if IsWinPort
		WinPortGfxGetOptionValue \{ option = 2 }
		if (<value> = 0)
			return
		endif
	endif
	GetPakManCurrent \{ map = Zones }
	if (<pak> = Z_ArtDeco)
		return
	endif
	GetPakManCurrentName \{ map = Zones }
	Index = 0
	begin
		if (<Index> < 10)
			FormatText ChecksumName = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <Index>
		else
			FormatText ChecksumName = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <Index>
		endif
		if CompositeObjectExists name = <crowd_lighter>
			<crowd_lighter> ::Hide
		else
			if IsInNodeArray <crowd_lighter>
				if NOT IsCreated <crowd_lighter>
					Create name = <crowd_lighter>
					if CompositeObjectExists name = <crowd_lighter>
						<crowd_lighter> ::Hide
					else
						Printf "failed to create lighter object %a! ...." a = <crowd_lighter>
					endif
				else
				endif
			else
			endif
		endif
		Index = (<Index> + 1)
		if (<Index> = 15)
			break
		endif
	repeat
endscript

script Crowd_ToggleLighters
	GetPakManCurrentName \{ map = Zones }
	Index = 0
	begin
		if (<Index> < 10)
			FormatText ChecksumName = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <Index>
		else
			FormatText ChecksumName = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <Index>
		endif
		if CompositeObjectExists name = <crowd_lighter>
			if GotParam \{ ON }
				<crowd_lighter> ::Unhide
			elseif GotParam \{ OFF }
				<crowd_lighter> ::Hide
			endif
		endif
		Index = (<Index> + 1)
		if (<Index> = 15)
			break
		endif
	repeat
endscript

script Crowd_StageDiver_Hide \{ Index = 1 }
	GetPakManCurrentName \{ map = Zones }
	FormatText ChecksumName = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <Index>
	if CompositeObjectExists name = <stagediver>
		<stagediver> ::Hide
	endif
endscript

script Crowd_StageDiver_Jump \{ Index = 1 }
	GetPakManCurrentName \{ map = Zones }
	FormatText ChecksumName = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <Index>
	if CompositeObjectExists name = <stagediver>
		<stagediver> ::Unhide
		GetPakManCurrent \{ map = Zones }
		if StructureContains Structure = ($stagediver_anims)name = <pak>
			anims = ($stagediver_anims.<pak>)
		else
			anims = ($stagediver_anims.#"0x1CA1FF20")
		endif
		GetArraySize <anims>
		GetRandomValue name = anim_index Integer a = 0 b = (<array_Size> - 1)
		anim_name = (<anims> [ <anim_index> ])
		Printf channel = Crowd "Playing stagedive anim %a ....." a = <anim_name>
		<stagediver> ::GameObj_PlayAnim Anim = <anim_name>
		<stagediver> ::GameObj_WaitAnimFinished
		<stagediver> ::Hide
	else
		Printf \{ channel = Crowd "Stagediver not found........." }
	endif
endscript
