extends Node2D

signal continue_text

@onready var sprite =  $Marker2D/character
@onready var dia = $dialogue_Box

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Enter") && Global.has_dialogue:
		emit_signal("continue_text")

func _on_do_something() -> void:
	for i in 10:
		$white.color -= Color(0,0,0,0.1)
		await get_tree().create_timer(0.1).timeout
	$white.queue_free()

func _on_frog_pressed() -> void:
	diabox(0)

func _on_ghost_pressed() -> void:
	diabox(1)
	
func _on_jelly_pressed() -> void:
	diabox(4)

func _on_starry_pressed() -> void:
	diabox(3)
	
func _on_saturn_pressed() -> void:
	diabox(2)
	
func diabox(id):
	sprite.change(id)
	dia.show()
	dia.parse(dia.statements[id])
	dia.type()

	
