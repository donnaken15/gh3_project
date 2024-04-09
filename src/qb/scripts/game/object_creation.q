proximobj_composite_structure = [
	{ Component = Sound }
]
particle_composite_structure = [
	{ Component = Suspend }
	{ Component = Particle }
]
moving_particle_composite_structure = [
	{ Component = Suspend }
	{ Component = Motion }
	{ Component = Particle }
]
flexparticle_composite_structure = [
	{ Component = Suspend }
	{ Component = FlexibleParticle }
]
moving_flexparticle_composite_structure = [
	{ Component = Suspend }
	{ Component = Motion }
	{ Component = FlexibleParticle }
]
viewercam_composite_structure = [
	{ Component = Camera far_clip = $camera_default_far_clip }
	{ Component = proximtrigger cube_length = 0.4 trigger_checksum = Camera inactive }
]
levellight_composite_structure = [
	{ Component = PositionMorph }
	{ Component = dynamiclight }
]
igc_camera_structure = [
	{ Component = CinematicCamera UpdateWhenCameraInactive = FALSE }
	{ Component = Camera }
]
gridobj_composite_structure = [
	{ Component = Suspend }
]
GeometryObject_structure = [
	{ Component = GeometryObject }
]
master_node_composite_structure = [
	{ Component = EventCache }
	{ Component = StateMachineManager }
]
gameobj_composite_structure = [
	{ Component = LockObj OFF }
	{ Component = Motion }
]
constraint_composite_structure = [
	{ Component = constraint }
]
bouncy_composite_structure = [
	{ Component = Suspend }
	{ Component = rigidbody }
	{ Component = Sound }
]

script ProcessorGroup_RegisterDefault
	RegisterProcessorGroupDesc \{name = ProcessorGroup_CompositeSystem processors = [{name = Processor_Default Task = { name = PTask_Default }}]}
	ProcessorMgr_Init \{ Group = ProcessorGroup_CompositeSystem }
endscript

script PassGroup_RegisterDefault
	RegisterPassGroupDesc \{name = PassGroup_CompositeSystem passes = [{name = Pass_Default processors = [ Processor_Default ]}{name = Pass_Agent processors = [ Processor_Default ]}{name = Pass_Behavior processors = [ Processor_Default ]}{name = Pass_Anim processors = [ Processor_Default ]}{name = Pass_Move processors = [ Processor_Default ]}{name = Pass_Model processors = [ Processor_Default ]}]}
	PassMgr_Init \{ Group = PassGroup_CompositeSystem }
endscript

script CompositeObjects_RegisterDefault
	PassDefault_components = [
		{ name = Suspend }
		{ name = BBox }
		{ name = ObjectProximity }
		{ name = Sound }
		{ name = Stream }
	]
	RegisterCompositeObjectDesc {
		name = CompositeHuman
		callback = CompositeAgent_CustomizeComponents
		passes =
		[
			{pass = Pass_Default
				Components = <PassDefault_components>
			}
			{pass = Pass_Agent
				Components = [{ name = PedLife }
					{ name = AiInfo }
					{ name = Agent }
					{ name = FAM }
					{ name = Locator }
					{ name = ItemControl }
					{ name = Vision }
					{name = CollisionCache
						Params = {bbox_min = (-0.10000000149011612, -20.0, -0.10000000149011612)
							bbox_max = (0.10000000149011612, 10.0, 0.10000000149011612)
							layer = static_geometry_feeler}}
					{ name = Navigation }
					{ name = Motion }
					{ name = Ragdoll }
				]
			}
			{pass = Pass_Behavior
				Components = [{ name = EventCache }
					{ name = BehaviorSystem }
					{ name = Inventory }
					{ name = Seek }
					{ name = Passenger }
					{ name = Targetable }
					{ name = Proximity }
					{ name = Interact }
					{ name = SkaterLoopingSound }
					{ name = AnimTree }
					{name = LockObj
						Params = { lock_to_object_matrix
						OFF }}
					{ name = NavCollision }
					{name = AlignToGround
						Params = { OFF }}
				]
			}
			{pass = Pass_Model
				Components = [{ name = Skeleton }
					{ name = Model }
					{ name = SpecialItem }
					{name = proximtrigger
						Params = {trigger_checksum = Ped , cube_length = 0.4}}
				]
			}
		]
	}
	RegisterCompositeObjectDesc {
		name = CompositeVehicle
		callback = CompositeAgent_CustomizeComponents
		passes =
		[
			{pass = Pass_Default
				Components = <PassDefault_components>
			}
			{pass = Pass_Agent
				Components = [{ name = PedLife }
					{ name = AiInfo }
					{ name = Agent }
					{ name = FAM }
					{ name = Locator }
					{ name = ItemControl }
					{name = CollisionCache
						Params = {bbox_min = (-0.10000000149011612, -20.0, -0.10000000149011612)
							bbox_max = (0.10000000149011612, 10.0, 0.10000000149011612)
							layer = static_geometry_feeler}}
					{ name = Navigation }
					{ name = Motion }
				]
			}
			{pass = Pass_Behavior
				Components = [{ name = EventCache }
					{ name = BehaviorSystem }
					{ name = Seek }
					{ name = Interact }
					{ name = VehiclePhysics }
					{ name = AnimTree }
					{name = Input
						Params = { controller = 1 }}
				]
			}
			{pass = Pass_Model
				Components = [{ name = Skeleton }
					{ name = Model }
					{name = proximtrigger
						Params = {trigger_checksum = Vehicle , cube_length = 0.4}}
				]
			}]
	}
	RegisterCompositeObjectDesc \{name = CompositeGameObject_SimpleHover callback = NullScript passes = [{pass = Pass_Default Components = [{ name = Suspend }]}{pass = Pass_Move Components = [{ name = Hover }]}{pass = Pass_Model Components = [{ name = ObjectProximity }{ name = Model }]}]}
	RegisterCompositeObjectDesc \{name = CompositeGameObject_StandardRigidBody callback = NullScript passes = [{pass = Pass_Default Components = [{ name = Suspend }]}{pass = Pass_Move Components = [{ name = rigidbody }]}{pass = Pass_Model Components = [{ name = Sound }{ name = Model }]}]}
	AdObject_components = [{ name = Model }
		{ name = Motion }
	]
	Massive_components = [{ name = MassiveAd }]
	AdObject_components = (<AdObject_components> + <Massive_components>)
	RegisterCompositeObjectDesc {
		name = CompositeGameObject_AdObject
		callback = NullScript
		passes =
		[
			{pass = Pass_Default
				Components = <AdObject_components>
			}
		]
	}
endscript

script CompositeAgent_CustomizeComponents
	if GotParam \{ CompassBlipType }
		CreateComponentFromStructure Component = CompassBlip <...>
	endif
	if GotParam \{ voice_profile }
		if StructureContains \{ Structure = appearance voice_profile }
			voice_profile = (<appearance>.voice_profile)
		else
			voice_profile = (<Profile>.voice_profile)
		endif
		if StructureContains Structure = $NoticeVoVoiceProfiles <voice_profile>
			has_notice_vo = ($NoticeVoVoiceProfiles.<voice_profile>)
		else
			has_notice_vo = FALSE
		endif
		SetTags {
			Profile = <Profile>
			voice_profile = <voice_profile>
			has_notice_vo = <has_notice_vo>
		}
	endif
endscript
