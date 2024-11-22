extends Node

class_name StateMachine

signal state_changed(current_state)

var states_map = {}

var states_stack = []
var current_state = null

@export var active : bool = false:
	get:
		return active
	set(value):
		active = value

func set_active(value):
	active = value
	set_physics_process(value)
	set_process_input(value)
	if not active:
		states_stack = []
		current_state = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for state in get_children():
		if state is State:
			state.connect("finished", _change_state)
	states_stack.push_front(get_child(0))
	current_state = states_stack[0]
	if active: start()

func start():
	current_state.enter()
	set_active(true)

func _unhandled_input(event):
	current_state.handle_input(event)

func _physics_process(delta):
	current_state.tick(delta)

func _on_animation_finished(animation):
	if not active: return
	current_state._on_animation_finished(animation)

func _change_state(state_name):
	if not active: return
	current_state.exit()
	
	if state_name == "return":
		states_stack.pop_front()
	else:
		states_stack[0] = states_map[state_name]
	
	current_state = states_stack[0]
	emit_signal("state_changed", current_state)
	current_state.enter()
