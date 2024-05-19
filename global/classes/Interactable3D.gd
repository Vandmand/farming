class_name Interactable3D
extends StaticBody3D

var is_hovering = false
signal hover_enter
signal hover_exit

func mouse_enter():
		is_hovering = true
		emit_signal("hover_enter")

func mouse_exit():
		is_hovering = false
		emit_signal("hover_exit")