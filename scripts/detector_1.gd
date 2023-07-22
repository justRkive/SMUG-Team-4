extends RayCast3D

@onready var serpiente = $"../serpiente"
@export var colisiona=false
func _physics_process(_delta):
	$".".position.x=serpiente.position.x
	$".".position.y=serpiente.position.y
	$".".position.z=serpiente.position.z
	if is_colliding():
		colisiona=true

	else:
		colisiona=false

