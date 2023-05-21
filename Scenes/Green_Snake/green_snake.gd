extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 200.0
const JUMP_VELOCITY = -500

# variables de animacion
var permiso_atacar: bool = true
var permiso_idle: bool   = true


var looking = Vector2.RIGHT
var up = Vector2.UP
var last_direction = 1

var maxHP = 10
var hp = 10

@onready var animated_sprite_2d = $Pivot/AnimatedSprite2D
@onready var pivot = $Pivot
@onready var hitbox = $CollisionShape2D
@onready var posicion_hitbox = hitbox.get("position")
@onready var dead_timer = $DeadTimer
@onready var attack_timer = $AttackTimer

var BlueBall = preload("res://Utility/blue_attack.tscn")


func _ready():
	dead_timer.wait_time = 1
	attack_timer.wait_time = 1
 
func rotar():
	var sentido = Input.get_axis("key_O","key_P")
	rotation += 0.1 * sentido
	looking = Vector2.from_angle(rotation)
	

func attack():
	var blueball_attack = BlueBall.instantiate()
	blueball_attack.set_collision_layer_value(2, true)
	var pivot = blueball_attack.get_node("%Pivot")
	blueball_attack.target = looking
	pivot.scale.x = -sign(looking.x)
	if rotation>0:
		blueball_attack.position = global_position# + Vector2(sign(looking.x)*50,sign(looking.y)*8)
		pivot.rotation = looking.angle()
		if rotation>1.5707:
			pivot.scale.x = sign(looking.x)
	else:
		blueball_attack.position = global_position# + Vector2(sign(looking.x)*50,-12)
	add_child(blueball_attack)

	

func _physics_process(delta):
	
	if hp > 0 and permiso_idle:
		animated_sprite_2d.play("idle")
	
		if Input.is_action_just_pressed("key_L"):
			if permiso_atacar:
				permiso_idle = false
				animated_sprite_2d.play("attack")
				permiso_atacar = false
				attack_timer.start()
				attack()
		
	if not is_on_floor():
		rotar()
		#gravedad
		velocity.y += gravity * delta
	
	if is_on_floor():
		rotation = 0
		looking = Vector2.from_angle(rotation)
	
	#movimiento normal
	var direction = Input.get_axis("key_A", "key_D")
	if direction:
		velocity.x = direction * SPEED
		looking = looking*direction
		last_direction = direction
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		looking = looking*last_direction
	
	#saltar
	if Input.is_action_just_pressed("key_W") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if direction!=0:
		pivot.scale.x = sign(direction)
		if direction==-1:
			hitbox.position.x = -1.5
		
		if direction==1:
			hitbox.position.x = 1.5
	
	move_and_slide()
	

func _on_hurt_box_green_area_entered(area):
	if area.is_in_group("blue_ball"):
		var damage = area.damage
		hp-=damage
		print(hp)
		if hp<=0:
			animated_sprite_2d.play("die")
			dead_timer.start()


func _on_dead_timer_timeout():
	queue_free()


func _on_attack_timer_timeout():
	permiso_idle = true
