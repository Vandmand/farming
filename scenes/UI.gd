extends Control

func open_window(instance: String):
	var window = load(instance).instanciate()
	add_child(window)
	window.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
