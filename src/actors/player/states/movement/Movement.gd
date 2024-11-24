extends State

func handle_input(event):

	pass

func get_input_direction():
	var input_direction = Vector2()
	
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	# input_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	return input_direction

func update_look_direction(direction):
	if direction and owner.look_direction != direction:
		owner.set_look_direction(direction)
