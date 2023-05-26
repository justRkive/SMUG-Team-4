extends Node2D
@onready var snake = $Snake
@onready var green_snake = $green_snake

func _ready():
	var file=FileAccess.open("user://data1.json",FileAccess.READ)
	var data1=JSON.parse_string(file.get_as_text())
	if data1.guardar_inicio==true:
		save_data()
	else:
		load_data()
	
func save_data():
	var data1 ={
		"puntuacion1":snake.puntos,
		"puntuacion2":green_snake.puntos,
		"guardar_inicio":false
		}
	var file = FileAccess.open("user://data1.json",FileAccess.WRITE)
	file.store_string(JSON.stringify(data1))
	
func load_data():
	var file1=FileAccess.open("user://data1.json",FileAccess.READ)
	var data1=JSON.parse_string(file1.get_as_text())
	snake.puntos=data1.puntuacion1
	green_snake.puntos=data1.puntuacion2
