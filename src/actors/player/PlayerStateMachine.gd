extends StateMachine


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	states_map = {
		'idle': $Idle,
		'walk': $Walk
	}

#func _unhandled_input(event):
#	current_state.handle_input(event)
