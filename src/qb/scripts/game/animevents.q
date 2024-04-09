AnimTagTable = {}
z_artdeco_animevents = {
	Ven_ArtDeco_Dragon_Flame_Fwd = [
		{
			Time = 1.75
			Scr = z_artdeco_animevent_dragon_start
			Params = { movement = forward }
		}
		{
			Time = 3.95
			Scr = z_artdeco_animevent_dragon_stop
			Params = { movement = forward }
		}
	]
	Ven_ArtDeco_Dragon_Flame_R = [
		{
			Time = 1.75
			Scr = z_artdeco_animevent_dragon_start
			Params = { movement = Right }
		}
		{
			Time = 3.95
			Scr = z_artdeco_animevent_dragon_stop
			Params = { movement = Right }
		}
	]
	Ven_ArtDeco_Dragon_Flame_L = [
		{
			Time = 1.75
			Scr = z_artdeco_animevent_dragon_start
			Params = { movement = Left }
		}
		{
			Time = 3.95
			Scr = z_artdeco_animevent_dragon_stop
			Params = { movement = Left }
		}
	]
}
z_budokan_animevents = {}
z_dive_animevents = {}
z_hell_animevents = {
	Ven_Hell_Hammer_Idle_Good = [
		{
			Time = 2.1
			Scr = Z_Hell_Puppet_Hammer_Down
			Params = {}
		}
	]
}
z_party_animevents = {}
z_prison_animevents = {}
z_video_animevents = {}
z_wikker_animevents = {}
ped_animevents = {
	GH3_Guit_Casey_A_Star_Power01 = [
		{
			Time = 0.17
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 1.33
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 2.4
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 3.5
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 4.77
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 5.9
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 6.97
			Scr = StarPower_ShootShotGun
			Params = {}
		}
	]
	GH3_Guit_Judy_B_Star_Power = [
		{
			Time = 0.73
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 2.0
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 3.1
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 4.5
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 5.63
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 6.67
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 7.7
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 8.93
			Scr = StarPower_ShootShotGun
			Params = {}
		}
	]
	GH3_Guit_Judy_C_Star_Power = [
		{
			Time = 0.7
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 1.8
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 3.1
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 4.27
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 5.47
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 6.87
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 8.13
			Scr = StarPower_ShootShotGun
			Params = {}
		}
		{
			Time = 9.33
			Scr = StarPower_ShootShotGun
			Params = {}
		}
	]
	GH3_Guit_John_A_Star_Power01 = [
		{
			Time = 1.2
			Scr = StarPower_FlameThrowerFlames
			Params = { emitDur = 5.83 }
		}
	]
	GH3_Guit_John_B_Star_Power01 = [
		{
			Time = 1.33
			Scr = StarPower_FlameThrowerFlames
			Params = { emitDur = 6.43 }
		}
	]
	GH3_Guit_John_C_Star_Power01 = [
		{
			Time = 2.1
			Scr = StarPower_FlameThrowerFlames
			Params = { emitDur = 6.27 }
		}
	]
	GH3_Guit_Axel_A_Win1 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Axel_Win_4 }
		}
		{
			Time = 4
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Axel_Win_4 }
		}
	]
	GH3_Guit_Axel_A_Win3 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Axel_Win_1 }
		}
		{
			Time = 4
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Axel_Win_1 }
		}
	]
	GH3_Guit_Axel_A_Loss2 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Axel_Lose_1 }
		}
		{
			Time = 1.9
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Axel_Lose_1 }
		}
	]
	GH3_Guit_Axel_A_Loss1 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Axel_Lose_2 }
		}
		{
			Time = 0.35
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Axel_Lose_2 }
		}
	]
	GH3_Guit_Izzy_A_Loss1 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Izzy_Lose_1 }
		}
		{
			Time = 0.5
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Izzy_Lose_1 }
		}
	]
	GH3_Guit_Izzy_A_Loss2 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Izzy_Lose_2 }
		}
		{
			Time = 4.5
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Izzy_Lose_2 }
		}
	]
	GH3_Guit_Midori_A_Win2 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Midori_Win_1 }
		}
		{
			Time = 4.2
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Midori_Win_1 }
		}
	]
	GH3_Guit_Midori_A_Loss3 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Midori_Lose_1 }
		}
		{
			Time = 0.51
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Midori_Lose_1 }
		}
	]
	GH3_Guit_Lars_A_Win2 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Lars_Win_3 }
		}
		{
			Time = 1.8
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Lars_Win_3 }
		}
	]
	GH3_Guit_Lars_A_lose1 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Lars_Lose_1 }
		}
		{
			Time = 0.37
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Lars_Lose_1 }
		}
	]
	GH3_Guit_John_A_Loss1 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Johnny_Lose_1 }
		}
		{
			Time = 5.25
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Johnny_Lose_1 }
		}
	]
	GH3_Guit_Slash_A_BreakGuit = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Slash_Guitar_Smashing }
		}
		{
			Time = 5.0
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Slash_Guitar_Smashing }
		}
	]
	GH3_Guit_Slash_A_Loss1 = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Izzy_Lose_1 }
		}
		{
			Time = 1.6
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Izzy_Lose_1 }
		}
	]
	GH3_Guitarist_Judy_A_loss_armsUp = [
		{
			Time = 0.0
			Scr = PreloadWinAnimStream
			Params = { Stream = Midori_Lose_1 }
		}
		{
			Time = 4.0
			Scr = PlayPreLoadedWinAnimStream
			Params = { Stream = Midori_Lose_1 }
		}
	]
	GH3_crowd_Becki_bad1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_bad2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_bad3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_good_fast1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_good_fast2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Becki_good_fast3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Becki_good_med1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_good_med2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Becki_good_med3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Becki_good_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_good_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Becki_good_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Becki_reg_fast1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_reg_fast2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_reg_fast3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	#"0x7f93b744" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Becki_reg_med1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_reg_med2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_reg_med3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	#"0x5aed15a3" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Becki_regular_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Becki_regular_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Becki_regular_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0xd19e2e36" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Bill_good_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Bill_good_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Bill_good_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	#"0x408741a9" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	#"0xd98e1013" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	#"0xae892085" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_bad1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_bad2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_bad3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0x7afc91f0" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_good_fast1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Colin_good_fast2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Colin_good_fast3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Colin_good_med1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Colin_good_med2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Colin_good_med3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
		{
			Time = 3.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 3.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
		{
			Time = 5.67
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 5.67
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_good_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_Colin_good_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Colin_good_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_Reg_fast1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_Reg_fast2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
		{
			Time = 2.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
		{
			Time = 7.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_Reg_fast3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_Reg_med1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_Reg_med2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_Colin_Reg_med3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	#"0x3599af3a" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Colin_Reg_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Colin_Reg_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_Reg_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	#"0x925421e6" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_colin_special_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_colin_special_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_Colin_special_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_colin_special_slow4 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0xc9419712" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0x5048c6a8" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0x274ff63e" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0xb92b639d" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0xce2c530b" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Colin_StarPower6 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_bad1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_bad2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_bad3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_bad4 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_good_fast1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Genna_good_fast2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_good_fast3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_Genna_good_med1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Genna_good_med2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_Genna_good_med3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_Genna_good_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Genna_good_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Genna_good_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Genna_regular_fast1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_regular_fast2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_regular_fast3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0x2c01d8f7" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_regular_med1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_regular_med2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_regular_med3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	#"0x7b119651" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_Genna_regular_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_regular_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Genna_regular_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0x487a110f" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Jerod_bad1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_bad2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_bad3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_bad4 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_good_fast1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Jerod_good_fast2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_good_fast3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Jerod_good_med1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Jerod_good_med2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
		{
			Time = 0.5
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.5
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
		{
			Time = 1.1
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 1.1
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
		{
			Time = 1.6
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 1.6
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
		{
			Time = 2.3
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 2.3
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
		{
			Time = 2.67
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 2.67
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
		{
			Time = 3.1
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 3.1
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Jerod_good_med3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_good_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Jerod_good_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Jerod_good_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Jerod_reg_fast1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_reg_fast2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_reg_fast3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	#"0x111972e4" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_Jerod_reg_med1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_reg_med2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_reg_med3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	#"0xbb2e5234" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Jerod_regular_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Jerod_regular_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Jerod_regular_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0x60f75f06" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	#"0x561a0252" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	#"0xcf1353e8" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0xb814637e" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	#"0x2670f6dd" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_bad1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_bad2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_bad3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_bad4 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_good_fast1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Rick_good_fast2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Rick_good_fast3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Rick_good_med1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Rick_good_med2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Rick_good_med3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = fist }
		}
	]
	GH3_crowd_Rick_good_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_good_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Rick_good_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_regular_fast1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_regular_fast2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_regular_fast3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0x4bd93069" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_regular_med1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_regular_med2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_regular_med3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	#"0x7eb3c4ca" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = fist }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Rick_regular_slow1 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = rock }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
	GH3_crowd_Rick_regular_slow2 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	GH3_crowd_Rick_regular_slow3 = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = clap }
		}
	]
	#"0x2fa2f991" = [
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Left Type = clap }
		}
		{
			Time = 0.0
			Scr = set_crowd_hand
			Params = { hand = Right Type = rock }
		}
	]
}
PreloadWinAnimStream_GuitaristID = -1
PreloadWinAnimStream_BassistID = -1

script PreloadWinAnimStream
	Obj_GetID
	if (<ObjID> = GUITARIST)
		if PreloadStream <Stream> buss = BinkCutScenes
			Change PreloadWinAnimStream_GuitaristID = <unique_id>
		endif
	elseif (<ObjID> = BASSIST)
		if PreloadStream <Stream> buss = BinkCutScenes
			Change PreloadWinAnimStream_BassistID = <unique_id>
		endif
	endif
endscript

script PlayPreLoadedWinAnimStream
	Obj_GetID
	if (<ObjID> = GUITARIST)
		StartPreLoadedStream ($PreloadWinAnimStream_GuitaristID)vol = 63 forcesafepreload = 1 buss = BinkCutScenes
	elseif (<ObjID> = BASSIST)
		StartPreLoadedStream ($PreloadWinAnimStream_BassistID)vol = 63 forcesafepreload = 1 buss = BinkCutScenes
	endif
endscript
