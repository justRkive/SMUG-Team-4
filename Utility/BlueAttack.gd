extends Area2D

var vel = 100
var dir = Vector2.RIGHT
var source = 0
@onready var animation_tree = $AnimationTree
@export var longevity = 5
@onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tree.active = true
	timer.wait_time = longevity
	timer.start()
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position = global_position + dir*vel*delta
	print(global_position)
	


