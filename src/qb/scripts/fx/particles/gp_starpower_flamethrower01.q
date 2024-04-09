GP_StarPower_FlameThrower01 = {
	Pos = (0.0, 0.0, -0.3586530387401581)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = GUITARIST
	Bone = BONE_GUITAR_NECK
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 0.0, -1.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.20000000298023224, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 20.0
	LifeRange = (1.0, 1.2999999523162842)
	Emit_Rate = 16.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.2
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [ (0.20000000298023224, 0.10000000149011612) (0.699999988079071, 0.10000000149011612) ]
	SpeedRange = (1.5, 1.5)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.6
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		DiffuseTextureEnabled
		DiffuseTexture = JOW_StatueFlames01
		SpecularPower = 0
		AlphaCutoff = 24
		BlendMode = Blend
		Burn
		BurnValue = 0.7
		QuadAnimationFPS = 12
	}
	Knot = [
		(-4.837192535400391, 0.0, 0.0)
		(-4.837192535400391, 0.0, 0.0)
		(-4.1530046463012695, 0.0, 0.0)
		(-3.4688167572021484, 0.0, 0.0)
		(-2.784630060195923, 0.0, 0.0)
		(-1.2655400037765503, 0.0, 0.0)
		(0.25355100631713867, 0.0, 0.0)
		(1.7726410627365112, 0.0, 0.0)
		(2.4186692237854004, 0.0, 0.0)
		(3.0646958351135254, 0.0, 0.0)
		(3.7107231616973877, 0.0, 0.0)
		(3.7107231616973877, 0.0, 0.0)
	]
	ParticleColor = [
		-3080192
		-7405568
		-10288897
		-4521729
		-16776961
		-12451585
		-16777216
		-12451840
	]
	VertexWeight = [ 0.240124 0.773269 1.0 ]
}
