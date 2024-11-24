extends Node2D

@onready var world = $World
@onready var ui = $UI

var debug_range

# Called when the node enters the scene tree for the first time.
func _ready():
	debug_range = ColorRect.new()
	debug_range.color = Color(0, 0.1, 0, 0.2)
	debug_range.position = $World/TestNpc/StateMachine/Wander.WANDER_RANGE.position
	debug_range.size = $World/TestNpc/StateMachine/Wander.WANDER_RANGE.size
	world.add_child(debug_range)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UI/DebugStateLabel.text = $World/PlayerActor.state_machine.current_state.state_name + '\n' + \
		str($World/TestNpc/StateMachine/Wander.WANDER_RANGE) + '\n' + \
		str($World/TestNpc.position)

func pause_processing(p : bool):
	get_tree().paused = p
