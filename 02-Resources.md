# Resources

A Resource represents a data container, everything that can be saved to a file is a Resource. It's a datatype, which means we can set a resource as a property of a Node object.

Resources can be **external**, which means they're stored in a separated file. Resources that are stored within the same scene file are called **built-in**.

## The Reference Object

Resources extend from an Object called Reference, when a Resource is no longer used, it frees itself; that is, when the Node referencing the given Resource is removed.

## Excercise 2

1. Create a Node
2. Set a Resource property
3. Make that Resource external by saving it to a file
4. Make that Resource internal again by removing the path property

## Excercise 3

1. Create a Node called "sprite" and add the following code to the Scene.

```
func _ready():

	var res = load("res://robi.png") # resource is loaded when line is executed
	get_node("sprite").set_texture(res) 
	
```
