# Scripts

A Script is (did you guess?) a type of Resource with a special characteristic: it can extend from any other class available in the engine.

## GDScript

(GDScript)[https://github.com/okamstudio/godot/wiki/gdscript] is the scripting language of Godot. It's dynamically typed and its sintax is mostly borrowed from Python.

## Callbacks

Nodes have different callbacks that are fired after certain actions have been executed. These functions are empty by default and can be overriden with our own code:

```
func _enter_tree():
	# When the node enters the _Scene Tree_, it become acive and this function is called. Children nodes have not entered the active scene yet. In general, it's better to use _ready() for most cases.

func _ready():
	# This function is called after _enter_tree, but it ensures that all children nodes have also entered the _Scene Tree_, and became active.

func _exit_tree():
	# When the node exists the _Scene Tree_, this function is called. Children nodes have all exited the _Scene Tree_  at this point and all became inactive.

func _process(delta):
	# When set_process() is enabled, this is called every frame

func _fixed_process(delta):
	# When set_fixed_process() is enabled, this is called every physics frame

func _paused():
	#Called when game is paused, after this call, the node will not receive any more process callbacks

func _unpaused():
	#Called when game is unpaused  
```

In the case of the _process and _fixe_process functions, we'll need to indicate that we want to override them, we can do so by calling `set_process(true)` and  `set_fixed_process(true)` respectively. 


## Exercise 6

Create a Script for the Pong scene (on the root node), you will start with someting like this:
```
extends Node2D

func _ready():
    pass
```

Initialize some member variables:
```
var screen_size
var pad_size

var ball_speed = 80
var direction = Vector2(-1,0)

const PAD_SPEED = 150
```

The ready function will assign some initial values and activate the _process callback:
```
func _ready():
	screen_size = get_viewport_rect().size
	pad_size = get_node("left").get_texture().get_size()
	set_process(true)
```

Start the _process function by getting the current state of the values that need to be recalculated:
```
func _process(delta):
	var ball_pos = get_node("ball").get_pos()
	var left_rect = Rect2( get_node("left").get_pos() - pad_size/2, pad_size )
	var right_rect = Rect2( get_node("right").get_pos() - pad_size/2, pad_size )
```

Next, calculate the next position of the ball and ensure that the direction is going to be mirrored when it touches the floor and roof:
```
ball_pos+=direction*ball_speed*delta
if ( (ball_pos.y<0 and direction.y <0) or (ball_pos.y>screen_size.y and direction.y>0)):
	direction.y = -direction.y
```

If the ball touches one pad, switch the direction and increase the speed a little, if it goes out of the room, start again:
```
if ( (left_rect.has_point(ball_pos) and direction.x < 0) or (right_rect.has_point(ball_pos) and direction.x > 0)):
	direction.x=-direction.x
	ball_speed*=1.1
	direction.y=randf()*2.0-1
	direction = direction.normalized()

if (ball_pos.x<0 or ball_pos.x>screen_size.x):
	ball_pos=screen_size*0.5 #ball goes to screen center
	ball_speed=80
	direction=Vector2(-1,0)
```

Finally, update the ball position:
```
get_node("ball").set_pos(ball_pos)
```
