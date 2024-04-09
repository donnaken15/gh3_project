
script StartFSMExample
	RegisterMyTestStates
	SetupMyStateMachine
endscript

script RegisterMyTestStates
	Printf \{ "//\\\\//\\\\ registering state structure" }
	RegisterState \{name = Bv_MyTestState Transitions = [{events = [ Enter_State MyChildScriptTrigger ] responses = [{replacement = child state = Bv_MyScriptChild Params = [{ name = param1 ref = input_param }{ name = param2 val = my_param_2 }{ name = param3 val = my_param_3 }]}]}{events = [ ChildTrigger ] responses = [{replacement = child state = Bv_Message Params = [{ name = message val = "ChildTrigger fired!" }]}]}{events = [ RecurTrigger ] recur = TRUE responses = [{replacement = child2 state = Bv_Message Params = [{ name = message val = "RecurTrigger fired!" }]}]}]}
endscript

script SetupMyStateMachine
	Printf \{ "//\\\\//\\\\ setup state machine" }
	CreateCompositeObject \{Params = { name = MyStateMachine permanent }Components = [{ Component = EventCache }{ Component = StateMachineManager }] Heap = FrontEnd}
	MyStateMachine ::Fsm_Set \{state = Bv_MyTestState Params = { input_param = my_input_param }}
endscript

script Bv_MyTestStateInScript
	Printf \{ "//\\\\//\\\\ Bv_MyTestStateInScript" }
	Fsm_Set state = Bv_MyScriptChild Params = {param1 = <input_param> param2 = my_param_2 param3 = <input_param>}
	begin
		blockuntilevent \{anytypes = [ MyChildScriptTrigger ChildTrigger RecurTrigger ]}
		switch <Type>
			case MyChildScriptTrigger
				Fsm_Set state = Bv_MyScriptChild replacement = child Params = {param1 = <input_param> param2 = my_param_2 param3 = my_param_3}
			case ChildTrigger
				Fsm_Set \{state = Bv_Message replacement = child Params = { message = "ChildTrigger fired!" }}
			case RecurTrigger
				Fsm_Set \{state = Bv_Message replacement = child2 Params = { message = "RecurTrigger fired!" }}
		endswitch
	repeat
endscript

script Bv_MyScriptChild
	Printf \{ "//\\\\//\\\\ MyScriptChild Fired" }
	PrintStruct <...>
	begin
		blockuntilevent \{anytypes = [ ScriptChildEvent1 ScriptChildEvent2 ]}
		switch <Type>
			case ScriptChildEvent1
				Printf \{ "//\\\\//\\\\ MyScriptChildLoop1" }
				Fsm_Set state = Bv_MessageLoop replacement = mess1 Params = {message = "MyScriptChildLoop1" Event = <Type>}
			case ScriptChildEvent2
				Printf \{ "//\\\\//\\\\ MyScriptChildLoop2" }
				Fsm_Set state = Bv_MessageLoop replacement = mess2 Params = {message = "MyScriptChildLoop2" Event = <Type>}
		endswitch
		wait \{ 1 Frame }
	repeat
endscript

script Bv_MessageLoop
	begin
		Printf <message>
		wait \{ 10 frames }
	repeat
endscript
