extends RigidBody

export var max_force = 50

var joints = []
var force=0



func _physics_process(delta):
	
	
	if Input.is_action_pressed("throttle"):
		force=lerp(force,max_force,0.002)
		apply_central_impulse(global_transform.basis.x*-force)
	elif Input.is_action_pressed("reverse"):
		force=lerp(force,max_force,0.002)
		apply_central_impulse(global_transform.basis.x*force)
	else:
		force=lerp(force,0,0.5)
	
	
	
	
	if Input.is_action_just_pressed("brake"):
		force=lerp(force,0,0.8)
		for i in joints:
			i.set("motor/enable",true)
	if Input.is_action_just_released("brake"):
		for i in joints:
			i.set("motor/enable",false)
