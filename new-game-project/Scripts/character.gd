extends Sprite2D

@export var characters : Array[String]

@onready var left = $left
@onready var right = $right

func _on_charac_change(id: Variant, lr: Variant) -> void:
	texture = load(characters[str_to_var(id)])
	if lr == "l":
		position = left.position
	else:
		position = right.position
