extends Interactable3D

@onready var mesh_instance: MeshInstance3D = $MeshInstance3D
@onready var outline_shader := preload ("res://shaders/outline.gdshader")
@onready var UI = $"/root/Node3D/Ui"

var inventory: Node;

func _ready():

	# connect signals
	hover_enter.connect(on_hover_enter)
	hover_exit.connect(on_hover_exit)
	clicked.connect(on_clicked)

	var inventory_instance := preload ("res://assets/ui/inventory/inventory.tscn")
	inventory = inventory_instance.instantiate()
	inventory.inventory_size = 4

	# duplicate mesh
	mesh_instance.set_surface_override_material(0, mesh_instance.mesh.surface_get_material(0).duplicate())

func on_hover_enter():
	var material := mesh_instance.get_surface_override_material(0)
	var outline_material := ShaderMaterial.new()
	outline_material.shader = outline_shader
	material.next_pass = outline_material
	material.albedo_color = Color(1, 0, 1)

func on_hover_exit():
	var material := mesh_instance.get_surface_override_material(0)
	material.albedo_color = Color(1, 1, 1)

func on_clicked(event: InputEventMouseButton):
	if (event.button_index == MouseButtonKeys.LEFT_CLICK):
		UI.create_window(inventory)
