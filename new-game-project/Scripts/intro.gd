extends Node2D

signal continue_text

@onready var dia = $dialogue_Box

@export var next : PackedScene

func _ready() -> void:
	Global.detective = false
	Global.has_dialogue = true
	Global.type = -1
	
func _input(event: InputEvent) -> void:
	if Global.detective == false:
		if event.is_action_pressed("Enter") && Global.has_dialogue:
			emit_signal("continue_text")

func _on_do_something() -> void:
	for i in 10:
		$white.color -= Color(0,0,0,0.1)
		await get_tree().create_timer(0.1).timeout
	$white.z_index = -3

func _on_frog_pressed() -> void:
	diabox(0, Global.type)

func _on_ghost_pressed() -> void:
	diabox(1, Global.type)
	
func _on_jelly_pressed() -> void:
	diabox(4, Global.type)

func _on_starry_pressed() -> void:
	diabox(3, Global.type)
	
func _on_jupiter_pressed() -> void:
	diabox(2, Global.type)
	
func diabox(id, type):
	if type != -1:
		dia.a = 0
		dia.show()
		if type == 0:
			dia.parse(dia.statements[id])
		else:
			dia.parse(dia.bonus[id])
		dia.type()

func _on_next_pressed() -> void:
	$white.z_index = 1
	for i in 10:
		$white.color += Color(0,0,0,0.1)
		await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_packed(next)
