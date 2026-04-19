extends ColorRect

@export var names : Array[String]

func _on_charac_change(id: Variant) -> void:
	$name.text = names[str_to_var(id)]
