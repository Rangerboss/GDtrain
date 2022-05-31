extends Spatial


export(float, 0.1, 1) var mouse_sensitivity : float = 0.2
export(float, -90, 0) var min_pitch : float = -70
export(float, 0, 90) var max_pitch : float = 50

onready var parent = get_parent()

func _ready() -> void:
	set_as_toplevel(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		rotation_degrees.x -= event.relative.y * mouse_sensitivity*1
		rotation_degrees.x = clamp(rotation_degrees.x, min_pitch, max_pitch)

	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("ui_accept"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float) -> void:
	global_transform.origin=parent.global_transform.origin



