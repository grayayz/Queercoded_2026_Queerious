extends ColorRect

@export var texts : Array[String] 

var lines: Array
var a = 0

var is_typing = false

signal do_something
signal charac_change(id, lr)


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
		is_typing = true
		if lines[a] == "*":
			emit_signal("do_something")
			await get_tree().create_timer(1)
			a += 1
			type()
		else:
			lines[a] = contains(lines[a])
			$dialogue.text = lines[a]
			a += 1
		is_typing = false
	else:
		$dialogue.text = ""
		hide()
		a = 0

func _on_continue_text() -> void:
	if is_typing == false:
		type()
		
func contains(line):
	if line[0] == "/":
		emit_signal("charac_change", line[1], line[2])
		var gather: String = ""
		for i in range(3, len(line)):
			gather += line[i]
		return gather
		
		
	else:
		return line
