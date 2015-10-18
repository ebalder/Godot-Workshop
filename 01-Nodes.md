# Nodes

The assets of a Godot project are organized as a tree of nodes, where every node can have a parent and a varying number of children. A Node is a type of object that has:
- A name
- Editable properties
- A callback function to execute every frame

A Node is basically a datatype that has paramers and behavior. Most of the other extend from Node, and we can also make our own.

## Scenes

A scene is a composition of nodes. A scene has these features:
- Has exactly one root node
- Can be saved to disk and loaded back
- Can be instanced
- Running a scene means running the game
- There can be several scenes in a project
- One of them must load first in order to run the game

Godot is a -scene editor-; all of it revolves around the concept of editing scenes and the nodes that compose it.

## Excercise 1

1. Create a new project
2. Add a new node 
3. Sort through the properties of the node
4. Run the scene
5. Save the scene and try to run it again
6. Configure the project to run the current scene
