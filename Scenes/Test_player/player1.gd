extends CharacterBody2D



const SPEED = 300.0
var angulo = 0
var loking = Vector2.RIGHT
var up = Vector2.UP

@onready var sprite = $Sprite2D


func _ready(): #primer frame
	pass
	
func _physics_process(delta): #cada framde
	movement()
	
func movement():
	
	var sentido = Input.get_axis("rotar_izq","rotar_der")
	rotation += 0.1 * sentido
	
	loking = Vector2.from_angle(rotation)
	up = Vector2.from_angle(rotation-1.5707)
	
	
	var direction_X =  Input.get_axis("ui_left","ui_right")
	var direction_Y = Input.get_axis("ui_down","ui_up")
	
	loking *= direction_X * SPEED
	up *= direction_Y*SPEED
	
	velocity = loking + up
	
	
	if Input.is_action_pressed("ui_accept"):
		velocity = velocity.normalized()*4*SPEED
		
	move_and_slide()
	
func _process(delta):
	pass
