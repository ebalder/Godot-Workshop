extends Button

var scene = load('res://Instancing_Child.scn')
var root

var pos = 0

func _pressed():
	var instance = scene.instance()
	instance.set_pos(Vector2(pos, pos))
	pos += 10
	root.add_child(instance)
	
func _ready():
	root = get_node('/root')