extends CharacterBody2D

class_name BaseActor

signal direction_changed(new_direction)
signal position_changed(new_position)
signal died()

@export var look_direction = Vector2(1, 0)
@export var lock_direction = false
@export var step_speed = 0.1
@export var sprite_player : AnimatedSprite2D

var spriteset = ""
@onready var collision_shape = $CollisionShape2D

func set_dead(value):
	set_process_input(not value)
	set_physics_process(not value)
	$CollisionPolygon2D.disabled = value
	if value: emit_signal("died")

func set_look_direction(value):
	look_direction = value
	if spriteset:
		set_sprite(spriteset + "_" + get_face_direction())
	#emit_signal("direction_changed", value)

func move(v):
	velocity = v
	move_and_slide()
	emit_signal("position_changed", position)
	if not lock_direction:
		set_look_direction(v.normalized())
	#if spriteset:
	#	set_sprite(spriteset + "_" + get_face_direction())
	
func get_face_direction():
	if not look_direction:
		return "down"
	if abs(look_direction.x) > abs(look_direction.y):
		return "left" if look_direction.x < 0 else "right"
	else:
		return "up" if look_direction.y < 0 else "down"

func set_sprite(sprite):
	if sprite_player.animation == sprite:
		return
	if sprite_player.sprite_frames.has_animation(sprite):
		sprite_player.animation = sprite
