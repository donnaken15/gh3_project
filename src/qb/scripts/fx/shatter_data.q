
script ShatterFromSkater \{vel_scale = 0.5 gravity = (0.0, -6.350000381469727, 0.0) area = 1.29 Blend_Mode = Blend variance = 0.0 spread = 1.0 life = 4.0 bounce_floor = -254.0 bounce_amp = 0.254 shininess = 0 radius = 0.0}
	Obj_GetID
	<ObjID> ::Obj_GetVelocity
	<Force> = (<vel> * <vel_scale>)
	<ObjID> ::Obj_GetPosition
	if GotParam \{ radial_shatter }
		Printf \{ "Using skater's position for nicer shatter.  If a crash occurs after this text, please remove the radial_shatter parameter from the ShatterFromSkater parameter list" }
		<origin> = <Pos>
	endif
	Shatter <...>
endscript