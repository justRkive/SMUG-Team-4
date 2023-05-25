extends CharacterBody3D
var nueva_posicion =Vector3()
var movimiento =false
const velocidad= 2
var rotacion=2
@onready var animation_player = $AnimationPlayer
var aceleracion_angular=10
@export var movimientos_disponibles=0

@onready var detector_derecha_2 = $"../detector_derecha_2"
@onready var detector_abajo_2 = $"../detector_abajo_2"
@onready var detector_izquierda_2 = $"../detector_izquierda_2"
@onready var detector_arriba_2 = $"../detector_arriba_2"
@onready var camera_3d = $"../SubViewportContainer/SubViewport/Camera3D"

signal ronda

	
func mover_a(delta,objetivo):
	if movimiento:
		$".".global_position = $".".global_position.move_toward(objetivo, delta*velocidad)
		
	if $".".global_position==objetivo:
		movimiento=false
		movimientos_disponibles-=1
		if movimientos_disponibles==0:
			emit_signal("ronda")
		print($".".global_position)


func _physics_process(delta):
	
	if camera_3d.mapa==1:
		if Input.is_action_just_pressed("arriba") and movimiento==false and detector_arriba_2.colisiona==false and movimientos_disponibles>0:

			rotacion=3
			movimiento=true
			nueva_posicion= Vector3($".".position.x,$".".position.y,$".".position.z-0.95)
		if Input.is_action_just_pressed("abajo") and movimiento==false and detector_abajo_2.colisiona==false and movimientos_disponibles>0:

			rotacion=1
			movimiento=true
			nueva_posicion= Vector3($".".position.x,$".".position.y,$".".position.z+0.95)
		if Input.is_action_just_pressed("derecha") and movimiento==false and detector_derecha_2.colisiona==false and movimientos_disponibles>0:

			rotacion=2
			movimiento=true
			nueva_posicion= Vector3($".".position.x+0.95,$".".position.y,$".".position.z)
		if Input.is_action_just_pressed("izquierda") and movimiento==false and detector_izquierda_2.colisiona==false and movimientos_disponibles>0:

			rotacion=4
			movimiento=true
			nueva_posicion= Vector3($".".position.x-0.95,$".".position.y,$".".position.z)		
			
	if camera_3d.mapa==0 and rotacion==1:
		if Input.is_action_just_pressed("arriba") and movimiento==false and detector_abajo_2.colisiona==false and movimientos_disponibles>0:
			rotacion=1
			movimiento=true
			nueva_posicion= Vector3($".".position.x,$".".position.y,$".".position.z+0.95)	
		if Input.is_action_just_pressed("abajo") and movimiento==false and detector_arriba_2.colisiona==false and movimientos_disponibles>0:
			rotacion=3
			movimiento=true
			nueva_posicion= Vector3($".".position.x,$".".position.y,$".".position.z-0.95)
		if Input.is_action_just_pressed("derecha") and movimiento==false and detector_izquierda_2.colisiona==false and movimientos_disponibles>0:

			rotacion=4
			movimiento=true
			nueva_posicion= Vector3($".".position.x-0.95,$".".position.y,$".".position.z)			
		if Input.is_action_just_pressed("izquierda") and movimiento==false and detector_derecha_2.colisiona==false and movimientos_disponibles>0:

			rotacion=2
			movimiento=true
			nueva_posicion= Vector3($".".position.x+0.95,$".".position.y,$".".position.z)	
			
	if camera_3d.mapa==0 and rotacion==2:
		if Input.is_action_just_pressed("arriba") and movimiento==false and detector_derecha_2.colisiona==false and movimientos_disponibles>0:

			rotacion=2
			movimiento=true
			nueva_posicion= Vector3($".".position.x+0.95,$".".position.y,$".".position.z)
		if Input.is_action_just_pressed("derecha") and movimiento==false and detector_abajo_2.colisiona==false and movimientos_disponibles>0:

			rotacion=1
			movimiento=true
			nueva_posicion= Vector3($".".position.x,$".".position.y,$".".position.z+0.95)
		if Input.is_action_just_pressed("izquierda") and movimiento==false and detector_arriba_2.colisiona==false and movimientos_disponibles>0:

			rotacion=3
			movimiento=true
			nueva_posicion= Vector3($".".position.x,$".".position.y,$".".position.z-0.95)
		if Input.is_action_just_pressed("abajo") and movimiento==false and detector_izquierda_2.colisiona==false and movimientos_disponibles>0:

			rotacion=4
			movimiento=true
			nueva_posicion= Vector3($".".position.x-0.95,$".".position.y,$".".position.z)
	if camera_3d.mapa==0 and rotacion==3:
		if Input.is_action_just_pressed("arriba") and movimiento==false and detector_arriba_2.colisiona==false and movimientos_disponibles>0:

			rotacion=3
			movimiento=true
			nueva_posicion= Vector3($".".position.x,$".".position.y,$".".position.z-0.95)
		if Input.is_action_just_pressed("abajo") and movimiento==false and detector_abajo_2.colisiona==false and movimientos_disponibles>0:

			rotacion=1
			movimiento=true
			nueva_posicion= Vector3($".".position.x,$".".position.y,$".".position.z+0.95)
		if Input.is_action_just_pressed("derecha") and movimiento==false and detector_derecha_2.colisiona==false and movimientos_disponibles>0:

			rotacion=2
			movimiento=true
			nueva_posicion= Vector3($".".position.x+0.95,$".".position.y,$".".position.z)
		if Input.is_action_just_pressed("izquierda") and movimiento==false and detector_izquierda_2.colisiona==false and movimientos_disponibles>0:

			rotacion=4
			movimiento=true
			nueva_posicion= Vector3($".".position.x-0.95,$".".position.y,$".".position.z)	
	if camera_3d.mapa==0 and rotacion==4:
		if Input.is_action_just_pressed("arriba") and movimiento==false and detector_izquierda_2.colisiona==false and movimientos_disponibles>0:

			rotacion=4
			movimiento=true
			nueva_posicion= Vector3($".".position.x-0.95,$".".position.y,$".".position.z)		
		if Input.is_action_just_pressed("abajo") and movimiento==false and detector_derecha_2.colisiona==false and movimientos_disponibles>0:

			rotacion=2
			movimiento=true
			nueva_posicion= Vector3($".".position.x+0.95,$".".position.y,$".".position.z)	
		if Input.is_action_just_pressed("izquierda") and movimiento==false and detector_abajo_2.colisiona==false and movimientos_disponibles>0:

			rotacion=1
			movimiento=true
			nueva_posicion= Vector3($".".position.x,$".".position.y,$".".position.z+0.95)
		if Input.is_action_just_pressed("derecha") and movimiento==false and detector_arriba_2.colisiona==false and movimientos_disponibles>0:

			rotacion=3
			movimiento=true
			nueva_posicion= Vector3($".".position.x,$".".position.y,$".".position.z-0.95)
		
			
	if movimiento==true:	
		mover_a(delta,(nueva_posicion))	
		
	$".".rotation.y=lerp_angle($".".rotation.y,deg_to_rad(90*rotacion),delta*aceleracion_angular)
	
	if movimiento==true:
		animation_player.play("moverse")
	else:
		animation_player.pause()
