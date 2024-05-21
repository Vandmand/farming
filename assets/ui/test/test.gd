extends MarginContainer

@onready var player = $"/root/Player"

func _on_button_pressed():
	player.money.value -= 20
