extends Camera3D

@export var CAMERA_SPEED = 10
@export var CAMERA_ROTATION_SPEED = 2

var prev_mouse_collider: Dictionary = {};

func movement(delta) -> void:
	var projected_basis = Basis(transform.basis)
	projected_basis.z *= Vector3(1, 0, 1)
	projected_basis.x *= Vector3(1, 0, 1)

	var forward = projected_basis.z * (Input.get_action_raw_strength("camera_back") - Input.get_action_raw_strength("camera_forward"))
	var side = projected_basis.x * (Input.get_action_raw_strength("camera_right") - Input.get_action_raw_strength("camera_left"))

	var dir = (forward + side).normalized()

	var new_rotation = Input.get_action_raw_strength("camera_rotate_clockwise") - Input.get_action_raw_strength("camera_rotate_counterclockwise")
	var tilt = Input.get_action_raw_strength("camera_tilt_up") - Input.get_action_raw_strength("camera_tilt_down")

	#Move the camera
	position += dir * CAMERA_SPEED * delta
	rotate(Vector3(0, -1, 0), new_rotation * CAMERA_ROTATION_SPEED * delta)
	rotate(transform.basis.x, tilt * CAMERA_ROTATION_SPEED * delta)

func get_mouse_collision() -> Dictionary:
	var mouse_position := get_viewport().get_mouse_position()
	var mouse_origin := project_ray_origin(mouse_position)
	var mouse_direction := project_ray_normal(mouse_position)

	var end = far * mouse_direction + mouse_origin

	var space_state := get_world_3d().direct_space_state
	var query := PhysicsRayQueryParameters3D.create(mouse_origin, end)
	return space_state.intersect_ray(query)

func mouse():
	var mouse_collider := get_mouse_collision()

	if mouse_collider.get('collider_id') == prev_mouse_collider.get('collider_id'):
		return

	# Handle enter collision
	if mouse_collider.get("collider") is Interactable3D:
		mouse_collider.get("collider").mouse_enter()

	# Handle exit collison
	if prev_mouse_collider.get("collider") is Interactable3D:
		prev_mouse_collider.get("collider").mouse_exit()
	
	prev_mouse_collider = mouse_collider

func _input(event):
	if (event is InputEventMouseButton) and event.pressed:
		if prev_mouse_collider.get("collider") is Interactable3D:
			prev_mouse_collider.get("collider").emit_signal("clicked", event)

func _process(delta):
	movement(delta)
	mouse()
