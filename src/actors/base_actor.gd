extends Node2D

@export var sprite : SpriteFrames
@export var collider : Shape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Body/CollisionBox.shape = collider
	$Sprite.sprite_frames = sprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
