extends Node2D

signal continue_text

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Enter"):
		emit_signal("continue_text")


func _on_do_something() -> void:
	for i in 10:
		$white.color -= Color(0,0,0,0.1)
		await get_tree().create_timer(0.1).timeout
