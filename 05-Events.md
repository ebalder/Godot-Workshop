# Events

InputEvent is a data type that can contain diffent types of inputs. It travels through the scene tree and can be received as needed. This happens in the following order:

1. Next child Viewport (starting from root)
2. Next Control Node (GUI)
3. Next Control Node child
4. Next Node
5. Cast a Ray from the viewport at the current position of the cursor
6. Repeat from 1

## Event Types

1. (InputEvent)[https://github.com/okamstudio/godot/wiki/class_inputevent]
2. (InputEventKey)[https://github.com/okamstudio/godot/wiki/class_inputeventkey]
3. (InputEventMouseButton)[https://github.com/okamstudio/godot/wiki/class_inputeventmousebutton]
4. (InputEventMouseMotion)[https://github.com/okamstudio/godot/wiki/class_inputeventmousemotion]
5. (InputEventScreenTouch)[https://github.com/okamstudio/godot/wiki/class_inputeventscreentouch]
6. (InputEventScreenDrag)[https://github.com/okamstudio/godot/wiki/class_inputeventscreendrag]
7. (InputEventAction)[https://github.com/okamstudio/godot/wiki/class_inputeventaction]

## Actions

An InputEvent may be associated to an Action, this helps abstract specific inputs to their functions and ease support for different devices and key mappings.

Actions can be set from the project configuration.

## Exercise 7

Currently, the Pong game doesn't have code that makes the pads move, we'll fix that soon.

1. Set up the actions for moving each of the pads up and down, you will need 4 actions.
2. Append to the _process function the code that evaluates if Input corresponds to any of the actions previously set and moves the pads to the corresponding directions.
```
var left_pos = get_node("left").get_pos()

if (left_pos.y > 0 and Input.is_action_pressed("left_up")):
	left_pos.y-=PAD_SPEED*delta
if (left_pos.y < screen_size.y and Input.is_action_pressed("left_down")):
	left_pos.y+=PAD_SPEED*delta

get_node("left").set_pos(left_pos)

var right_pos = get_node("right").get_pos()

if (right_pos.y > 0 and Input.is_action_pressed("right_move_up")):
	right_pos.y+=-PAD_SPEED*delta
if (right_pos.y < screen_size.y and Input.is_action_pressed("right_move_down")):
	right_pos.y+=PAD_SPEED*delta

get_node("right").set_pos(right_pos)
```
