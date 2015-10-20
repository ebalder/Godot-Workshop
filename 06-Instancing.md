# Instancing

A Scene could grow unmanageable after certain size and complexity of the project, that's why Godot allows you to reuse Scenes inside of other Scenes. This practice is called Instancing.

There can be as many instances of a Scene as desired, and root-level properties of the Scene can be modified per-Instance.

The point of Instancing is for easing the architectural design of the project, instead of MVC patterns, the recommendation is to separate the game in elements more intuitively, so that parts can be identified not only by a programmer but by anyone.

![Separation](https://github.com/okamstudio/godot/wiki/images/openworld_instancing.png)

## Excercise 8

1. Make a scene
2. Make another scene
3. Instance one scene in the other

## Excercise 9

1. Do the same instancing, but by code, after some input, incrementally

