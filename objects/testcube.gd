extends Interactable3D

@onready var mesh_instance: MeshInstance3D = $MeshInstance3D

func _ready():
	hover_enter.connect(on_hover_enter)
	hover_exit.connect(on_hover_exit)

func on_hover_enter():
	var material := mesh_instance.mesh.surface_get_material(0)
	material.albedo_color = Color(1, 0, 0)

func on_hover_exit():
	var material := mesh_instance.mesh.surface_get_material(0)
	material.albedo_color = Color(1, 1, 1)
	