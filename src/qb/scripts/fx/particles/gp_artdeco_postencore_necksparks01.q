GP_ArtDeco_PostEncore_NeckSparks01 = {
	Pos = (0.0, 0.7776699662208557, -0.7793149948120117)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = Z_ArtDeco_TRG_Geo_Dragon
	Bone = Bone_Dragon_Neck02
	EmitRangeDims = (0.30000001192092896, 0.30000001192092896, 0.30000001192092896)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, -1.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -7.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 90.0
	BounceHeight = 0.0
	BounceCoeff = 0.2
	BounceCallbackRate = 0.0
	LifeRange = (2.0, 3.0)
	Emit_Rate = 12.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = onoff
	EmitPeriod = 2.5
	SizeRange = [ (0.07000000029802322, 3.0) (0.0, 4.0) ]
	SpeedRange = (3.0, 5.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.04
	History = 2
	HistoryListCoordinateSpace = World
	Color = -9568001
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		AlphaCutoff = 96
		BlendMode = Add
		Burn
		BurnValue = 0.7
		QuadAnimationFPS = 8
	}
	Knot = [
		(-0.48496201634407043, 0.0, 0.0)
		(-0.48496201634407043, 0.0, 0.0)
		(-0.4410170018672943, 0.0, 0.0)
		(-0.013056999072432518, 0.0, 0.0)
		(0.41490301489830017, 0.0, 0.0)
		(0.7108889818191528, 0.0, 0.0)
		(1.006875991821289, 0.0, 0.0)
		(1.0512189865112305, 0.0, 0.0)
		(1.0512189865112305, 0.0, 0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-1
		-1
	]
	VertexWeight = [ 0.585781 1.0 ]
}
