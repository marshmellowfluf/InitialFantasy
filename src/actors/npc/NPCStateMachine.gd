extends StateMachine


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	states_map = {
		'Wander' : $Wander
	}


