extends Node

var type := "Resource"

func _ready():
	var name_label_node: Label = $"MarginContainer/AspectRatioContainer/VBoxContainer/Label"
	name_label_node.text = name