GP_ArtDeco_DragonSparks01 = {
	Pos = (0.0030219999607652426, 0.7304689884185791, -0.7887210249900818)
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
	Bone = Bone_Dragon_Jaw
	EmitRangeDims = (0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
	Emit_Target = (0.0, 0.0, -1.0)
	EnableRotate
	EmitAngle = (40.0, 0.0, 0.0)
	Force = (0.0, 3.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 25.0
	LifeRange = (0.800000011920929, 1.100000023841858)
	Emit_Rate = 64.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [ (0.05000000074505806, 0.05000000074505806) (0.05000000074505806, 0.05000000074505806) ]
	SpeedRange = (4.0, 6.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.2
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = Add
		SortGroup = 3
		DrawOrder = 20.0
		QuadAnimationFPS = 0
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
		-8126209
		-5242625
		-12517121
		-8191745
		-16777216
		-600834048
	]
	VertexWeight = [ 0.585781 1.0 ]
}
