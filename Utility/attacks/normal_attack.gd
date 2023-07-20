# Normal Attack

extends Area2D
@onready var dir
var level = 1
var hp = 1
var speed = 10000
var damage = 6
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
@onready var pivot = $Pivot

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
	queue_free()
