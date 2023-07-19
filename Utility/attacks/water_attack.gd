# Water Attack

extends Area2D
@onready var dir
var tipo = "agua"
var level = 1
var hp = 1
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
@onready var timer_inversion = $Inversion
@onready var collision = $CollisionShape2D
@onready var pivot = $Pivot
var enemy

var target = Vector2.RIGHT

func _ready():
	animation_tree.active = true
	timer.wait_time = longevity
	timer.start()

func _physics_process(delta):
	global_position = global_position + target*speed*delta
	

func _on_timer_timeout():
	queue_free()

func _on_enemy_hit(enemy_hit):
	print("Water entered body!")
	print("Body was atacable!")
	print(enemy_hit)
	enemy = enemy_hit
	enemy.invert_input()
	timer.stop()
	timer_inversion.start()
	collision.disabled = true
	pivot.visible = false

func _on_inversion_timeout():
	enemy.release_inversion()
	queue_free()
