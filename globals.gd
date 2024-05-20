extends Node

var globals = {}

func add_global(key, value):
	if (globals.get(key) == null):
		return false
	set_global(key, value)

func set_global(key, value):
	globals[key] = value

func remove_global(key):
	globals[key] = null

func get_global(key):
	return globals[key]
