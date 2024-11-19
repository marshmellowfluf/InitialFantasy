extends "OnGround.gd"

func enter():
	owner.set_sprite("player_idle_" + get_face_direction())
	
func handle_input(event):
	return super.handle_input(event)
	
func tick(delta):
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("finished", "walk")
