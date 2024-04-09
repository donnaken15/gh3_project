Crowd_BlendTime_TempoChange = 0.67
Crowd_BlendTime_Bad = 0.5
Crowd_BlendTime_Special = 0.4
Crowd_BlendTime_Slow = 0.6
Crowd_BlendTime_Med = 0.4
Crowd_BlendTime_Fast = 0.2
Crowd_Profiles = {
	crowd1 = { anim_set = crowd_animations_colin }
	crowd2 = { anim_set = crowd_animations_jerod }
	crowd3 = { anim_set = crowd_animations_rick }
	crowd4 = { anim_set = crowd_animations_bill }
	crowd5 = { anim_set = crowd_animations_becki }
	crowd6 = { anim_set = crowd_animations_genna }
	crowd7 = { anim_set = crowd_animations_colin }
	crowd8 = { anim_set = crowd_animations_jerod }
}
crowd_animations_jerod = {
	Idle = {
		Good = {
			FAST = [ GH3_crowd_Jerod_good_fast1 GH3_crowd_Rick_good_fast3 ]
			Med = [ GH3_crowd_Jerod_good_med1 GH3_crowd_Genna_good_med3 ]
			Slow = [ GH3_crowd_Jerod_good_slow1 GH3_crowd_Jerod_good_slow2 ]
		}
		Normal = {
			FAST = [ #"0x111972e4" GH3_crowd_Jerod_reg_fast2 GH3_crowd_Jerod_reg_fast3 ]
			Med = [ #"0xbb2e5234" GH3_crowd_Jerod_reg_med2 GH3_crowd_Jerod_reg_med3 ]
			Slow = [ GH3_crowd_Jerod_regular_slow1 GH3_crowd_Jerod_regular_slow2 GH3_crowd_Jerod_regular_slow3 ]
		}
		Bad = {
			FAST = [ GH3_Jerod_bad1 GH3_Jerod_bad2 GH3_Jerod_bad3 ]
			Med = [ GH3_Jerod_bad1 GH3_Jerod_bad2 GH3_Jerod_bad3 ]
			Slow = [ GH3_Jerod_bad1 GH3_Jerod_bad2 GH3_Jerod_bad3 ]
		}
	}
	Special = {
		Good = {
			FAST = [ GH3_crowd_colin_special_slow1 ]
			Med = [ #"0x561a0252" ]
			Slow = [ GH3_crowd_colin_special_slow1 ]
		}
		Normal = {
			FAST = [ #"0x561a0252" ]
			Med = [ GH3_crowd_colin_special_slow1 ]
			Slow = [ #"0x561a0252" ]
		}
		Bad = {
			FAST = [ GH3_Jerod_bad1 GH3_Jerod_bad2 GH3_Jerod_bad3 ]
			Med = [ GH3_Jerod_bad1 GH3_Jerod_bad2 GH3_Jerod_bad3 ]
			Slow = [ GH3_Jerod_bad1 GH3_Jerod_bad2 GH3_Jerod_bad3 ]
		}
	}
	Starpower = {
		Good = {
			FAST = [ GH3_crowd_Jerod_good_fast2 ]
			Med = [ GH3_crowd_Jerod_good_fast2 ]
			Slow = [ GH3_crowd_Jerod_good_fast2 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Jerod_good_fast2 ]
			Med = [ GH3_crowd_Jerod_good_fast2 ]
			Slow = [ GH3_crowd_Jerod_good_fast2 ]
		}
		Bad = {
			FAST = [ GH3_Jerod_bad1 GH3_Jerod_bad2 GH3_Jerod_bad3 ]
			Med = [ GH3_Jerod_bad1 GH3_Jerod_bad2 GH3_Jerod_bad3 ]
			Slow = [ GH3_Jerod_bad1 GH3_Jerod_bad2 GH3_Jerod_bad3 ]
		}
	}
}
crowd_animations_rick = {
	Idle = {
		Good = {
			FAST = [ GH3_crowd_Rick_good_fast1 GH3_crowd_Rick_good_fast2 GH3_crowd_Rick_good_fast3 ]
			Med = [ GH3_crowd_Rick_good_med1 GH3_crowd_Rick_good_med2 ]
			Slow = [ GH3_crowd_Rick_good_slow1 GH3_crowd_Rick_good_slow2 GH3_crowd_Rick_good_slow3 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Rick_regular_fast1 GH3_crowd_Rick_regular_fast2 GH3_crowd_Rick_regular_fast3 ]
			Med = [ #"0x7eb3c4ca" GH3_crowd_Rick_regular_med2 GH3_crowd_Rick_regular_med3 ]
			Slow = [ GH3_crowd_Rick_regular_slow1 GH3_crowd_Rick_regular_slow2 #"0x2fa2f991" ]
		}
		Bad = {
			FAST = [ GH3_Rick_bad1 GH3_Rick_bad2 GH3_Rick_bad3 ]
			Med = [ GH3_Rick_bad1 GH3_Rick_bad2 GH3_Rick_bad3 ]
			Slow = [ GH3_Rick_bad1 GH3_Rick_bad2 GH3_Rick_bad3 ]
		}
	}
	Special = {
		Good = {
			FAST = [ #"0xcf1353e8" ]
			Med = [ GH3_crowd_colin_special_slow2 ]
			Slow = [ #"0xcf1353e8" ]
		}
		Normal = {
			FAST = [ GH3_crowd_colin_special_slow2 ]
			Med = [ #"0xcf1353e8" ]
			Slow = [ GH3_crowd_colin_special_slow2 ]
		}
		Bad = {
			FAST = [ GH3_Rick_bad1 GH3_Rick_bad2 GH3_Rick_bad3 ]
			Med = [ GH3_Rick_bad2 GH3_Rick_bad2 GH3_Rick_bad3 ]
			Slow = [ GH3_Rick_bad2 GH3_Rick_bad3 GH3_Rick_bad1 ]
		}
	}
	Starpower = {
		Good = {
			FAST = [ GH3_crowd_Genna_good_fast2 ]
			Med = [ GH3_crowd_Genna_good_fast2 ]
			Slow = [ GH3_crowd_Genna_good_fast2 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Genna_good_fast2 ]
			Med = [ GH3_crowd_Genna_good_fast2 ]
			Slow = [ GH3_crowd_Genna_good_fast2 ]
		}
		Bad = {
			FAST = [ GH3_Rick_bad1 GH3_Rick_bad2 GH3_Rick_bad3 ]
			Med = [ GH3_Rick_bad2 GH3_Rick_bad2 GH3_Rick_bad3 ]
			Slow = [ GH3_Rick_bad2 GH3_Rick_bad3 GH3_Rick_bad1 ]
		}
	}
}
crowd_animations_colin = {
	Idle = {
		Good = {
			FAST = [ GH3_crowd_Rick_good_fast1 GH3_crowd_Rick_good_fast2 ]
			Med = [ GH3_crowd_Colin_good_med1 GH3_crowd_Genna_good_med2 ]
			Slow = [ GH3_crowd_Colin_good_slow1 GH3_crowd_Genna_good_slow2 GH3_crowd_Colin_good_slow3 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Colin_Reg_fast1 #"0xf62fe81e" GH3_crowd_Colin_Reg_fast3 ]
			Med = [ GH3_crowd_Colin_Reg_med1 #"0x3599af3a" GH3_crowd_Colin_Reg_med3 ]
			Slow = [ GH3_crowd_Colin_Reg_slow1 GH3_crowd_Colin_Reg_slow2 GH3_crowd_Colin_Reg_slow3 ]
		}
		Bad = {
			FAST = [ GH3_crowd_Colin_bad1 GH3_crowd_Colin_bad2 GH3_crowd_Colin_bad3 ]
			Med = [ GH3_crowd_Colin_bad1 GH3_crowd_Colin_bad2 GH3_crowd_Colin_bad3 ]
			Slow = [ GH3_crowd_Colin_bad1 GH3_crowd_Colin_bad2 GH3_crowd_Colin_bad3 ]
		}
	}
	Special = {
		Good = {
			FAST = [ GH3_crowd_Colin_special_slow3 ]
			Med = [ #"0xb814637e" ]
			Slow = [ GH3_crowd_Colin_special_slow3 ]
		}
		Normal = {
			FAST = [ #"0xb814637e" ]
			Med = [ GH3_crowd_Colin_special_slow3 ]
			Slow = [ #"0xb814637e" ]
		}
		Bad = {
			FAST = [ GH3_crowd_Colin_bad1 GH3_crowd_Colin_bad2 GH3_crowd_Colin_bad3 ]
			Med = [ GH3_crowd_Colin_bad2 GH3_crowd_Colin_bad3 GH3_crowd_Colin_bad1 ]
			Slow = [ GH3_crowd_Colin_bad1 GH3_crowd_Colin_bad2 GH3_crowd_Colin_bad3 ]
		}
	}
	Starpower = {
		Good = {
			FAST = [ GH3_crowd_Colin_good_med3 ]
			Med = [ GH3_crowd_Colin_good_med3 ]
			Slow = [ GH3_crowd_Colin_good_med3 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Colin_good_med3 ]
			Med = [ GH3_crowd_Colin_good_med3 ]
			Slow = [ GH3_crowd_Colin_good_med3 ]
		}
		Bad = {
			FAST = [ GH3_crowd_Colin_bad1 GH3_crowd_Colin_bad2 GH3_crowd_Colin_bad3 ]
			Med = [ GH3_crowd_Colin_bad2 GH3_crowd_Colin_bad3 GH3_crowd_Colin_bad1 ]
			Slow = [ GH3_crowd_Colin_bad1 GH3_crowd_Colin_bad2 GH3_crowd_Colin_bad3 ]
		}
	}
}
crowd_animations_bill = {
	Idle = {
		Good = {
			FAST = [ GH3_crowd_Rick_good_fast3 GH3_crowd_Colin_good_fast1 ]
			Med = [ GH3_crowd_Jerod_good_med1 GH3_crowd_Rick_good_med2 ]
			Slow = [ GH3_crowd_Bill_good_slow1 GH3_crowd_Bill_good_slow2 GH3_crowd_Bill_good_slow3 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Jerod_reg_fast2 GH3_crowd_Rick_regular_fast3 GH3_crowd_Colin_Reg_fast1 ]
			Med = [ GH3_crowd_Jerod_reg_med3 GH3_crowd_Rick_regular_med2 GH3_crowd_Colin_Reg_med3 ]
			Slow = [ GH3_crowd_Jerod_regular_slow3 GH3_crowd_Rick_regular_slow1 GH3_crowd_Colin_Reg_slow3 ]
		}
		Bad = {
			FAST = [ GH3_Jerod_bad2 GH3_Rick_bad3 GH3_crowd_Colin_bad1 ]
			Med = [ GH3_Jerod_bad1 GH3_Rick_bad2 GH3_crowd_Colin_bad3 ]
			Slow = [ GH3_Jerod_bad2 GH3_Rick_bad1 GH3_crowd_Colin_bad3 ]
		}
	}
	Special = {
		Good = {
			FAST = [ #"0x2670f6dd" ]
			Med = [ GH3_crowd_colin_special_slow4 ]
			Slow = [ #"0x2670f6dd" ]
		}
		Normal = {
			FAST = [ GH3_crowd_colin_special_slow4 ]
			Med = [ #"0x2670f6dd" ]
			Slow = [ GH3_crowd_colin_special_slow4 ]
		}
		Bad = {
			FAST = [ GH3_Rick_bad1 GH3_Jerod_bad2 GH3_crowd_Colin_bad3 ]
			Med = [ GH3_Rick_bad2 GH3_crowd_Colin_bad3 GH3_Jerod_bad1 ]
			Slow = [ GH3_Jerod_bad3 GH3_Rick_bad1 GH3_crowd_Colin_bad3 ]
		}
	}
	Starpower = {
		Good = {
			FAST = [ GH3_crowd_Jerod_good_med2 ]
			Med = [ GH3_crowd_Jerod_good_med2 ]
			Slow = [ GH3_crowd_Jerod_good_med2 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Jerod_good_med2 ]
			Med = [ GH3_crowd_Jerod_good_med2 ]
			Slow = [ GH3_crowd_Jerod_good_med2 ]
		}
		Bad = {
			FAST = [ GH3_Rick_bad1 GH3_Jerod_bad2 GH3_crowd_Colin_bad3 ]
			Med = [ GH3_Rick_bad2 GH3_crowd_Colin_bad3 GH3_Jerod_bad1 ]
			Slow = [ GH3_Jerod_bad3 GH3_Rick_bad1 GH3_crowd_Colin_bad3 ]
		}
	}
}
crowd_animations_genna = {
	Idle = {
		Good = {
			FAST = [ GH3_crowd_Genna_good_fast1 GH3_crowd_Becki_good_fast3 ]
			Med = [ GH3_crowd_Genna_good_med1 GH3_crowd_Genna_good_med2 GH3_crowd_Genna_good_med3 ]
			Slow = [ GH3_crowd_Genna_good_slow1 GH3_crowd_Genna_good_slow2 GH3_crowd_Genna_good_slow3 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Colin_Reg_fast1 GH3_crowd_Jerod_reg_fast2 GH3_crowd_Genna_regular_fast3 ]
			Med = [ GH3_crowd_Genna_regular_med1 GH3_crowd_Genna_regular_med2 GH3_crowd_Genna_regular_med3 ]
			Slow = [ #"0x487a110f" #"0x60f75f06" GH3_crowd_Genna_regular_slow3 ]
		}
		Bad = {
			FAST = [ GH3_Genna_bad1 GH3_Genna_bad2 GH3_Genna_bad3 ]
			Med = [ GH3_Genna_bad1 GH3_Genna_bad2 GH3_Genna_bad3 ]
			Slow = [ GH3_Genna_bad1 GH3_Genna_bad2 GH3_Genna_bad3 ]
		}
	}
	Special = {
		Good = {
			FAST = [ GH3_crowd_colin_special_slow2 ]
			Med = [ #"0xcf1353e8" ]
			Slow = [ GH3_crowd_colin_special_slow2 ]
		}
		Normal = {
			FAST = [ #"0xcf1353e8" ]
			Med = [ GH3_crowd_colin_special_slow2 ]
			Slow = [ #"0xcf1353e8" ]
		}
		Bad = {
			FAST = [ GH3_Genna_bad1 GH3_Genna_bad2 GH3_Genna_bad3 ]
			Med = [ GH3_Genna_bad2 GH3_Genna_bad2 GH3_Genna_bad3 ]
			Slow = [ GH3_Genna_bad1 GH3_Genna_bad2 GH3_Genna_bad3 ]
		}
	}
	Starpower = {
		Good = {
			FAST = [ GH3_crowd_Jerod_good_fast2 ]
			Med = [ GH3_crowd_Jerod_good_fast2 ]
			Slow = [ GH3_crowd_Jerod_good_fast2 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Jerod_good_fast2 ]
			Med = [ GH3_crowd_Jerod_good_fast2 ]
			Slow = [ GH3_crowd_Jerod_good_fast2 ]
		}
		Bad = {
			FAST = [ GH3_Genna_bad1 GH3_Genna_bad2 GH3_Genna_bad3 ]
			Med = [ GH3_Genna_bad2 GH3_Genna_bad2 GH3_Genna_bad3 ]
			Slow = [ GH3_Genna_bad1 GH3_Genna_bad2 GH3_Genna_bad3 ]
		}
	}
}
crowd_animations_tabledancer = {
	Idle = {
		Good = {
			FAST = [ #"0xed4d73dc" #"0x034312f0" ]
			Med = [ #"0x5321d1c4" #"0xbd2fb0e8" #"0xca28807e" ]
			Slow = [ #"0xc779e0de" #"0x5e70b164" #"0x297781f2" #"0xb7131451" ]
		}
		Normal = {
			FAST = [ #"0xed4d73dc" #"0x034312f0" ]
			Med = [ #"0x5321d1c4" #"0xbd2fb0e8" #"0xca28807e" ]
			Slow = [ #"0xc779e0de" #"0x5e70b164" #"0x297781f2" #"0xb7131451" ]
		}
		Bad = {
			FAST = [ #"0xed4d73dc" ]
			Med = [ #"0xbd2fb0e8" ]
			Slow = [ #"0xb7131451" ]
		}
	}
	Special = {
		Good = {
			FAST = [ #"0x41eda03e" #"0xd8e4f184" #"0xafe3c112" #"0x318754b1" ]
			Med = [ #"0xd27a18e8" #"0xa57d287e" #"0x4b734952" #"0x3b19bddd" ]
			Slow = [ #"0x6bd9333c" #"0x85d75210" #"0x1bb3c7b3" #"0xf2d06286" ]
		}
		Normal = {
			FAST = [ #"0x41eda03e" #"0xd8e4f184" #"0xafe3c112" #"0x318754b1" ]
			Med = [ #"0xd27a18e8" #"0xa57d287e" #"0x4b734952" #"0x3b19bddd" ]
			Slow = [ #"0x6bd9333c" #"0x85d75210" #"0x1bb3c7b3" #"0xf2d06286" ]
		}
		Bad = {
			FAST = [ #"0x41eda03e" #"0xd8e4f184" #"0xafe3c112" #"0x318754b1" ]
			Med = [ #"0xd27a18e8" #"0xa57d287e" #"0x4b734952" #"0x3b19bddd" ]
			Slow = [ #"0x6bd9333c" #"0x85d75210" #"0x1bb3c7b3" #"0xf2d06286" ]
		}
	}
	No_tempo = {
		Good = {
			FAST = [ #"0xc302bcd5" #"0x2d0cddf9" ]
			Med = [ #"0xc302bcd5" #"0x2d0cddf9" ]
			Slow = [ #"0xc302bcd5" #"0x2d0cddf9" ]
		}
		Normal = {
			FAST = [ #"0xc302bcd5" #"0x2d0cddf9" ]
			Med = [ #"0xc302bcd5" #"0x2d0cddf9" ]
			Slow = [ #"0xc302bcd5" #"0x2d0cddf9" ]
		}
		Bad = {
			FAST = [ #"0xc302bcd5" #"0x2d0cddf9" ]
			Med = [ #"0xc302bcd5" #"0x2d0cddf9" ]
			Slow = [ #"0xc302bcd5" #"0x2d0cddf9" ]
		}
	}
}
crowd_animations_becki = {
	Idle = {
		Good = {
			FAST = [ GH3_crowd_Becki_good_fast2 GH3_crowd_Becki_good_fast3 ]
			Med = [ GH3_crowd_Becki_good_med2 GH3_crowd_Becki_good_med3 ]
			Slow = [ GH3_crowd_Becki_good_slow1 GH3_crowd_Becki_good_slow2 GH3_crowd_Becki_good_slow3 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Becki_good_fast1 GH3_crowd_Becki_reg_fast2 GH3_crowd_Becki_reg_fast3 ]
			Med = [ #"0x3599af3a" #"0x5aed15a3" GH3_crowd_Becki_reg_med3 ]
			Slow = [ GH3_crowd_Becki_regular_slow1 GH3_crowd_Becki_regular_slow2 GH3_crowd_Becki_regular_slow3 ]
		}
		Bad = {
			FAST = [ GH3_Becki_bad1 GH3_Becki_bad2 GH3_Becki_bad3 ]
			Med = [ GH3_Becki_bad1 GH3_Becki_bad2 GH3_Becki_bad3 ]
			Slow = [ GH3_Becki_bad1 GH3_Becki_bad2 GH3_Becki_bad3 ]
		}
	}
	Special = {
		Good = {
			FAST = [ #"0xb814637e" ]
			Med = [ GH3_crowd_Colin_special_slow3 ]
			Slow = [ #"0xb814637e" ]
		}
		Normal = {
			FAST = [ GH3_crowd_Colin_special_slow3 ]
			Med = [ #"0xb814637e" ]
			Slow = [ GH3_crowd_Colin_special_slow3 ]
		}
		Bad = {
			FAST = [ GH3_Becki_bad1 GH3_Becki_bad2 GH3_Becki_bad3 ]
			Med = [ GH3_Becki_bad2 GH3_Becki_bad3 GH3_Becki_bad1 ]
			Slow = [ GH3_Becki_bad1 GH3_Becki_bad2 GH3_Becki_bad3 ]
		}
	}
	Starpower = {
		Good = {
			FAST = [ GH3_crowd_Genna_good_fast2 ]
			Med = [ GH3_crowd_Genna_good_fast2 ]
			Slow = [ GH3_crowd_Genna_good_fast2 ]
		}
		Normal = {
			FAST = [ GH3_crowd_Genna_good_fast2 ]
			Med = [ GH3_crowd_Genna_good_fast2 ]
			Slow = [ GH3_crowd_Genna_good_fast2 ]
		}
		Bad = {
			FAST = [ GH3_Becki_bad1 GH3_Becki_bad2 GH3_Becki_bad3 ]
			Med = [ GH3_Becki_bad2 GH3_Becki_bad3 GH3_Becki_bad1 ]
			Slow = [ GH3_Becki_bad1 GH3_Becki_bad2 GH3_Becki_bad3 ]
		}
	}
}
stagediver_anims = {
	Z_Dive = [ GH3_Ped_StageDive ]
	Z_Party = [ GH3_Ped_StageDive ]
	Z_ArtDeco = [ GH3_Ped_StageDive ]
	Z_Video = [ GH3_Ped_StageDive ]
	Z_Prison = [ GH3_Ped_StageDive ]
	Z_Soundcheck = [ GH3_Ped_StageDive ]
	Z_Budokan = [ GH3_Ped_StageDive ]
	Z_Wikker = [ GH3_Ped_StageDive ]
	Z_Hell = [ GH3_Ped_StageDive ]
	Default = [ GH3_Ped_StageDive ]
}
