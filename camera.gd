extends Camera3D

@export var raycast : RayCast3D

var object

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if raycast.is_colliding() and raycast.get_collider().is_in_group("grab"):
		object = raycast.get_collider()
		object.toggle_rims(true)
	elif object != null:
		object.toggle_rims(false)
		object = null
