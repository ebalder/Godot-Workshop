# Signals

Signals can be emmited from a Node and set to trigger a given function of any script instance. It's meant to make communication among Instances easier to manage.

## Exercise 10

- Make a button
- Make a label
- Add a script to the label
```
func button_pressed():
	set_text('Button Pressed!')
```

- Connect the pressed action of the button to the button_pressed function of the label 

## Exercise 11

You can connect signals by code too:

```
func _ready():
	get_node('../button').connect('pressed', self, 'button_pressed')

func button_pressed():
	set_text('Button Pressed!')
```

