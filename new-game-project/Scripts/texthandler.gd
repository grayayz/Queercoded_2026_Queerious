extends Control

@export var texts : Array[String] 
@export var statements : Array[String]
@export var boxes : Array[PackedScene]

var full_line = ""
var char_index = 0
var typing_speed = 0.02
var lines: Array
@export var a = 0

var is_typing = false

signal do_something
signal charac_change(id)

func _ready() -> void:
	parse(texts[0])
	type()

func parse(textfile):
	a = 0
	var file = FileAccess.open(textfile, FileAccess.READ)
	var content = file.get_line()
	var array: Array
	while !content.is_empty():
		array.append(content)
		content = file.get_line()
	lines = array
	
func type():
	if a < lines.size():
		Global.has_dialogue = true
		is_typing = true
		
		if lines[a] == "*":
			emit_signal("do_something")
			a += 1
			type()
			return
		
		lines[a] = contains(lines[a])
		full_line = lines[a]
		char_index = 0
		$dialogue.text = ""
		
		await typewriter()
		
		a += 1
		is_typing = false
	else:
		Global.has_dialogue = false
		$dialogue.text = ""
		hide()
		a = 0

func _on_continue_text() -> void:
	
	# If still typing → SKIP
	if is_typing:
		is_typing = false
		$dialogue.text = full_line
		char_index = full_line.length()
		return
	
	type()

func contains(line):
	if line[0] == "|":
		emit_signal("charac_change", line[1])
		var gather: String = ""
		for i in range(2, len(line)):
			gather += line[i]
		return gather
	else:
		return line

func _on_charac_change(id: Variant) -> void:
	var children = get_children()
	for c in children:
		if c.is_in_group("diabox"):
			c.queue_free()
	var node = boxes[str_to_var(id)].instantiate()
	add_child(node)
	node.global_position = global_position
	node.owner = self
	$dialogue.move_to_front()

func typewriter():
	while char_index < full_line.length():	
		if not is_typing:
			$dialogue.text = full_line
			return
		$dialogue.text += full_line[char_index]
		char_index += 1
		await get_tree().create_timer(typing_speed).timeout
