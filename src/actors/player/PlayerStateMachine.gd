extends StateMachine


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	states_map = {
		'idle': $Idle,
		'walk': $Walk
	}
	for state in get_children():
		state.connect("finished", _change_state)

func _change_state(state):
	if not active:
		return
	super._change_state(state)

func _unhandled_input(event):
	current_state.handle_input(event)
