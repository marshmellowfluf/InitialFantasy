extends CharacterBody2D

class_name BaseActor

signal direction_changed(new_direction)
signal position_changed(new_position)
signal died()

@export var look_direction = Vector2(1, 0)
@export var lock_direction = false
@export var lock_step = false
@export var step_speed = 0.1
@export var sprite_prefix = ""

@onready var collision_shape = $CollisionShape2D

func set_dead(value):
	set_process_input(not value)
	set_physics_process(not value)
	$CollisionPolygon2D.disabled = value
	if value: emit_signal("died")

func set_look_direction(value):
	look_direction = value
	emit_signal("direction_changed", value)
