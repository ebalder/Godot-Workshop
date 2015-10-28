extends RigidBody

func _input(ev):
	if(ev.type == InputEvent.KEY):
		if(ev.is_action('right_up')):
			set_linear_velocity(Vector3(0, 0, -3))
		elif(ev.is_action('right_down')):
			set_linear_velocity(Vector3(0, 0, 3))

func _integrate_forces(state):
	if(state)

func _ready():
	set_process_input(true)