extends Node3D
var numero_elegido =0
@onready var serpiente_2 = $"../../../../serpiente2"
@onready var serpiente = $"../../../../serpiente"
var aceleracion_angular=101

@export var jugador_actual=0

func _physics_process(delta):
	if Input.is_action_just_pressed("espacio") and jugador_actual==0 and serpiente_2.movimientos_disponibles==0:

		randomize()
		numero_elegido=(randi()%6)
		print("el número elegido fue "+str(numero_elegido) )
		serpiente.movimientos_disponibles=numero_elegido+1
		await get_tree().create_timer(0.1).timeout
		jugador_actual=(jugador_actual+1)%2
	if Input.is_action_just_pressed("espacio") and jugador_actual==1 and serpiente.movimientos_disponibles==0:

		randomize()
		numero_elegido=(randi()%6)
		print("el número elegido fue "+str(numero_elegido) )
		serpiente_2.movimientos_disponibles=numero_elegido+1
		jugador_actual=(jugador_actual+1)%2		
	if numero_elegido==0:
		$".".rotation.x=lerp_angle($".".rotation.x,deg_to_rad(158),delta*aceleracion_angular)		
		$".".rotation.y=lerp_angle($".".rotation.y,deg_to_rad(146),delta*aceleracion_angular)
		$".".rotation.z=lerp_angle($".".rotation.z,deg_to_rad(-161),delta*aceleracion_angular)	
	if numero_elegido==1:
		$".".rotation.x=lerp_angle($".".rotation.x,deg_to_rad(169),delta*aceleracion_angular)		
		$".".rotation.y=lerp_angle($".".rotation.y,deg_to_rad(56),delta*aceleracion_angular)
		$".".rotation.z=lerp_angle($".".rotation.z,deg_to_rad(-184),delta*aceleracion_angular)	
	if numero_elegido==2:
		$".".rotation.x=lerp_angle($".".rotation.x,deg_to_rad(249),delta*aceleracion_angular)		
		$".".rotation.y=lerp_angle($".".rotation.y,deg_to_rad(56),delta*aceleracion_angular)
		$".".rotation.z=lerp_angle($".".rotation.z,deg_to_rad(-184),delta*aceleracion_angular)					
	if numero_elegido==3:
		$".".rotation.x=lerp_angle($".".rotation.x,deg_to_rad(-1.4),delta*aceleracion_angular)		
		$".".rotation.y=lerp_angle($".".rotation.y,deg_to_rad(150),delta*aceleracion_angular)
		$".".rotation.z=lerp_angle($".".rotation.z,deg_to_rad(-116),delta*aceleracion_angular)	
	if numero_elegido==4:
		$".".rotation.x=lerp_angle($".".rotation.x,deg_to_rad(192),delta*aceleracion_angular)		
		$".".rotation.y=lerp_angle($".".rotation.y,deg_to_rad(-123),delta*aceleracion_angular)
		$".".rotation.z=lerp_angle($".".rotation.z,deg_to_rad(-184),delta*aceleracion_angular)		
	if numero_elegido==5:
		$".".rotation.x=lerp_angle($".".rotation.x,deg_to_rad(181),delta*aceleracion_angular)		
		$".".rotation.y=lerp_angle($".".rotation.y,deg_to_rad(-33),delta*aceleracion_angular)
		$".".rotation.z=lerp_angle($".".rotation.z,deg_to_rad(-195),delta*aceleracion_angular)	
