extends Node2D

var the_game = load("res://scene_1.tscn")

func _on_button_pressed() -> void:
	$TitleScreen/Circle.queue_free()
	for i in 15:
		$TitleScreen.modulate.a -= 25
		get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(the_game)
