extends "../Movement.gd"

var speed = 0.0
var velocity = Vector2()

func handle_input(event):
	if event.is_action_pressed("ui_interact"):
		var collisions = owner.check_for_interaction()
		if collisions:
			collisions["collider"].get_node("InteractComponent").interact()
	return super.handle_input(event)
