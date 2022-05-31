extends HingeJoint

func _ready():
	get_parent().get_node("body").joints.append(self)
