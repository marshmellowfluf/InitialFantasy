extends BaseActor

@onready var state_machine = $StateMachine
@onready var collision_box = $CollisionBox

func _ready():
	state_machine.start()
	sprite_player.play()
	
func check_for_interaction():
	var space_state = get_world_2d().direct_space_state
	var cast_vector = Vector2()
	match get_face_direction():
		"up":
			cast_vector = Vector2(0, -collision_box.shape.size.y / 2 - 20)
		"down":
			cast_vector = Vector2(0, collision_box.shape.size.y / 2 + 20)
		"left":
			cast_vector = Vector2(-collision_box.shape.size.y / 2 - 20, 0)
		"right":
			cast_vector = Vector2(collision_box.shape.size.y / 2 + 20, 0)
	var query = PhysicsRayQueryParameters2D.create(global_position, global_position + cast_vector, 2, [self])
	return space_state.intersect_ray(query)
