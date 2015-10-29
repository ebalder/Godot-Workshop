extends StaticBody

var marginUp = Vector3(0, 0.5, 0)
var collider
var ledgeShape

func _input(ev):
	if (ev.is_action('right_up') or ev.is_action('right_down')) and ev.is_pressed():
		set_process_input(false)
		collider.set_axis_lock(0)
	if ev.is_action('right_up') and ev.is_pressed():
		collider.apply_impulse(collider.get_translation() + Vector3(0, -0.3, 0.1), collider.get_translation() + Vector3(0, 5, -0.5))

func collide(_collider, space):
	collider = _collider
	if collider.jumping:
		var rayXZ = collider.get_translation() + collider.facing/1.8
		var ledgeFloor = space.intersect_ray(rayXZ + marginUp, rayXZ - marginUp * 2, [collider.get_shape(0), ledgeShape])
		if !ledgeFloor.empty():
			print(ledgeFloor)
			collider.set_axis_lock(2)
			set_process_input(true)
			
func _ready():
	ledgeShape = get_shape(0)
