extends Control

var text = "res://Text/prompt.txt"
var wrong = "res://Text/wrong.txt"
@export var progress : String

@onready var right_side_button = $"../EUREKA"

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
	var box = get_tree().root.find_child("dialogue_Box", true, false)
	Global.detective = false
	box.parse(progress)
	box.type()
	hide()
	right_side_button.queue_free()
