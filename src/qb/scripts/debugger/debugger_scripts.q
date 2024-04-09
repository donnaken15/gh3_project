
script OnDebuggerStartup
	Printf \{ "Starting up debugger scripts..." }
	SendScriptFunctionsToDebugger
	DebuggerSendModeText
endscript

script OnDebuggerQuit
	ClearSpritePreview
endscript

script DebuggerSendModeText
	DebuggerGetModeText
	RunRemoteScript {
		ObjID = mouse_window
		ScriptName = SetTitle
		Params = {
			('Mouse window: ' + <mode_text>)
		}
	}
endscript

script GetGameScriptFunctionList
	ScriptFunctions = [
		{text = 'Toggle Mouse Select Mode' , ScriptName = DebuggerCycleSelectMode}
		{text = 'Preview Image' , ScriptName = RequestImagePreview}
		{text = 'Clear Previewed Images' , ScriptName = ClearSpritePreview}
		{text = 'Send Camera to Clipboard' , ScriptName = CopyCameraLocationToClipboard}
	]
	return <...>
endscript

script GetAndCombineScriptFunctionLists
	GetGameScriptFunctionList
	if ScriptExists \{ GetUserScriptFunctionList }
		GetUserScriptFunctionList
		if GotParam \{ UserScriptFunctions }
			return {
				FunctionSets = [
					{SetName = 'User Scripts' Functions = <UserScriptFunctions>}
					{SetName = 'Game Scripts' Functions = <ScriptFunctions>}
				]
				Title = 'Script Function List'
				Id = scriptfuncs
				ButtonScript = RunRemoteScript
			}
		endif
	endif
	return {
		FunctionSets = [
			{SetName = 'Game Scripts' Functions = <ScriptFunctions>}
		]
		Title = 'Script Function List'
		Id = scriptfuncs
		ButtonScript = RunRemoteScript
	}
endscript

script SendScriptFunctionsToDebugger
	GetAndCombineScriptFunctionLists
	RunRemoteScript ScriptName = CreateFunctionListWindow Params = <...>
endscript

script DoSpriteHighlightEffect
	SetScreenElementLock \{ Id = root_window OFF }
	CreateScreenElement \{PARENT = root_window Id = debugger_sprite_highlight Type = ContainerElement tags = { hide_from_debugger }just = [ Left top ] z_priority = 3000000}
	box_border_width = 3
	box_color = [ 128 30 128 128 ]
	resize_color = [ 128 80 0 128 ]
	CreateScreenElement {
		PARENT = debugger_sprite_highlight
		Type = SpriteElement
		Pos = (<X> * (1.0, 0.0) + <Y> * (0.0, 1.0))
		dims = (<w> * (1.0, 0.0) + <box_border_width> * (0.0, 1.0))
		rgba = <box_color>
		just = [ Left top ]
	}
	CreateScreenElement {
		PARENT = debugger_sprite_highlight
		Type = SpriteElement
		Pos = (<X> * (1.0, 0.0) + <Y> * (0.0, 1.0) + <h> * (0.0, 1.0))
		dims = (<w> * (1.0, 0.0) + <box_border_width> * (0.0, 1.0))
		rgba = <box_color>
		just = [ Left bottom ]
	}
	CreateScreenElement {
		PARENT = debugger_sprite_highlight
		Type = SpriteElement
		Pos = (<X> * (1.0, 0.0) + <Y> * (0.0, 1.0))
		dims = (<box_border_width> * (1.0, 0.0) + <h> * (0.0, 1.0))
		rgba = <box_color>
		just = [ Left top ]
	}
	CreateScreenElement {
		PARENT = debugger_sprite_highlight
		Type = SpriteElement
		Pos = (<X> * (1.0, 0.0) + <w> * (1.0, 0.0) + <Y> * (0.0, 1.0))
		dims = (<box_border_width> * (1.0, 0.0) + <h> * (0.0, 1.0))
		rgba = <box_color>
		just = [ Right top ]
	}
	resize_handle_x = 10
	resize_handle_y = 10
	if (<w> < <resize_handle_x>)
		resize_handle_x = <w>
	endif
	if (<h> < <resize_handle_y>)
		resize_handle_y = <h>
	endif
	CreateScreenElement {
		PARENT = debugger_sprite_highlight
		Type = SpriteElement
		Pos = (<X> * (1.0, 0.0) + <w> * (1.0, 0.0) + <Y> * (0.0, 1.0) + <h> * (0.0, 1.0))
		dims = (<resize_handle_x> * (1.0, 0.0) + <resize_handle_y> * (0.0, 1.0))
		rgba = <resize_color>
		just = [ Right bottom ]
	}
	RunScriptOnScreenElement \{ Id = debugger_sprite_highlight debugger_sprite_highlight_flash }
endscript

script debugger_sprite_highlight_flash
	begin
		DoMorph \{ Alpha = 0.5 Time = 1 }
		DoMorph \{ Alpha = 1 Time = 1 }
	repeat
endscript

script KillSpriteHighlightEffect
	if ScreenElementExists \{ Id = debugger_sprite_highlight }
		DestroyScreenElement \{ Id = debugger_sprite_highlight }
	endif
endscript

script RequestImagePreview
	RunRemoteScript \{ScriptName = GetOpenFileName DisableTimeout Params = { typename = 'PNG Images' typefilter = '*.png' }LocalCallback = RequestImagePreview_GotFile}
endscript

script RequestImagePreview_GotFile
	if GotParam \{ FileName }
		FormatText textname = args '-pp -f%a' a = <FileName>
		RunRemoteScript {
			ScriptName = RunShellCommand
			DisableTimeout
			Params = {
				Command = 'bindproj && pngconv.exe'
				args = <args>
			}
			LocalCallback = RequestImagePreview_FileConverted
			CallbackParams = { FileName = <FileName> }
		}
	else
		Printf \{ "No file selected!" }
	endif
endscript

script RequestImagePreview_FileConverted
	if GetRelativePath path = (<CallbackParams>.FileName)Dir = 'images' discard_extension
		GetFileNameFromPath path = <RelativePath>
	else
		message = 'Sprite needs to be located in ' [ proj_root ] / Data / images ' or subdirectory thereof !!!!'
		Printf <message>
		RunRemoteScript ScriptName = Printf Params = { <message> }
		return
	endif
	AddImageToGame <...>
endscript

script AddImageToGame
	FormatText ChecksumName = texture_checksum <FileName>
	FormatText ChecksumName = sprite_id 'debugger_preview_sprite_%s' s = <FileName>
	if ScreenElementExists Id = <sprite_id>
		ClearSpritePreview_KillPreviewElement Id = <sprite_id>
	endif
	if NOT IsTextureInDictionary dictionary = sprite texture = <texture_checksum>
		LoadTexture <RelativePath>
		need_unload = 1
	endif
	element_z = 20000
	if NOT ScreenElementExists \{ Id = debugger_sprite_preview_anchor }
		SetScreenElementLock \{ Id = root_window OFF }
		CreateScreenElement {
			Type = ContainerElement
			PARENT = root_window
			Id = debugger_sprite_preview_anchor
			z_priority = <element_z>
		}
	else
		debugger_sprite_preview_anchor ::GetSingleTag \{ element_z }
	endif
	element_z = (<element_z> + 1)
	SetScreenElementLock \{ Id = debugger_sprite_preview_anchor OFF }
	CreateScreenElement {
		Type = SpriteElement
		PARENT = debugger_sprite_preview_anchor
		Id = <sprite_id>
		texture = <texture_checksum>
		Pos = (200.0, 200.0)
		Scale = 1
		rgba = [ 128 128 128 128 ]
		z_priority = <element_z>
	}
	<sprite_id> ::SetTags debugger_display_name = <FileName>
	debugger_sprite_preview_anchor ::SetTags element_z = <element_z>
	if GotParam \{ need_unload }
		<sprite_id> ::SetTags need_sprite_unload = <RelativePath>
	endif
endscript

script ClearSpritePreview
	if ScreenElementExists \{ Id = debugger_sprite_preview_anchor }
		GetScreenElementChildren \{ Id = debugger_sprite_preview_anchor }
		if GotParam \{ children }
			i = 0
			GetArraySize <children>
			begin
				ClearSpritePreview_KillPreviewElement Id = (<children> [ <i> ])
				i = (<i> + 1)
			repeat <array_Size>
		endif
		DestroyScreenElement \{ Id = debugger_sprite_preview_anchor }
	endif
endscript

script ClearSpritePreview_KillPreviewElement
	if <Id> ::GetSingleTag need_sprite_unload
		Printf \{ "destroying element with sprite unload" }
		DestroyScreenElement Id = <Id>
		UnloadTexture <need_sprite_unload>
	else
		Printf \{ "destroying element with no sprite unload" }
		DestroyScreenElement Id = <Id>
	endif
endscript
