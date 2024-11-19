extends BaseActor

@onready var state_machine = $StateMachine
@onready var sprite_player = $AnimatedSprite2D

func _ready():
	state_machine.start()
	sprite_player.play()
	
func move(v):
	velocity = v
	move_and_slide()
	emit_signal("position_changed", position)
	
func set_sprite(sprite):
	if sprite_player.animation == sprite:
		return
	sprite_player.animation = sprite
