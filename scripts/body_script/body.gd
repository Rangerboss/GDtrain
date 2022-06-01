extends RigidBody

export var max_force = 50

var joints = []
var force=0
var is_braking = false


func _physics_process(delta):
	
	
	if Input.is_action_pressed("throttle") and not is_braking:
		force=lerp(force,max_force,0.005)
		apply_central_impulse(global_transform.basis.x*-force)
	elif Input.is_action_pressed("reverse") and not is_braking:
		force=lerp(force,max_force,0.005)
		apply_central_impulse(global_transform.basis.x*force)
	else:
		force=lerp(force,0,0.01)
	
	
	
	
	if Input.is_action_just_pressed("brake"):
		is_braking=true
		force=lerp(force,0,0.8)
		for i in joints:
			i.set("motor/enable",true)
	if Input.is_action_just_released("brake"):
		is_braking=false
		for i in joints:
			i.set("motor/enable",false)

