extends Control

var text = "res://Text/prompt.txt"
var wrong = "res://Text/wrong.txt"

func _on_eureka_pressed() -> void:
	show()
	Global.detective = true
	var box = get_tree().root.find_child("dialogue_Box", true, false)
	box.parse(text)
	box.type()
	box.a = 0

func _on_wrong_pressed() -> void:
	var box = get_tree().root.find_child("dialogue_Box", true, false)
	Global.detective = false
	box.parse(wrong)
	box.type()
	hide()

func _on_right_pressed() -> void:
	pass # Replace with function body.
