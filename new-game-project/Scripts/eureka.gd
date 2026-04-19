extends Button

func _on_dia_box_hidden() -> void:
	show()

func _on_dia_box_visibility_changed() -> void:
	hide()
	
func _on_pressed() -> void:
	var box = get_tree().root.find_child("dialogue_Box", true, false)
	box.show()
