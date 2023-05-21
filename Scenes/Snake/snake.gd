extends CharacterBody2D

var permiso_atacar = true
const SPEED = 200.0
var angulo = 0
var loking = Vector2.RIGHT
var last_direction = 1
var up = Vector2.UP
var permiso_idle = true
const JUMP_VELOCITY = -500
@onready var hp = 20
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var pivot = $Pivot
@onready var hitbox = $CollisionShape2D
@onready var posicion_hitbox = hitbox.get("position")
#que pasa ahora si que si o no
@onready var dead_timer = $DeadTimer
@onready var animated_sprit_reed = $Pivot/AnimatedSpritReed
@onready var attack_timer = $AttackTimer

#Attack
var BlueBall = preload("res://Utility/blue_attack.tscn")

func rotar():
	var sentido = Input.get_axis("rotar_izq","rotar_der")
	rotation += 0.1 * sentido
	loking = Vector2.from_angle(rotation)
	

func attack():
	var blueball_attack = BlueBall.instantiate()
	var pivot = blueball_attack.get_node("%Pivot")
	blueball_attack.target = loking
	pivot.scale.x = -sign(loking.x)
	if rotation>0:
		blueball_attack.position = global_position + Vector2(sign(loking.x)*50,sign(loking.y)*8)
		pivot.rotation = loking.angle()
		if rotation>1.5707:
			pivot.scale.x = sign(loking.x)
	else:
		blueball_attack.position = global_position + Vector2(sign(loking.x)*50,-12)
	add_child(blueball_attack)


func _ready():
	pass

	
func _physics_process(delta):
	
	if hp>0 and permiso_idle:
		animated_sprit_reed.play("idle")
	
	if Input.is_action_just_pressed("key_y"):
		if permiso_atacar:
			permiso_idle = false
			animated_sprit_reed.play("attack")
			permiso_atacar = false
			attack_timer.wait_time = 1
			attack_timer.start()
			attack()
		
	if not is_on_floor():
		rotar()
		#gravedad
		velocity.y += gravity * delta
	
	if is_on_floor():
		rotation = 0
		loking = Vector2.from_angle(rotation)
	
	#movimiento normal
	var direction = Input.get_axis("key_left", "key_right")
	if direction:
		velocity.x = direction * SPEED
		loking = loking*direction
		last_direction = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		loking = loking*last_direction
	
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
	
func _on_hurt_box_area_entered(area):
	if area.is_in_group("blue_ball"):
		var damage = area.damage
		hp-=damage
		if hp<=0:
			animated_sprit_reed.play("die")
			dead_timer.wait_time = 1
			dead_timer.start()


func _on_dead_timer_timeout():
	queue_free()

func _on_attack_timer_timeout():
	permiso_idle = true
	
