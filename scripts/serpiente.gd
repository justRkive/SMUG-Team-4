extends CharacterBody3D


const aceleracion_angular=4
var rotacion=1


func _physics_process(delta):
	if Input.is_action_just_pressed("izquierda"):
		rotacion+=1
	if Input.is_action_just_pressed("derecha"):
		rotacion-=1
	print(rotacion)
	$".".rotation.y=lerp_angle($".".rotation.y,deg_to_rad(90*rotacion),delta*aceleracion_angular)
