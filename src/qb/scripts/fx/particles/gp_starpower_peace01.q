GP_StarPower_Peace01 = {
	Pos = (0.3568880259990692, 11.243401527404785, 0.07137800008058548)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Bone = BONE_PELVIS
	EmitRangeDims = (0.699999988079071, 0.699999988079071, 0.699999988079071)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 1.0
	PerParticleWind
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (90.0, 90.0)
	SweepSpread = (0.0, 360.0)
	LifeRange = (2.0, 2.5)
	Emit_Rate = 3.0
	Max = 0
	TimeSeed = 0.5
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [ (0.5, 0.5) (0.10000000149011612, 0.10000000149011612) ]
	SpeedRange = (0.5, 1.0)
	RotVel = (-1.0, 1.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1
	NoVisibilityTest
	QuickMaterial = {
		TextureLayout = Layout2x2
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Peace01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 128
		BlendMode = diffuse
		SoftEdge
		SoftedgeScale = 1.0
		QuadAnimationFPS = 15
	}
	Knot = [
		(-5.710206985473633, 0.0, -0.28551000356674194)
		(-5.710206985473633, 0.0, -0.28551000356674194)
		(-5.371562480926514, 0.0, -0.26898497343063354)
		(-5.032917022705078, 0.0, -0.2524610161781311)
		(-4.694272041320801, 0.0, -0.2359360009431839)
		(-2.1073966026306152, 0.0, -0.10970599949359894)
		(0.47947901487350464, 0.0, 0.016524996608495712)
		(3.066354990005493, 0.0, 0.14275500178337097)
		(3.9952242374420166, 0.0, 0.14275500178337097)
		(4.924093246459961, 0.0, 0.14275500178337097)
		(5.852962017059326, 0.0, 0.14275500178337097)
		(5.852962017059326, 0.0, 0.14275500178337097)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-1
		-1
		-256
		-256
	]
	VertexWeight = [ 0.087885 0.759228 1.0 ]
}
