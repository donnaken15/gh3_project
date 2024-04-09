GP_ArtDeco_DragonSmoke01 = {
	Pos = (0.0030219999607652426, 0.8018800020217896, -0.7862879037857056)
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
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 0.0, -1.0)
	EnableRotate
	EmitAngle = (40.0, 0.0, 0.0)
	Force = (0.0, 3.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 10.0
	LifeRange = (0.6000000238418579, 0.8999999761581421)
	Emit_Rate = 24.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [ (0.5, 0.5) (2.5, 2.5) ]
	SpeedRange = (4.0, 6.0)
	RotVel = (-0.5, 0.5)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.2
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Steam02
		SpecularPower = 0
		AlphaCutoff = 16
		BlendMode = Blend
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.48496201634407043, 0.0, 0.0)
		(-0.48496201634407043, 0.0, 0.0)
		(-0.46225401759147644, 0.0, 0.0)
		(-0.20386701822280884, 0.0, 0.0)
		(-0.002104000188410282, 0.0, 0.0)
		(0.27184799313545227, 0.0, 0.0)
		(0.40935102105140686, 0.0, 0.0)
		(0.5468550324440002, 0.0, 0.0)
		(0.7768650054931641, 0.0, 0.0)
		(1.006875991821289, 0.0, 0.0)
		(1.0512189865112305, 0.0, 0.0)
		(1.0512189865112305, 0.0, 0.0)
	]
	ParticleColor = [
		1917271552
		1730948096
		1580798719
		-1823339009
		1697717952
		1544556743
		488447232
		623191296
	]
	VertexWeight = [ 0.314324 0.671677 1.0 ]
}
