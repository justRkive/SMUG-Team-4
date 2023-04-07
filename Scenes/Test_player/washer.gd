extends Node2D
@onready var animacion = $AnimatedSprite2D

func _ready():
	animacion.play("idle")

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		#cambiar animacion
		if animacion.animation=="idle":
			animacion.play("shoot")
		elif animacion.animation=="shoot":
			animacion.play("idle")
		
	
