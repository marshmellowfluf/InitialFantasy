extends Node


func interact():
	if owner.has_node("DialogNode"):
		owner.get_node("DialogNode").start_dialog()
