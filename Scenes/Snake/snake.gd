extends CharacterBody2D

const SPEED = 200.0
var angulo = 0
var loking = Vector2.RIGHT
var up = Vector2.UP
const JUMP_VELOCITY = -500
@onready var animation_tree = $AnimationTree
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var pivot = $Pivot
@onready var hitbox = $CollisionShape2D
@onready var posicion_hitbox = hitbox.get("position")

func rotar():
	var sentido = Input.get_axis("rotar_izq","rotar_der")
	rotation += 0.1 * sentido
	loking = Vector2.from_angle(rotation)


func _ready():
	animation_tree.active = true

func _physics_process(delta):
	
	if not is_on_floor():
		rotar()
		#gravedad
		velocity.y += gravity * delta
	
	if is_on_floor():
		rotation = 0
		loking = Vector2.from_angle(rotation)
	
	#movimiento normal
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#saltar
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if direction!=0:
		pivot.scale.x = sign(direction)
		if direction==-1:
			hitbox.position.x = -1
		
		if direction==1:
			hitbox.position.x = 0
	
	
	move_and_slide()
	

	

