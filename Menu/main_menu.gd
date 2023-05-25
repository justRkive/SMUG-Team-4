extends MarginContainer

@onready var play3D = %Play3D
@onready var play2D = %Play2D
@onready var exit = %Exit

@export var scene2D: PackedScene
@export var scene3D: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	play3D.pressed.connect(_on_play3D_pressed)
	play2D.pressed.connect(_on_play2D_pressed)
	exit.pressed.connect(_on_exit_pressed)

func _on_play3D_pressed():
	get_tree().change_scene_to_packed(scene3D)

func _on_play2D_pressed():
	get_tree().change_scene_to_packed(scene2D)

func _on_exit_pressed():
	get_tree().quit()
