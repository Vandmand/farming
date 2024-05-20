class_name Interactable3D
extends StaticBody3D

enum MouseButtonKeys {
	NONE,
	LEFT_CLICK,
	RIGHT_CLICK,
	MIDDLE_CLICK,
	SCROLL_UP,
	SCROLL_DOWN,
}

var is_hovering = false
signal hover_enter
signal hover_exit
signal clicked

func mouse_enter():
	is_hovering = true
	emit_signal("hover_enter")

func mouse_exit():
	is_hovering = false
	emit_signal("hover_exit")
