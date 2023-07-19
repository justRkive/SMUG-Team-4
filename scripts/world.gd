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
	var data1 = {
		"puntuacion1":green_snake.puntos,
		"puntuacion2":snake.puntos,
		"guardar_inicio":false,
		"poder_agua1":green_snake.poderes["water"],
		"poder_fuego1":green_snake.poderes["fire"],
		"poder_trueno1":green_snake.poderes["thunder"],
		"poder_agua2":snake.poderes["water"],
		"poder_fuego2":snake.poderes["fire"],
		"poder_trueno2":snake.poderes["thunder"],
		}
	var file1 = FileAccess.open("user://data1.json",FileAccess.WRITE)
	file1.store_string(JSON.stringify(data1))

	var file = FileAccess.open("user://data.json",FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())

		
func load_data():
	var file1=FileAccess.open("user://data1.json",FileAccess.READ)
	var data1=JSON.parse_string(file1.get_as_text())
	
	green_snake.puntos = data1.puntuacion1
	snake.puntos = data1.puntuacion2

	green_snake.poderes["water"] = data1.poder_agua1
	green_snake.poderes["fire"] = data1.poder_fuego1
	green_snake.poderes["thunder"] = data1.poder_trueno1
	snake.poderes["water"] = data1.poder_agua2
	snake.poderes["fire"] = data1.poder_fuego2
	snake.poderes["thunder"] = data1.poder_trueno2
