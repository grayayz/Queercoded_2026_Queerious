extends Sprite2D

@export var characters : Array[String]

@onready var pos = $Marker2D

func change(id: Variant) -> void:
	if id is String:
		id = str_to_var(id)
	texture = load(characters[id])
	position = pos.global_position
