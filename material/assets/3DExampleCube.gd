extends RigidBody

var up = Vector3(0, 1, 0)
var origin = Vector3(0, 0, 0)
var jumping = false
var facing = Vector3(0, 0, -1)

var floorID
var space
var velocity

var MAX_WALK_SPEED = 4

func _input(ev):
	if(ev.type == InputEvent.KEY):
		if(ev.is_action('right_up')):
			walk(Vector3(0, 0, -1))
		elif(ev.is_action('right_down')):
			walk(Vector3(0, 0, 1))
		elif(ev.is_action('jump') and !jumping):
			jump()

func _body_enter_shape(bodyID, body, shape, localShape):
	if bodyID == floorID:
		jumping = false
	elif body.has_method('collide'):
		body.collide(self, space)


func jump():
	apply_impulse(origin, up*4)
	jumping = true

func walk(dir):
	velocity = get_linear_velocity()
	apply_impulse(origin, dir)
	
	if velocity.length() > MAX_WALK_SPEED:
		set_linear_velocity(velocity.normalized()*MAX_WALK_SPEED)

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	set_contact_monitor(true)
	connect('body_enter_shape', self, "_body_enter_shape")
	
	floorID = get_node('/root/Spatial/StaticBody').get_instance_ID()
	space = get_world().get_direct_space_state()
	
	