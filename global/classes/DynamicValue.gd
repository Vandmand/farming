class_name DynamicValue

extends Object

signal value_changed

var value: Variant:
	get:
		return value
	set(new_val):
		value = new_val
		emit_signal('value_changed')

func _get(_property):
	return value

func _init(init_val):
	value = init_val