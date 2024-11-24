extends Node

@export var dialogscript : DialogScript

var DialogTemplate = preload("res://src/ui/DialogBox.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if owner.has_node("DialogNode"):
		dialogscript = owner.get_node("DialogNode").dialog

func start_dialog():
	var root = get_tree().get_current_scene()
	var ui = root.ui
	var scene = DialogTemplate.instantiate()
	scene.dialog = dialogscript
	ui.add_child(scene)
	scene.connect("dialog_started", root.pause_processing.bind(true))
	scene.connect("dialog_ended", root.pause_processing.bind(false))
	scene.show_dialog()
