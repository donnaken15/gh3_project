numPlywoodSmall = 0
maxPlywoodSmall = 4

script Contact_Settle_Die
	SetTags \{ CONTACT_MADE }
	Contact_TerrainEffects <...>
endscript

script Deactivate_Settle_Die
	GetTags
	if GotParam \{ CONTACT_MADE }
		RemoveTags \{[ CONTACT_MADE ]}
		RemoveParameter \{ CONTACT_MADE }
	endif
	wait randomrange (2.0, 4.0) seconds
	GetTags
	if NOT GotParam \{ CONTACT_MADE }
		DIE
	endif
endscript

script Deactivate_PlywoodSmall
	GetTags
	if GotParam \{ CONTACT_MADE }
		RemoveTags \{[ CONTACT_MADE ]}
		RemoveParameter \{ CONTACT_MADE }
	endif
	wait randomrange (2.0, 4.0) seconds
	GetTags
	if NOT GotParam \{ CONTACT_MADE }
		Change numPlywoodSmall = ($numPlywoodSmall -1)
		DIE
	endif
endscript

script Contact_GO_Cafe_Chair
	if (<SkaterCollision> = TRUE)
		return
	endif
	Contact_TerrainEffects <...>
	<objID1> ::Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		<objID1> ::Obj_GetPosition
		GetUniqueCompositeObjectID \{ PreferredId = GO_Cafe_Chair_Bits }
		CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = $GP_HO_Cafe_Chair_Bits
		GetUniqueCompositeObjectID \{ PreferredId = GO_Cafe_Chair_Dust }
		CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = $GP_HO_Cafe_Chair_Dust
		GetUniqueCompositeObjectID \{ PreferredId = ChairExplodeSound }
		if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM Components = [{ Component = Sound }] Params = {
				name = <UniqueId>
				Pos = <Pos>
			}
			SoundEvent Event = Chair_Break_SFX object = <UniqueId>
		endif
		wait \{ 1 Frame }
		DIE
	endif
endscript

script Contact_Plywood
	Contact_TerrainEffects <...>
	<objID1> ::Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		if NOT GetSingleTag \{ PLYWOOD_BREAK }
			SetTags \{ PLYWOOD_BREAK }
			if (<SkaterCollision> = TRUE)
				newTarget = (-1 * <norm>)
			else
				newTarget = <norm>
			endif
			<objID1> ::Obj_GetPosition
			GetUniqueCompositeObjectID \{ PreferredId = PlywoodBits }
			CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = $GP_Plywood_Bits01
			if IsCreated <UniqueId>
				Orient object = <UniqueId> relativeTo = <objID1> offset = (0.0, 1.0, 0.0)
			endif
			GetUniqueCompositeObjectID \{ PreferredId = PlywoodDust }
			CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = $GP_Plywood_Dust01
			if IsCreated <UniqueId>
				Orient object = <UniqueId> relativeTo = <objID1> offset = (0.0, 1.0, 0.0)
			endif
			if ($numPlywoodSmall < $maxPlywoodSmall)
				begin
					GetUniqueCompositeObjectID \{ PreferredId = PlywoodSmall01 }
					CreateFromStructure {
						name = <UniqueId>
						Pos = (<Pos> + randomrange (-1.0, 1.0) * (1.0, 0.0, 0.0) + randomrange (-1.0, 1.0) * (0.0, 1.0, 0.0) + randomrange (-1.0, 1.0) * (0.0, 0.0, 1.0))
						Angles = (randomrange (-3.1399998664855957, 3.1399998664855957) * (1.0, 0.0, 0.0) + randomrange (-3.1399998664855957, 3.1399998664855957) * (0.0, 1.0, 0.0) + randomrange (-3.1399998664855957, 3.1399998664855957) * (0.0, 0.0, 1.0))
						Class = GameObject
						Type = GO_Plywood_Small_Piece
						Bouncy
						Profile = $profile_GO_Plywood_Small_Piece
					}
					if IsCreated <UniqueId>
						<UniqueId> ::RigidBody_LinearImpulse Impulse = (2.5 * <length> * (<newTarget> + (0.0, 0.25, 0.0)))
						Change numPlywoodSmall = ($numPlywoodSmall + 1)
						if NOT ($numPlywoodSmall < $maxPlywoodSmall)
							break
						endif
					endif
				repeat randomrange (1.0, 2.0)
			endif
			GetUniqueCompositeObjectID \{ PreferredId = ShortPottedPlantExplodeSound }
			if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM Components = [{ Component = Sound }] Params = {
					name = <UniqueId>
					Pos = <Pos>
				}
				SoundEvent Event = Plywood_Break_SFX object = <UniqueId>
			endif
			wait \{ 1 Frame }
			DIE
		endif
	endif
endscript

script Contact_PottedPlant_Short
	if (<SkaterCollision> = TRUE)
		return
	endif
	Contact_TerrainEffects <...>
	<objID1> ::Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		<objID1> ::Obj_GetPosition
		GetUniqueCompositeObjectID \{ PreferredId = PottedPlant_Dirt }
		CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = $GP_Pot_Dust01
		if IsCreated <UniqueId>
			Orient object = <UniqueId> relativeTo = <objID1> offset = (0.0, 0.5, 0.0)
		endif
		GetUniqueCompositeObjectID \{ PreferredId = PottedPlant_Dirt }
		CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = $GP_Pot_Bits01
		GetUniqueCompositeObjectID \{ PreferredId = PottedPlant_Leaves }
		CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = $GP_Leaves_Short01
		if IsCreated <UniqueId>
			Orient object = <UniqueId> relativeTo = <objID1> offset = (0.0, 1.0, 0.0)
		endif
		GetUniqueCompositeObjectID \{ PreferredId = ShortPottedPlantExplodeSound }
		if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM Components = [{ Component = Sound }] Params = {
				name = <UniqueId>
				Pos = <Pos>
			}
			SoundEvent Event = PottedPlant_Explode_SFX object = <UniqueId>
		endif
		wait \{ 1 Frame }
		DIE
	endif
endscript

script Contact_PottedPlant_Tall
	if (<SkaterCollision> = TRUE)
		return
	endif
	Contact_TerrainEffects <...>
	<objID1> ::Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		<objID1> ::Obj_GetPosition
		GetUniqueCompositeObjectID \{ PreferredId = PottedPlant_Dirt }
		CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = $GP_Pot_Dust01
		if IsCreated <UniqueId>
			Orient object = <UniqueId> relativeTo = <objID1> offset = (0.0, 0.699999988079071, 0.0)
		endif
		GetUniqueCompositeObjectID \{ PreferredId = PottedPlant_Dirt }
		CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = $GP_Pot_Bits01
		GetUniqueCompositeObjectID \{ PreferredId = PottedPlant_Leaves }
		CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = $GP_Leaves_Tall01
		if IsCreated <UniqueId>
			Orient object = <UniqueId> relativeTo = <objID1> offset = (0.0, 2.0, 0.0)
		endif
		GetUniqueCompositeObjectID \{ PreferredId = ShortPottedPlantExplodeSound }
		if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM Components = [{ Component = Sound }] Params = {
				name = <UniqueId>
				Pos = <Pos>
			}
			SoundEvent Event = PottedPlant_Explode_SFX object = <UniqueId>
		endif
		wait \{ 1 Frame }
		DIE
	endif
endscript

script Contact_TerrainEffects
	if (<SkaterCollision> = TRUE)
		return
	endif
	<objID1> ::Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> < 3)
		return
	endif
	terrain1 = (($Terrain_Types [ <terrain1> ]).checksum)
	terrain2 = (($Terrain_Types [ <terrain2> ]).checksum)
	GetTerrainTypeParam param = TreadActions terrain = <terrain2>
	begin
		if GetNextArrayElement (<TreadActions>.SkaterJumpLandParticleParms)
			GetUniqueCompositeObjectID \{ PreferredId = BounceTerrain01 }
			if ((<element>.Type)= NewFlat)
				CreateGlobalFastParticleSystem name = <UniqueId> params_Script = <element> Pos = <Pos>
			else
				CreateGlobalFlexParticleSystem name = <UniqueId> params_Script = <element> Pos = <Pos>
			endif
		else
			break
		endif
	repeat
	switch <terrain1>
		case TERRAIN_METALCAR
		case TERRAIN_METAL
		case TERRAIN_METALPOLE
		case TERRAIN_METALTIN
		case TERRAIN_METALLOCKERS
		case TERRAIN_METALTHIN
		case TERRAIN_METALPIPELARGE
		case TERRAIN_MAILBOX
		case TERRAIN_METALGRATE
			switch <terrain2>
				case TERRAIN_DEFAULT
				case TERRAIN_ASPHALT
				case TERRAIN_ASPHALTROUGH
				case TERRAIN_ASPHALTSMOOTH
				case TERRAIN_ASPHALTSMOOTH_HF
				case TERRAIN_BRICK
				case TERRAIN_BRICK_1FT
				case TERRAIN_BRICK_2FT
				case TERRAIN_BRICK_4FT
				case TERRAIN_BRICK_6IN
				case TERRAIN_COBBLESTONE
				case TERRAIN_CONCSMOOTH
				case TERRAIN_CONCROUGH
				case TERRAIN_GOLDCOINS
				case TERRAIN_HIGHFRICTION
				case TERRAIN_MAILBOX
				case TERRAIN_METALCAR
				case TERRAIN_METAL
				case TERRAIN_METALGRATE
				case TERRAIN_METALLOCKERS
				case TERRAIN_METALPIPELARGE
				case TERRAIN_METALPOLE
				case TERRAIN_METALTHIN
				case TERRAIN_METALTIN
				case TERRAIN_SHINGLESTILE
				case TERRAIN_SIDEWALK_1FT
				case TERRAIN_SIDEWALK_2FT
				case TERRAIN_SIDEWALK_4FT
				case TERRAIN_SIDEWALK_4FT_HF
				case TERRAIN_SIDEWALK_8FT
				case TERRAIN_TILE_2FT
				case TERRAIN_TILE_4FT
				case TERRAIN_TILE_6IN
					GetUniqueCompositeObjectID \{ PreferredId = BouncySparks01 }
					CreateGlobalFlexParticleSystem name = <UniqueId> Pos = <Pos> params_Script = {$GP_Bouncy_Sparks01 Emit_Target = ((-1 * <norm>)+ (0.0, 0.25, 0.0))}
			endswitch
	endswitch
endscript
