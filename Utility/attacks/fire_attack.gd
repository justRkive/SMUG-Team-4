# Water Attack

extends Area2D
@onready var dir
var tipo = "fuego"
var level = 1
var hp = 1
var fire_damage = 1
var fire_tick = 1
var quemaduras = 0
const TOTAL_QUEMADURAS = 5
var speed = 10000
var damage = 5
var knock_amount = 100
var attack_size = 1.0
var longevity = 5
var timer_ataque = 1
@onready var animation_tree = $AnimationTree
@onready var timer = $Timer
@onready var player = get_tree().get_first_node_in_group("player_reed")
@onready var player_green = get_tree().get_first_node_in_group("player_green")
@onready var disable_timer= $Timer
@onready var collision = $CollisionShape2D
@onready var timer_quemar = $Quemar
@onready var pivot = $Pivot
var enemy

var target = Vector2.RIGHT

func _ready():
	animation_tree.active = true
	timer_quemar.wait_time = fire_tick # cada cuanto quema
	timer.wait_time = longevity
	timer.start()

func _physics_process(delta):
	global_position = global_position + target*speed*delta
	

func _on_timer_timeout():
	queue_free()

func _on_enemy_hit(enemy_hit):
	print("Fire entered body!")
	print("Body was atacable!")
	print(enemy_hit)
	enemy = enemy_hit
	timer.stop()
	timer_quemar.start()
	collision.disabled = true
	pivot.visible = false

func _on_quemar_timeout():
	quemaduras += 1
	enemy.quemandose = true
	if quemaduras >= TOTAL_QUEMADURAS + 1:
		enemy.quemandose = false
		queue_free()
		return
	enemy.hurt(fire_damage)
