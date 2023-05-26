extends MarginContainer

@onready var resume = %Resume
@onready var restart = %Restart
@onready var battle = %Battle
@onready var main_menu = %MainMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	resume.pressed.connect(_on_resume_pressed)
	restart.pressed.connect(_on_restart_pressed)
	battle.pressed.connect(_on_battle_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	hide()

func _input(event):
	if event.is_action_pressed("pause"):
		show()
		get_tree().paused = true

func _on_resume_pressed():
	get_tree().paused = false
	hide()
	
func _on_restart_pressed():
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
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_battle_pressed():
	get_tree().change_scene_to_file("res://scenes/World/world.tscn")
	get_tree().paused = false

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	get_tree().paused = false


