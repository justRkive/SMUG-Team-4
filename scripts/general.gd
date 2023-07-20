extends Node3D
@onready var mapa = $mapa
@onready var dado = $SubViewportContainer/SubViewport/Camera3D/dado

@onready var label_2 = $SubViewportContainer/Control/HBoxContainer/Label2
@onready var serpiente_2 = $serpiente2
@onready var serpiente = $serpiente
@onready var label_puntuacion = $SubViewportContainer/Control/VBoxContainer/Label_puntuacion
@onready var label_puntuacion_2 = $SubViewportContainer/Control/VBoxContainer/Label_puntuacion2
@onready var h_box_container_4 = $SubViewportContainer/Control/HBoxContainer4
@onready var agua = $agua
@onready var agua_2 = $agua2
@onready var agua_3 = $agua3
@onready var agua_4 = $agua4

@onready var trueno = $trueno
@onready var trueno_2 = $trueno2
@onready var trueno_3 = $trueno3
@onready var trueno_4 = $trueno4

@onready var fuego = $fuego
@onready var fuego_2 = $fuego2
@onready var fuego_3 = $fuego3
@onready var fuego_4 = $fuego4

@onready var on_board = true
@onready var canvasLayer := $CanvasLayer
@onready var canvasLayerEnding := $CanvasLayerEnding
@onready var canvasLayerfadeIn := $CanvasLayer/fadeIn/CanvasLayer
@onready var canvasLayerfadeOut := $CanvasLayer/fadeOut/CanvasLayer

@export var fade_out : Transitioner
@export var fade_in : Transitioner 

@export var player2wins : Transitioner
@export var player1wins : Transitioner

signal timer

func _ready():
	var file=FileAccess.open("user://data.json",FileAccess.READ)
	var data=JSON.parse_string(file.get_as_text())
	if data.guardar_inicio==true:
		save_data()
	else:
		load_data()

	canvasLayer.visible = false
	canvasLayerEnding.visible = false
	canvasLayerfadeIn.visible = false
	canvasLayerfadeOut.visible = false
	var current_round = label_2.rondas
	if (current_round > 1):
		canvasLayer.visible = true
		print("Battle Finished")
		fade_in.set_next_animation(false)
		await get_tree().create_timer(1).timeout
		canvasLayer.visible = false


func save_data():

	var data ={
		"posicion_inicial_1":[serpiente.posicion_inicial_1[0],serpiente.posicion_inicial_1[1],serpiente.posicion_inicial_1[2]],
		"posicion_inicial_2":[serpiente_2.posicion_inicial_2[0],serpiente_2.posicion_inicial_2[1],serpiente_2.posicion_inicial_2[2]],
		"rotacion_1":serpiente.rotacion,
		"rotacion_2":serpiente_2.rotacion,
		"rondas":label_2.rondas,
		"guardar_inicio":false,

		
		"water_pos1":[agua.global_position[0],agua.global_position[1],agua.global_position[2]],
		"water_pos2":[agua_2.global_position[0],agua_2.global_position[1],agua_2.global_position[2]],
		"water_pos3":[agua_3.global_position[0],agua_3.global_position[1],agua_3.global_position[2]],
		"water_pos4":[agua_4.global_position[0],agua_4.global_position[1],agua_4.global_position[2]],
		
		"fire_pos1":[fuego.global_position[0],fuego.global_position[1],fuego.global_position[2]],
		"fire_pos2":[fuego_2.global_position[0],fuego_2.global_position[1],fuego_2.global_position[2]],
		"fire_pos3":[fuego_3.global_position[0],fuego_3.global_position[1],fuego_3.global_position[2]],
		"fire_pos4":[fuego_4.global_position[0],fuego_4.global_position[1],fuego_4.global_position[2]],

		"thunder_pos1":[trueno.global_position[0],trueno.global_position[1],trueno.global_position[2]],
		"thunder_pos2":[trueno_2.global_position[0],trueno_2.global_position[1],trueno_2.global_position[2]],
		"thunder_pos3":[trueno_3.global_position[0],trueno_3.global_position[1],trueno_3.global_position[2]],
		"thunder_pos4":[trueno_4.global_position[0],trueno_4.global_position[1],trueno_4.global_position[2]],
		
		"water_array":[mapa.casillas_agua[0],mapa.casillas_agua[1],mapa.casillas_agua[2],mapa.casillas_agua[3]],
		"fire_array":[mapa.casillas_fuego[0],mapa.casillas_fuego[1],mapa.casillas_fuego[2],mapa.casillas_fuego[3]],
		"thunder_array":[mapa.casillas_trueno[0],mapa.casillas_trueno[1],mapa.casillas_trueno[2],mapa.casillas_trueno[3]]
		}
	var file = FileAccess.open("user://data.json",FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	
	var data1 ={
		"puntuacion1":serpiente.puntos,
		"puntuacion2":serpiente_2.puntos,
		"guardar_inicio":false,
		"poder_fuego1":serpiente.fuego,
		"poder_fuego2":serpiente_2.fuego,
		"poder_agua1":serpiente.agua,
		"poder_agua2":serpiente_2.agua,
		"poder_trueno1":serpiente.trueno,
		"poder_trueno2":serpiente_2.trueno
		}
	var file1 = FileAccess.open("user://data1.json",FileAccess.WRITE)
	file1.store_string(JSON.stringify(data1))	
	
func load_data():
	var file=FileAccess.open("user://data.json",FileAccess.READ)
	var data=JSON.parse_string(file.get_as_text())
	var file1=FileAccess.open("user://data1.json",FileAccess.READ)
	var data1=JSON.parse_string(file1.get_as_text())
	serpiente.global_position=Vector3(data.posicion_inicial_1[0],data.posicion_inicial_1[1],data.posicion_inicial_1[2])
	serpiente_2.global_position=Vector3(data.posicion_inicial_2[0],data.posicion_inicial_2[1],data.posicion_inicial_2[2])
	serpiente.rotacion= data.rotacion_1
	serpiente_2.rotacion=data.rotacion_2
	label_2.rondas=data.rondas+1
	serpiente.puntos=data1.puntuacion1
	serpiente_2.puntos=data1.puntuacion2
	serpiente.fuego=data1.poder_fuego1
	serpiente.agua=data1.poder_agua1
	serpiente.trueno=data1.poder_trueno1
	serpiente_2.fuego=data1.poder_fuego2
	serpiente_2.agua=data1.poder_agua2
	serpiente_2.trueno=data1.poder_trueno2
	
	agua.global_position=Vector3(data.water_pos1[0],data.water_pos1[1],data.water_pos1[2]) 
	agua_2.global_position=Vector3(data.water_pos2[0],data.water_pos2[1],data.water_pos2[2])
	agua_3.global_position=Vector3(data.water_pos3[0],data.water_pos3[1],data.water_pos3[2])
	agua_4.global_position=	Vector3(data.water_pos4[0],data.water_pos4[1],data.water_pos4[2])
	
	fuego.global_position=Vector3(data.fire_pos1[0],data.fire_pos1[1],data.fire_pos1[2])
	fuego_2.global_position=Vector3(data.fire_pos2[0],data.fire_pos2[1],data.fire_pos2[2])
	fuego_3.global_position=Vector3(data.fire_pos3[0],data.fire_pos3[1],data.fire_pos3[2])
	fuego_4.global_position=Vector3(data.fire_pos4[0],data.fire_pos4[1],data.fire_pos4[2])
	
	trueno.global_position=Vector3(data.thunder_pos1[0],data.thunder_pos1[1],data.thunder_pos1[2])
	trueno_2.global_position=Vector3(data.thunder_pos2[0],data.thunder_pos2[1],data.thunder_pos2[2])
	trueno_3.global_position=Vector3(data.thunder_pos3[0],data.thunder_pos3[1],data.thunder_pos3[2])
	trueno_4.global_position=Vector3(data.thunder_pos4[0],data.thunder_pos4[1],data.thunder_pos4[2])
	
	print(data.fire_array)
	mapa.casillas_fuego=PackedVector3Array(data.fire_array)
	mapa.casillas_agua=PackedVector3Array(data.water_array)
	mapa.casillas_trueno=PackedVector3Array(data.thunder_array)
	
func _process(delta):
	var current_round = label_2.rondas
	if (int(current_round)%4 == 0) and on_board:
		on_board = false
		canvasLayer.visible = true
		dado.permiso_dado=false
		print("Batte Starts")
		serpiente.get_child(3).get_child(0).permiso_pausa=false
		h_box_container_4.activacion_animada=true
		await get_tree().create_timer(1.5).timeout
		fade_out.set_next_animation(true)
		
	if (int(current_round) == 9) and on_board:
		#await get_tree().create_timer(1).timeout

		
		var player1_pts = serpiente.puntos
		var player2_pts = serpiente_2.puntos

			
		if (player1_pts > player2_pts):
			on_board = false		
			dado.permiso_dado=false
			canvasLayerEnding.visible = true
			player1wins.set_next_animation(true)
				
			print("Player 1 wins")
			await get_tree().create_timer(5).timeout
			get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
		if (player1_pts < player2_pts):
			on_board = false		
			dado.permiso_dado=false
			canvasLayerEnding.visible = true
			player2wins.set_next_animation(true)
				
			print("Player 2 wins")
			await get_tree().create_timer(5).timeout
			get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	if (int(current_round) == 13) and on_board:
		#await get_tree().create_timer(1).timeout
		on_board = false		
		dado.permiso_dado=false
		var player1_pts = serpiente.puntos
		var player2_pts = serpiente_2.puntos
		if (player1_pts > player2_pts):
			canvasLayerEnding.visible = true
			player1wins.set_next_animation(true)
				
			print("Player 1 wins")
			await get_tree().create_timer(5).timeout
			get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
		else:
			canvasLayerEnding.visible = true
			player2wins.set_next_animation(true)
				
			print("Player 2 wins")
			await get_tree().create_timer(5).timeout
			get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
		
