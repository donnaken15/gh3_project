
script Fsm_Set \{ replacement = child }
	Fsm_Replace {
		hierarchy = current
		replacement = <replacement>
		state = <state>
		Params = <Params>
	}
endscript

script Register_Fsm_States
	RegisterState \{name = State_TestFsm Task = {name = Task_Debug Params = { label = State_Message message = 'Fsm Test State' }}Transitions = [{events = [ Enter_Behavior ] responses = [{ replacement = this behavior = State_TestFsm2 }]}]}
	RegisterState \{name = State_TestFsm2 Task = {name = Task_Debug Params = { label = State_Message message = 'Fsm Test State 2' }}}
endscript
