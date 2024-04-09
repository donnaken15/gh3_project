viewerobj_components = [
	{ Component = ViewerObj }
	{ Component = Suspend }
	{ Component = Motion }
	{ Component = Sound }
	{ Component = Stream }
]
viewerobj_AnimTree = {
	Type = ModelViewer
	Id = ModelViewerNode
	[
		{
			Type = Cycle
			Id = CycleNode
			Anim = param_anim
			enable_anim_events
			[
				{ Type = Source Id = SourceNode Anim = param_anim }
			]
		}
	]
}

script viewerobj_set_anim
	Anim_UnInitTree
	if NOT Anim_AnimExists Anim = <AnimName>
		Printf "Bad anim name: %a" a = <AnimName>
		Anim_GetDefaultAnimName
		if Anim_AnimExists Anim = <DefaultAnimName>
			AnimName = <DefaultAnimName>
		endif
	endif
	Printf "Set anim: %a" a = <AnimName>
	Anim_InitTree {
		Tree = $viewerobj_AnimTree
		NodeIdDeclaration = [
			ModelViewerNode
			CycleNode
			SourceNode
		]
		Params = {
			param_anim = <AnimName>
		}
	}
endscript

script viewerobj_set_anim_speed
	Anim_Command \{ Command = ModelViewer_Play Target = ModelViewerNode }
	Anim_Command Command = Timer_SetSpeed Target = CycleNode Params = { Speed = <Speed> }
endscript

script viewerobj_reload_anim
	PrintStruct <...>
	Anim_UnInitTree
	ReloadAnim FileName = <FileName> Anim = <AnimName>
	viewerobj_set_anim <...>
endscript

script viewerobj_step_frame
	Anim_Command \{Command = Timer_SetSpeed Target = CycleNode Params = { Speed = 1.0 }}
	Anim_Command Command = ModelViewer_Step Target = ModelViewerNode Params = <...>
endscript

script viewer_obj_get_panel_info
	Anim_Command \{ Command = Source_GetAnimName Target = SourceNode }
	if Anim_Command \{ Command = ModelViewer_IsStopped Target = ModelViewerNode }
		Speed = 0.0
	else
		Anim_Command \{ Command = Timer_GetSpeed Target = CycleNode }
	endif
	Anim_Command \{ Command = Timer_GetCurrentAnimTime Target = CycleNode }
	Anim_Command \{ Command = Timer_GetAnimDuration Target = CycleNode }
	FormatText textname = line1 "NAME: %n" n = <AnimName> DontAssertForChecksums
	FormatText textname = line2 "SPEED: %s" s = <Speed>
	FormatText textname = line3 "TIME: %t of %d" t = <CurrentTime> d = <Duration>
	CurrentTime = ((<CurrentTime> * 60)+ 1)
	Duration = (<Duration> * 60)
	casttointeger \{ CurrentTime }
	casttointeger \{ Duration }
	FormatText textname = line4 "FRAME: %t of %d" t = <CurrentTime> d = <Duration>
	return <...>
endscript
generic_model_anim_tree = { Type = DegenerateBlend Id = RootNode }
generic_model_anim_branch = {
	Type = param_timer_type
	Id = TimerNode
	Speed = param_speed
	Start = param_start
	Anim = param_anim
	[
		{ Type = Source Id = SourceNode Anim = param_anim }
	]
}
generic_model_anim_branch_flipped = {
	Type = Flip
	Id = FlipNode
	[
		{ generic_model_anim_branch }
	]
}

script ModelViewer_InitAnimTree
	Anim_UnInitTree
	Anim_InitTree \{Tree = $generic_model_anim_tree NodeIdDeclaration = [ RootNode TimerNode SourceNode FlipNode ]}
endscript

script ModelViewer_PlayAnim \{ Anim = 0 Target = RootNode Tree = $generic_model_anim_branch Flipped = 0 }
	timer_type = Play
	if GotParam \{ Cycle }
		timer_type = Cycle
	endif
	if (<Flipped> = 1)
		<Tree> = generic_model_anim_branch_flipped
	endif
	Anim_Command {
		Target = <Target>
		Command = DegenerateBlend_AddBranch
		Params = {
			BlendDuration = <BlendPeriod>
			Tree = <Tree>
			Params = {
				param_timer_type = <timer_type>
				param_anim = <Anim>
				param_speed = <Speed>
				param_start = <Start>
			}
		}
	}
endscript

script ModelViewer_WaitAnimFinished \{ Timer = TimerNode }
	Anim_Command Target = <Timer> Command = Timer_Wait
endscript
