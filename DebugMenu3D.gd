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
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_battle_pressed():
	get_tree().change_scene_to_file("res://scenes/World/world.tscn")
	get_tree().paused = false

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	get_tree().paused = false


