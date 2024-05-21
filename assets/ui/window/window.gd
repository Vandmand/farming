extends PanelContainer

@onready var content_container: Node = $"MarginContainer/HBoxContainer/ContentContainer"
var content: Node
var dragging := false

func set_content(new_content: Node):
	content = new_content

func _ready():
	content_container.add_child(content)

func _input(event):
	if !(event is InputEventMouseMotion):
		return
	if !dragging:
		return
		
	position += event.relative

func _on_close_pressed():
	content_container.remove_child(content)
	queue_free()

func _on_drag_strip_button_down():
	dragging = true

func _on_drag_strip_button_up():
	dragging = false
