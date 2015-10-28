# Instancing

A Scene could grow unmanageable after certain size and complexity of the project, that's why Godot allows you to reuse Scenes inside of other Scenes. This practice is called Instancing.

There can be as many instances of a Scene as desired, and root-level properties of the Scene can be modified per-Instance.

The point of Instancing is for easing the architectural design of the project, instead of MVC patterns, the recommendation is to separate the game in elements more intuitively, so that parts can be identified not only by a programmer but by anyone.

![Separation](https://github.com/okamstudio/godot/wiki/images/openworld_instancing.png)

## Excercise 8

- Make a Scene with a button that says "Parent", remember to have a Root Node
- Make another Scene with a button that says "Child"
- Instance the Child Scene in the Parent Scene, so that the resulting tree looks like this: 

![Separation](https://github.com/okamstudio/godot/wiki/images/instancing_tree.png)


## Excercise 9

- Add a script to the scene where you load the instance scene by code:
```
var scene = load("res://myscene.scn")
var root
var pos = 10

func _ready():
	root = get_node('/')
```

- Make a function that adds the instance to the tree when the Button is pressed, we will increase the x and y position each time:
```
func _pressed():
	var instance = scene.instance()
	instance.set_pos(pos, pos)
	pos += 10
	root.add_child(instance)
```
