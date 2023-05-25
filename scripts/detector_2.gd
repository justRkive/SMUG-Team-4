extends RayCast3D

@onready var serpiente_2 = $"../serpiente2"
@export var colisiona=false
func _physics_process(delta):
	$".".position.x=serpiente_2.position.x
	$".".position.y=serpiente_2.position.y
	$".".position.z=serpiente_2.position.z
	if is_colliding():
		colisiona=true

	else:
		colisiona=false

