extends ColorRect

@export var texts : Array[String] 
@export var statements : Array[String]

var lines: Array
var a = 0

var is_typing = false

signal do_something
signal charac_change(id)

func _ready() -> void:
	parse(texts[0])
	type()

func parse(textfile):
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
		else:
			lines[a] = contains(lines[a])
			$dialogue.text = lines[a]
			a += 1
		is_typing = false
	else:
		Global.has_dialogue = false
		$dialogue.text = ""
		hide()
		a = 0

func _on_continue_text() -> void:
	if is_typing == false && Global.has_dialogue:
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
