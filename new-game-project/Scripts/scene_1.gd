extends Node2D

var the_game = load("res://intro.tscn")

func _on_button_pressed() -> void:
	$TitleScreen/Button.queue_free()
	for me in 10:
		$TitleScreen.modulate -= Color(0, 0, 0, 0.15)
		await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_packed(the_game)
