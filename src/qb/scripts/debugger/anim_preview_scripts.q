
script UnHidePlayerAndDestroyFakes
	killspawnedscript \{ name = _TestAnimSequence }
	if CompositeObjectExists \{ name = FakeCharacter }
		FakeCharacter ::DIE
	endif
	if CompositeObjectExists \{ name = AnimTreePreviewObject }
		AnimTreePreviewObject ::DIE
	endif
endscript

script TestAnim \{ Skeleton = GH3_Guitarist_Axel }
	if GotParam \{ OFF }
		UnHidePlayerAndDestroyFakes
	else
		ReloadAndTestAnim <...> Skeleton = <Skeleton>
	endif
endscript

script ReloadAndTestAnim
	killspawnedscript \{ name = _TestAnimSequence }
	LaunchEvent \{Type = DrawRequested Data = { cycledown }}
	FormatText ChecksumName = AnimName '%s' s = <Anim> DontAssertForChecksums
	if GotParam \{ DifferenceAnim }
		if (<DifferenceAnim> = "")
		else
			FormatText ChecksumName = DifferenceAnimName '%s' s = <DifferenceAnim>
		endif
	endif
	CreateFake \{ Original = GUITARIST Skeleton = GH3_Guitarist_Axel Pos = (0.0, 2.0, 2.0) }
	if GotParam \{ Cycle }
		AnimTreePreviewObject ::ModelViewer_PlayAnim Anim = <AnimName> BlendPeriod = 0 Speed = <Speed> Cycle
	else
		AnimTreePreviewObject ::ModelViewer_PlayAnim Anim = <AnimName> BlendPeriod = 0 Speed = <Speed>
	endif
	if GotParam \{ DifferenceAnim }
		AnimTreePreviewObject ::Obj_PoseControllerCommand Command = PlaySequence DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
	endif
	AnimTreePreviewObject ::Obj_ForceUpdate
endscript

script CreateFake
	if NOT CompositeObjectExists name = <Original>
		return
	endif
	if CompositeObjectExists \{ name = AnimTreePreviewObject }
		AnimTreePreviewObject ::DIE
	endif
	UpdateAnimCache \{ CLEAR }
	<Original> ::Obj_GetQuat
	CreateCompositeObject {
		Components = [
			{
				Component = Suspend
			}
			{
				Component = AnimTree
			}
			{
				Component = Skeleton
			}
			{
				Component = SetDisplayMatrix
			}
			{
				Component = Model
				CloneFrom = <Original>
			}
		]
		Params = {
			SkeletonName = <Skeleton>
			name = AnimTreePreviewObject
			Pos = <Pos>
			Orientation = <Quat>
		}
	}
	AnimTreePreviewObject ::ModelViewer_InitAnimTree
endscript

script AnimTreePreview
	AnimTreePreview_NxCommon targetObject = GUITARIST Ragdoll = ragdoll_ped <...>
	if NOT CompositeObjectExists \{ AnimTreePreviewObject }
		return
	endif
	AnimTreePreviewObject ::UnPause
	if CompositeObjectExists \{ GUITARIST }
		GUITARIST ::Obj_SwitchScript \{ guitarist_idle_animpreview }
	endif
	Change \{ crowd_debug_mode = 1 }
	PlayIGCCam \{name = anim_preview_cam LockTo = GUITARIST Pos = (-0.9129459261894226, 2.025681257247925, 2.383586883544922) Quat = (0.045517995953559875, 0.9636560082435608, -0.18475298583507538) FOV = 72.0 Play_hold interrupt_current}
endscript

script AnimTreePreviewRestore
	UnHidePlayerAndDestroyFakes
	Change \{ crowd_debug_mode = 0 }
	KillSkaterCamAnim \{ name = anim_preview_cam }
	if CompositeObjectExists \{ GUITARIST }
		GUITARIST ::Unhide
	endif
endscript

script UpdateHeroDifferenceAnim
	if (<DifferenceAnim> = "")
	else
		FormatText ChecksumName = DifferenceAnimName '%s' s = <DifferenceAnim>
		if CompositeObjectExists \{ name = AnimTreePreviewObject }
			AnimTreePreviewObject ::UpdateDifferenceAnim DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
		endif
	endif
endscript

script _TestAnimSequence
	if GotParam \{ Animations }
		CreateFakePlayer \{ Skeleton = GH3_Guitar }
		begin
			GetArraySize <Animations>
			<Index> = 0
			begin
				FormatText ChecksumName = AnimName '%s' s = (<Animations> [ <Index> ].Anim)DontAssertForChecksums
				AnimTreePreviewObject ::ModelViewer_PlayAnim {
					Anim = <AnimName>
					Speed = (<Animations> [ <Index> ].Speed)
					BlendPeriod = (<Animations> [ <Index> ].BlendPeriod)
				}
				if (<Index> = 0)
					AnimTreePreviewObject ::Obj_ForceUpdate
				endif
				AnimTreePreviewObject ::ModelViewer_WaitAnimFinished
				<Index> = (<Index> + 1)
			repeat <array_Size>
			if NOT GotParam \{ Cycle }
				break
			endif
		repeat
		wait \{ 1 Second }
		SpawnScriptLater \{ UnHidePlayerAndDestroyFakes }
	endif
endscript

script TestAnimSequence
	killspawnedscript \{ name = _TestAnimSequence }
	SpawnScriptLater _TestAnimSequence Params = <...>
endscript

script KillAnimPreviewRefs
	UnHidePlayerAndDestroyFakes
endscript
