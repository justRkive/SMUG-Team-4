extends MarginContainer

@onready var play3D = %Play3D
@onready var credits = %Credits
@onready var exit = %Exit

@export var scene3D: PackedScene
@export var sceneCred: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	play3D.pressed.connect(_on_play3D_pressed)
	credits.pressed.connect(_on_credits_pressed)
	exit.pressed.connect(_on_exit_pressed)

func _on_play3D_pressed():
	var data ={
		"guardar_inicio":true
		}
	var file = FileAccess.open("user://data.json",FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	var data1={ 
		"puntuacion1": 0,
		"puntuacion2": 0,
		"guardar_inicio":true
	}
	var file2 = FileAccess.open("user://data1.json",FileAccess.WRITE)
	file2.store_string(JSON.stringify(data1))
	get_tree().change_scene_to_packed(scene3D)

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/Credits/Credits.tscn")

func _on_exit_pressed():
	get_tree().quit()
