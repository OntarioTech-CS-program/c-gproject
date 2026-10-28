extends Node

@export var materials : Array[Material]
@export var specular_materials : Array[Material]
@export var materials_xray : Array[Material]
@export var specular_materials_xray : Array[Material]
@export var shader : VisualShader
@export var shader_ambient_disabled : VisualShader
@export var shader_xray : VisualShader
@export var shader_ambient_disabled_xray : VisualShader
var ambient = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("1"):
		for material in materials:
			material.set_shader_parameter("albedo",!material.get_shader_parameter("albedo"))
		for material in materials_xray:
			material.set_shader_parameter("albedo",!material.get_shader_parameter("albedo"))
	if Input.is_action_just_pressed("2"):
		for material in materials_xray:
			material.set_shader_parameter("diffuse",!material.get_shader_parameter("diffuse"))
		for material in materials:
			material.set_shader_parameter("diffuse",!material.get_shader_parameter("diffuse"))
	if Input.is_action_just_pressed("3"):
		ambient = !ambient
		for material in materials:
			if ambient:
				material.shader = shader
			else:
				material.shader = shader_ambient_disabled
		for material in materials_xray:
			if ambient:
				material.shader = shader_xray
			else:
				material.shader = shader_ambient_disabled_xray
	if Input.is_action_just_pressed("4"):
		for material in specular_materials_xray:
			material.set_shader_parameter("specular",!material.get_shader_parameter("specular"))
		for material in specular_materials:
			material.set_shader_parameter("specular",!material.get_shader_parameter("specular"))
	if Input.is_action_just_pressed("5"):
		for material in materials:
			material.set_shader_parameter("Wrap",!material.get_shader_parameter("Wrap"))
		for material in materials_xray:
			material.set_shader_parameter("Wrap",!material.get_shader_parameter("Wrap"))
