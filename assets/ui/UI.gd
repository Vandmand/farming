extends CanvasLayer

@onready var window_scene := preload ("./window/window.tscn")
@onready var player = $"/root/Player"

func _ready():
	var money_label: Label = $"MarginContainer2/PanelContainer/HBoxContainer/MarginContainer2/Money"
	money_label.text = str(player.money.value)
	print(player.money)
	player.money.connect('value_changed', func(): money_label.text=str(player.money.value))

func create_window(node: Node):
	var window := window_scene.instantiate()
	window.set_content(node)
	window.position = Vector2(100, 100)
	self.add_child(window)
