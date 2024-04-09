MouseZoomFactor = 0.2
MouseYOffsetUpDownFactor = 0.02
MouseRotationUpDownFactor = -0.013333
MouseRotationLeftRightFactor = 0.01
hi_def_object_viewer_globalscale = 0.3
low_def_object_viewer_globalscale = 0.45
object_viewer_yoffset = 34
object_viewer_globalscale = 0.6
object_viewer_num_lines = 12

script EnableObjViewer
	if ($highdefviewer = 1)
		Change \{ object_viewer_globalscale = $hi_def_object_viewer_globalscale }
	endif
	if ($highdefviewer = 0)
		Change \{ object_viewer_globalscale = $low_def_object_viewer_globalscale }
	endif
	if NOT ScreenElementExists \{ Id = view_dot }
		SetScreenElementLock \{ Id = root_window OFF }
		CreateScreenElement \{Id = view_dot Type = SpriteElement texture = White rgba = [ 255 0 0 128 ] Scale = 1.0 Pos = (320.0, 240.0) PARENT = root_window}
	endif
	if ScreenElementExists \{ Id = obj_viewer_anchor }
		DestroyScreenElement \{ Id = obj_viewer_anchor }
	endif
	SetScreenElementLock \{ Id = root_window OFF }
	CreateScreenElement \{Type = ContainerElement PARENT = root_window Id = obj_viewer_anchor Pos = (20.0, 250.0) just = [ center center ] internal_just = [ Left center ]}
	Scale = ($object_viewer_yoffset * $object_viewer_globalscale)
	posoffset = ((0.0, 1.0) * <Scale>)
	pos0 = ((0.0, 200.0) - (<posoffset> * ($object_viewer_num_lines + 1)))
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text1
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 60 60 100 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text2
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text11
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text12
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text3
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text4
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text5
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text6
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text7
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text8
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text9
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	CreateScreenElement {
		Type = TextElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text10
		Pos = <pos0>
		text = "None"
		font = text_a1
		rgba = [ 58 108 58 255 ]
		just = [ Left center ]
		Scale = $object_viewer_globalscale
	}
endscript
default_obj_viewer_display = 1

script UpdateObjViewer
	if ($default_obj_viewer_display = 1)
		SetScreenElementProps Id = view_obj_text2 text = <ObjName>
		SetScreenElementProps Id = view_obj_text1 text = <ObjType>
		SetScreenElementProps Id = view_obj_text11 text = <PolyStat8>
		SetScreenElementProps Id = view_obj_text12 text = <PolyStat9>
		SetScreenElementProps Id = view_obj_text3 text = <PolyStat0>
		SetScreenElementProps Id = view_obj_text4 text = <PolyStat1>
		SetScreenElementProps Id = view_obj_text5 text = <PolyStat2>
		SetScreenElementProps Id = view_obj_text6 text = <PolyStat3>
		SetScreenElementProps Id = view_obj_text7 text = <PolyStat4>
		SetScreenElementProps Id = view_obj_text8 text = <PolyStat5>
		SetScreenElementProps Id = view_obj_text9 text = <PolyStat6>
		SetScreenElementProps Id = view_obj_text10 text = <PolyStat7>
		hide_ai_debug
	else
		SetScreenElementProps \{ Id = view_obj_text2 text = "" }
		SetScreenElementProps \{ Id = view_obj_text1 text = "" }
		SetScreenElementProps \{ Id = view_obj_text11 text = "" }
		SetScreenElementProps \{ Id = view_obj_text12 text = "" }
		SetScreenElementProps \{ Id = view_obj_text3 text = "" }
		SetScreenElementProps \{ Id = view_obj_text4 text = "" }
		SetScreenElementProps \{ Id = view_obj_text5 text = "" }
		SetScreenElementProps \{ Id = view_obj_text6 text = "" }
		SetScreenElementProps \{ Id = view_obj_text7 text = "" }
		SetScreenElementProps \{ Id = view_obj_text8 text = "" }
		SetScreenElementProps \{ Id = view_obj_text9 text = "" }
		SetScreenElementProps \{ Id = view_obj_text10 text = "" }
	endif
	if GotParam \{ ObjID }
		if CompositeObjectExists name = <ObjID>
			if <ObjID> ::ContainsComponent name = Agent
				<ObjID> ::Agent_UpdateViewed
			endif
		endif
	endif
endscript

script DisableObjViewer
	if ScreenElementExists \{ Id = view_dot }
		DestroyScreenElement \{ Id = view_dot }
	endif
	if ScreenElementExists \{ Id = view_obj_text1 }
		DestroyScreenElement \{ Id = view_obj_text1 }
	endif
	if ScreenElementExists \{ Id = view_obj_text2 }
		DestroyScreenElement \{ Id = view_obj_text2 }
	endif
	if ScreenElementExists \{ Id = view_obj_text3 }
		DestroyScreenElement \{ Id = view_obj_text3 }
	endif
	if ScreenElementExists \{ Id = view_obj_text4 }
		DestroyScreenElement \{ Id = view_obj_text4 }
	endif
	if ScreenElementExists \{ Id = view_obj_text5 }
		DestroyScreenElement \{ Id = view_obj_text5 }
	endif
	if ScreenElementExists \{ Id = view_obj_text6 }
		DestroyScreenElement \{ Id = view_obj_text6 }
	endif
	if ScreenElementExists \{ Id = view_obj_text7 }
		DestroyScreenElement \{ Id = view_obj_text7 }
	endif
	if ScreenElementExists \{ Id = view_obj_text8 }
		DestroyScreenElement \{ Id = view_obj_text8 }
	endif
	if ScreenElementExists \{ Id = view_obj_text9 }
		DestroyScreenElement \{ Id = view_obj_text9 }
	endif
	if ScreenElementExists \{ Id = view_obj_text10 }
		DestroyScreenElement \{ Id = view_obj_text10 }
	endif
	if ScreenElementExists \{ Id = view_obj_text11 }
		DestroyScreenElement \{ Id = view_obj_text11 }
	endif
	if ScreenElementExists \{ Id = view_obj_text12 }
		DestroyScreenElement \{ Id = view_obj_text12 }
	endif
	if ScreenElementExists \{ Id = view_obj_ai }
		DestroyScreenElement \{ Id = view_obj_ai }
	endif
endscript
