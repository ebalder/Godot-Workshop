extends StaticBody

var shape
var marginUp = Vector3(0, 0.2, 0)
var collider

func _input(ev):
	if ev.is_action('right_up') or ev.is_action('right_down'):
		set_process_input(false)
		collider.set_axis_lock(0)
	if ev.is_action('right_up'):
		collider.apply_impulse(collider.get_translation() + Vector3(0, -0.2, 0), collider.get_translation() + Vector3(0, 4.5, -0.2))

func collide(_collider, space):
	collider = _collider
	if collider.jumping:
		var rayXZ = collider.get_translation() + collider.facing/5
		var ledgeFloor = space.intersect_ray(rayXZ + marginUp, rayXZ - marginUp * 3, [collider])
		if !ledgeFloor.empty():
			collider.set_axis_lock(2)
			set_process_input(true)
			

func _ready():
	shape = get_instance_ID()