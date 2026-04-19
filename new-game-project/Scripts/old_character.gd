extends Sprite2D

@export var characters : Array[String]

func change(id: Variant) -> void:
	var pos = get_parent()
	if id is String:
		id = str_to_var(id)
	texture = load(characters[id])
	global_position = pos.global_position
	show()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Enter") && is_visible_in_tree():
		hide()
