extends "OnGround.gd"

signal last_moved(direction)

@export var MAX_WALK_SPEED : float = 250
@export var MAX_RUN_SPEED : float = 450

@export var sprite_player : AnimatedSprite2D

func enter():
	speed = 0
	velocity = Vector2()
	owner.spriteset = "player_walk"
	
	var input_direction = get_input_direction()
	update_look_direction(input_direction)

func exit():
	pass

func handle_input(event):
	return super.handle_input(event)

func tick(delta):
	var input_direction = get_input_direction()
	if not input_direction:
		emit_signal("finished", "idle")
		return
	update_look_direction(input_direction)
	
	speed = MAX_WALK_SPEED
	velocity = input_direction.normalized() * speed
	var collision_info = owner.move(velocity)
