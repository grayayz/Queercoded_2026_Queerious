extends Control

var text = "res://Text/prompt.txt"

func _on_eureka_pressed() -> void:
	show()
	Global.detective = true
	var box = get_tree().root.find_child("dialogue_Box", true, false)
	box.parse(text)
	box.type()
	
