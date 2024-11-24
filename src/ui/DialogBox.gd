extends NinePatchRect

class_name DialogBox

@onready var NAMETAG = $NameLabel
@onready var TEXT = $DialogText
@onready var AP = $AnimationPlayer
@onready var NEXT = $NextArrowSprite

var dialog : DialogScript
var line = 0

const NEXT_ARROW = Rect2(0, 0, 32, 16)
const STOP_ARROW = Rect2(0, 16, 32, 16)

# warning-ignore:unused_signal
signal dialog_started
# warning-ignore:unused_signal
signal dialog_ended

func _ready():
	# dialog = load("res://src/resources/testdialog.tres")
	hide()
	
func show_dialog():
	TEXT.text = dialog.text[0]
	NAMETAG.text = dialog.speaker
	line = 0
	NEXT.texture.region = NEXT_ARROW
	AP.play("appear")

func _input(event):
	if event.is_action_pressed("ui_interact"):
		match AP.assigned_animation:
			"show_text":
				AP.play("wait")
			"wait":
				line += 1
				if line < dialog.text.size():
					TEXT.text = dialog.text[line]
					if line ==  dialog.text.size() - 1:
						NEXT.texture.region = STOP_ARROW
					AP.play("show_text")
				else:
					AP.play("disappear")
