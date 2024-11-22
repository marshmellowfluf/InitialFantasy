extends "OnGround.gd"

func enter():
	owner.spriteset = "player_idle"
	owner.set_sprite("player_idle_" + owner.get_face_direction())
	
func handle_input(event):
	return super.handle_input(event)
	
func tick(delta):
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("finished", "walk")
