extends Node3D

@onready var fire_pos_2 = $"../fire_pos2".global_position
@onready var fire_pos_1 = $"../fire_pos1".global_position
@onready var fire_pos_3 = $"../fire_pos3".global_position
@onready var fire_pos_4 = $"../fire_pos4".global_position
@onready var fire_pos_5 = $"../fire_pos5".global_position
@onready var fire_pos_6 = $"../fire_pos6".global_position
@onready var fire_pos_7 = $"../fire_pos7".global_position
@onready var fire_pos_8 = $"../fire_pos8".global_position
@onready var water_pos_1 = $"../water_pos1".global_position
@onready var water_pos_2 = $"../water_pos2".global_position
@onready var water_pos_3 = $"../water_pos3".global_position
@onready var water_pos_4 = $"../water_pos4".global_position
@onready var water_pos_5 = $"../water_pos5".global_position
@onready var water_pos_8 = $"../water_pos8".global_position
@onready var water_pos_6 = $"../water_pos6".global_position
@onready var water_pos_7 = $"../water_pos7".global_position
@onready var thunder_pos_2 = $"../thunder_pos2".global_position
@onready var thunder_pos_1 = $"../thunder_pos1".global_position
@onready var thunder_pos_3 = $"../thunder_pos3".global_position
@onready var thunder_pos_6 = $"../thunder_pos6".global_position
@onready var thunder_pos_7 = $"../thunder_pos7".global_position
@onready var thunder_pos_4 = $"../thunder_pos4".global_position
@onready var thunder_pos_8 = $"../thunder_pos8".global_position
@onready var thunder_pos_5 = $"../thunder_pos5".global_position

@onready var carta_1 = $"../SubViewportContainer/Carta1"
@onready var carta_2 = $"../SubViewportContainer/Carta2"
@onready var carta_3 = $"../SubViewportContainer/Carta3"
@onready var carta_4 = $"../SubViewportContainer/Carta4"
@onready var carta_5 = $"../SubViewportContainer/Carta5"
@onready var carta_6 = $"../SubViewportContainer/Carta6"

@onready var serpiente = $"../serpiente"
@onready var serpiente_2 = $"../serpiente2"

@onready var trueno = $"../trueno"
@onready var trueno_2 = $"../trueno2"
@onready var trueno_3 = $"../trueno3"
@onready var trueno_4 = $"../trueno4"
@onready var fuego = $"../fuego"
@onready var fuego_2 = $"../fuego2"
@onready var fuego_3 = $"../fuego3"
@onready var fuego_4 = $"../fuego4"
@onready var agua = $"../agua"
@onready var agua_2 = $"../agua2"
@onready var agua_3 = $"../agua3"
@onready var agua_4 = $"../agua4"
@onready var dado = $"../SubViewportContainer/SubViewport/Camera3D/dado"

const pos1_x=107
const pos_y=336
const pos_out=-200
const pos2_x=1045
@export var casillas_fuego=PackedVector3Array ( )

@export var casillas_trueno= PackedVector3Array ( )

@export var casillas_agua=PackedVector3Array ( )


func _ready():
	var file=FileAccess.open("user://data.json",FileAccess.READ)
	var data=JSON.parse_string(file.get_as_text())
	if data.guardar_inicio==true:
		casillas_fuego.append_array([fire_pos_1,fire_pos_2,fire_pos_3,fire_pos_4,fire_pos_5,fire_pos_6,fire_pos_7,fire_pos_8])
		casillas_agua.append_array([water_pos_1,water_pos_2,water_pos_3,water_pos_4,water_pos_5,water_pos_6,water_pos_7,water_pos_8])
		casillas_trueno.append_array([thunder_pos_1,thunder_pos_2,thunder_pos_3,thunder_pos_4,thunder_pos_5,thunder_pos_6,thunder_pos_7,thunder_pos_8])
		var indice1=(randi()%8)
	
		trueno.global_position=casillas_trueno[indice1]
		casillas_trueno.remove_at(indice1)
	
		agua.global_position=casillas_agua[indice1]
		casillas_agua.remove_at(indice1)
	
		fuego.global_position=casillas_fuego[indice1]
		casillas_fuego.remove_at(indice1)
	
		var indice2=(randi()%7)
		trueno_2.global_position=casillas_trueno[indice2]
		casillas_trueno.remove_at(indice2)	

		agua_2.global_position=casillas_agua[indice2]
		casillas_agua.remove_at(indice2)
	
		fuego_2.global_position=casillas_fuego[indice2]
		casillas_fuego.remove_at(indice2)
		
		var indice3=(randi()%6)
		trueno_3.global_position=casillas_trueno[indice3]
		casillas_trueno.remove_at(indice3)	
	
		agua_3.global_position=casillas_agua[indice3]
		casillas_agua.remove_at(indice3)
	
		fuego_3.global_position=casillas_fuego[indice3]
		casillas_fuego.remove_at(indice3)
			
		var indice4=(randi()%5)
		trueno_4.global_position=casillas_trueno[indice4]
		casillas_trueno.remove_at(indice4)	
		
		agua_4.global_position=casillas_agua[indice4]
		casillas_agua.remove_at(indice4)
	
		fuego_4.global_position=casillas_fuego[indice4]
		casillas_fuego.remove_at(indice4)
	
	
var indice 

func _on_area_trueno_body_entered(body):
	body.trueno=body.trueno+1
	randomize()
	indice=randi()%len(casillas_trueno)
	casillas_trueno.append_array([trueno.global_position])
	trueno.global_position=casillas_trueno[indice]
	casillas_trueno.remove_at(indice)	
	if body==serpiente:
		carta_3.position.x=pos1_x
		carta_3.position.y=pos_y
		body.permiso_movimiento=false
		dado.permiso_dado=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_3.position.x=pos_out
		carta_3.position.y=pos_y

	if body==serpiente_2:
		carta_3.position.x=pos2_x
		carta_3.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_3.position.x=pos_out
		carta_3.position.y=pos_y
		
func _on_area_trueno_2_body_entered(body):
	body.trueno=body.trueno+1
	randomize()
	indice=randi()%len(casillas_trueno)
	casillas_trueno.append_array([trueno_2.global_position])
	trueno_2.global_position=casillas_trueno[indice]
	casillas_trueno.remove_at(indice)	
	if body==serpiente:
		carta_3.position.x=pos1_x
		carta_3.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_3.position.x=pos_out
		carta_3.position.y=pos_y

	if body==serpiente_2:
		carta_3.position.x=pos2_x
		carta_3.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_3.position.x=pos_out
		carta_3.position.y=pos_y
func _on_area_trueno_3_body_entered(body):
	body.trueno=body.trueno+1
	randomize()
	indice=randi()%len(casillas_trueno)
	casillas_trueno.append_array([trueno_3.global_position])
	trueno_3.global_position=casillas_trueno[indice]
	casillas_trueno.remove_at(indice)	
	if body==serpiente:
		carta_3.position.x=pos1_x
		carta_3.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_3.position.x=pos_out
		carta_3.position.y=pos_y
		
	if body==serpiente_2:
		carta_3.position.x=pos2_x
		carta_3.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_3.position.x=pos_out
		carta_3.position.y=pos_y		
func _on_area_trueno_4_body_entered(body):
	body.trueno=body.trueno+1
	randomize()
	indice=randi()%len(casillas_trueno)
	casillas_trueno.append_array([trueno_4.global_position])
	trueno_4.global_position=casillas_trueno[indice]
	casillas_trueno.remove_at(indice)	
	if body==serpiente:
		carta_3.position.x=pos1_x
		carta_3.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_3.position.x=pos_out
		carta_3.position.y=pos_y
	if body==serpiente_2:
		carta_3.position.x=pos2_x
		carta_3.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_3.position.x=pos_out
		carta_3.position.y=pos_y
func _on_area_fuego_body_entered(body):
	body.fuego=body.fuego+1
	randomize()
	indice=randi()%len(casillas_fuego)
	casillas_fuego.append_array([fuego.global_position])
	fuego.global_position=casillas_fuego[indice]
	casillas_fuego.remove_at(indice)	
	if body==serpiente:
		carta_2.position.x=pos1_x
		carta_2.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_2.position.x=pos_out
		carta_2.position.y=pos_y
	if body==serpiente_2:
		carta_2.position.x=pos2_x
		carta_2.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_2.position.x=pos_out
		carta_2.position.y=pos_y	
		
func _on_area_fuego_2_body_entered(body):
	body.fuego=body.fuego+1
	randomize()
	indice=randi()%len(casillas_fuego)
	casillas_fuego.append_array([fuego_2.global_position])
	fuego_2.global_position=casillas_fuego[indice]
	casillas_fuego.remove_at(indice)	
	if body==serpiente:
		carta_2.position.x=pos1_x
		carta_2.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_2.position.x=pos_out
		carta_2.position.y=pos_y
	if body==serpiente_2:
		carta_2.position.x=pos2_x
		carta_2.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_2.position.x=pos_out
		carta_2.position.y=pos_y
			
func _on_area_fuego_3_body_entered(body):
	body.fuego=body.fuego+1
	randomize()
	indice=randi()%len(casillas_fuego)
	casillas_fuego.append_array([fuego_3.global_position])
	fuego_3.global_position=casillas_fuego[indice]
	casillas_fuego.remove_at(indice)	
	if body==serpiente:
		carta_2.position.x=pos1_x
		carta_2.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_2.position.x=pos_out
		carta_2.position.y=pos_y
	if body==serpiente_2:
		carta_2.position.x=pos2_x
		carta_2.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_2.position.x=pos_out
		carta_2.position.y=pos_y
		
func _on_area_fuego_4_body_entered(body):
	body.fuego=body.fuego+1
	randomize()
	indice=randi()%len(casillas_fuego)
	casillas_fuego.append_array([fuego_4.global_position])
	fuego_4.global_position=casillas_fuego[indice]
	casillas_fuego.remove_at(indice)	
	if body==serpiente:
		carta_2.position.x=pos1_x
		carta_2.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_2.position.x=pos_out
		carta_2.position.y=pos_y
	if body==serpiente_2:
		carta_2.position.x=pos2_x
		carta_2.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_2.position.x=pos_out
		carta_2.position.y=pos_y	
	
func _on_area_agua_body_entered(body):
	body.agua=body.agua+1
	randomize()
	indice=randi()%len(casillas_agua)
	casillas_agua.append_array([agua.global_position])
	agua.global_position=casillas_agua[indice]
	casillas_agua.remove_at(indice)	
	if body==serpiente:
		carta_1.position.x=pos1_x
		carta_1.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_1.position.x=pos_out
		carta_1.position.y=pos_y
	if body==serpiente_2:
		carta_1.position.x=pos2_x
		carta_1.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_1.position.x=pos_out
		carta_1.position.y=pos_y
func _on_area_agua_2_body_entered(body):
	body.agua=body.agua+1
	randomize()
	indice=randi()%len(casillas_agua)
	casillas_agua.append_array([agua_2.global_position])
	agua_2.global_position=casillas_agua[indice]
	casillas_agua.remove_at(indice)	
	if body==serpiente:
		carta_1.position.x=pos1_x
		carta_1.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_1.position.x=pos_out
		carta_1.position.y=pos_y
	if body==serpiente_2:
		carta_1.position.x=pos2_x
		carta_1.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_1.position.x=pos_out
		carta_1.position.y=pos_y
func _on_area_agua_3_body_entered(body):
	body.agua=body.agua+1
	randomize()
	indice=randi()%len(casillas_agua)
	casillas_agua.append_array([agua_3.global_position])
	agua_3.global_position=casillas_agua[indice]
	casillas_agua.remove_at(indice)	
	if body==serpiente:
		carta_1.position.x=pos1_x
		carta_1.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_1.position.x=pos_out
		carta_1.position.y=pos_y
	if body==serpiente_2:
		carta_1.position.x=pos2_x
		carta_1.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_1.position.x=pos_out
		carta_1.position.y=pos_y
func _on_area_agua_4_body_entered(body):
	
	body.agua=body.agua+1
	randomize()
	indice=randi()%len(casillas_agua)
	casillas_agua.append_array([agua_4.global_position])
	agua_4.global_position=casillas_agua[indice]
	casillas_agua.remove_at(indice)	
	if body==serpiente:
		carta_1.position.x=pos1_x
		carta_1.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_1.position.x=pos_out
		carta_1.position.y=pos_y
	if body==serpiente_2:
		carta_1.position.x=pos2_x
		carta_1.position.y=pos_y
		dado.permiso_dado=false
		body.permiso_movimiento=false
		await get_tree().create_timer(5).timeout
		body.permiso_movimiento=true
		dado.permiso_dado=true
		carta_1.position.x=pos_out
		carta_1.position.y=pos_y
