extends State

func handle_input(event):
	# if event.is_action_pressed("ui_left") or Input.is_action_pressed("ui_left") \
	# or event.is_action_pressed("ui_right") or Input.is_action_pressed("ui_right") \
	# or event.is_action_pressed("ui_up") or Input.is_action_pressed("ui_up") \
	# or event.is_action_pressed("ui_down") or Input.is_action_pressed("ui_down"):
	# 	get_tree().set_input_as_handled()
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

func get_face_direction():
	if not owner.look_direction:
		return "down"
	if abs(owner.look_direction.x) > abs(owner.look_direction.y):
		return "left" if owner.look_direction.x < 0 else "right"
	else:
		return "up" if owner.look_direction.y < 0 else "down"
