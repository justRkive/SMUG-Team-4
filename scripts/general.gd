extends Node3D

@onready var label_2 = $SubViewportContainer/Control/HBoxContainer/Label2
@onready var serpiente_2 = $serpiente2
@onready var serpiente = $serpiente
@onready var label_puntuacion = $SubViewportContainer/Control/VBoxContainer/Label_puntuacion
@onready var label_puntuacion_2 = $SubViewportContainer/Control/VBoxContainer/Label_puntuacion2

func _ready():
	var file=FileAccess.open("user://data.json",FileAccess.READ)
	var data=JSON.parse_string(file.get_as_text())
	if data.guardar_inicio==true:
		save_data()
	else:
		load_data()


func save_data():
	var data ={
		"posicion_inicial_1":[serpiente.posicion_inicial_1[0],serpiente.posicion_inicial_1[1],serpiente.posicion_inicial_1[2]],
		"posicion_inicial_2":[serpiente_2.posicion_inicial_2[0],serpiente_2.posicion_inicial_2[1],serpiente_2.posicion_inicial_2[2]],
		"rotacion_1":serpiente.rotacion,
		"rotacion_2":serpiente_2.rotacion,
		"rondas":label_2.rondas,
		"guardar_inicio":false
		}
	var file = FileAccess.open("user://data.json",FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	
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
	label_puntuacion.puntos=data1.puntuacion2
	label_puntuacion_2.puntos=data1.puntuacion1
func _process(delta):
	if int(label_2.rondas)%4 == 0:
		await get_tree().create_timer(0.3).timeout
		get_tree().change_scene_to_file("res://scenes/World/world.tscn")
