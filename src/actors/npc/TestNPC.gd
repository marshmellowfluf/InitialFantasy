extends BaseActor

@onready var state_machine = $StateMachine

func _ready():
	state_machine.start()
	sprite_player.play()
	
