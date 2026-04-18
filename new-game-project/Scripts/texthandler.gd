extends ColorRect

@export var texts : Array[String] 

var lines: Array
var a = 0

var is_typing = false

signal do_something

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
			$dialogue.text = lines[a]
			a += 1
		is_typing = false
	else:
		$dialogue.text = ""
		get_parent_control().get_parent_control().hide()
		a = 0


func _on_continue_text() -> void:
	if is_typing == false:
		type()
