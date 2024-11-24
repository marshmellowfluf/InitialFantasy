extends State

@export var sprite_player : AnimatedSprite2D
@export var WALK_SPEED : float = 50
@export var IDLE_TIME : float = 5
@export var MOVE_FREQUENCY : float = 0.3

var WANDER_RANGE : Rect2
var speed = 0
var velocity = Vector2()
var move_target = Vector2()
var idle_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if owner.has_node("BoundaryRect"):
		WANDER_RANGE = owner.get_node("BoundaryRect").get_rect()
		WANDER_RANGE.position = owner.position - (WANDER_RANGE.size / 2)
		owner.get_node("BoundaryRect").queue_free()
		
func enter():
	speed = 0
	velocity = Vector2()
	idle_timer = 0
	owner.spriteset = "npc_idle"

func tick(delta):
	if idle_timer > 0:
		idle_timer -= delta
		return
	if move_target.distance_squared_to(owner.position) < 5:
		idle_timer = IDLE_TIME * randf_range(0.5, 1.5)
		move_target = Vector2()
		owner.spriteset = "npc_idle"
		owner.set_sprite(owner.spriteset + "_" + owner.get_face_direction())
		return
	if move_target:
		velocity = owner.position.direction_to(move_target) * WALK_SPEED
		owner.move(velocity)
		return
	move_target = select_target()
	owner.spriteset = "npc_walk"

func select_target():
	return Vector2(randf_range(WANDER_RANGE.position.x, WANDER_RANGE.end.x), randf_range(WANDER_RANGE.position.y, WANDER_RANGE.end.y))
