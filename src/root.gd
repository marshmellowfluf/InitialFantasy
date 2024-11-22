extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$DebugStateLabel.text = $PlayerActor.state_machine.current_state.state_name + '\n' + \
		str($PlayerActor.velocity.angle()) + '\n' + \
		str($TestNpc/StateMachine/Wander.move_target)
