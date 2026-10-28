extends RigidBody3D

@export var materials : Array[Material]

func toggle_rims(toggle):
	for material in materials:
		material.set_shader_parameter("Rim",toggle)
