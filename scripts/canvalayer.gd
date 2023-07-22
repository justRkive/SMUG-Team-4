extends CanvasLayer

@onready var gs_fire_number = %gs_fire_label
@onready var gs_water_number = %gs_water_label
@onready var gs_thunder_number = %gs_thunder_label

@onready var rs_fire_number = %rs_fire_label
@onready var rs_water_number = %rs_water_label
@onready var rs_thunder_number = %rs_thunder_label

@onready var snake = $"../Snake"
@onready var green_snake = $"../green_snake"


func _process(_delta):
	gs_fire_number.text= "x"+str(green_snake.poderes["fire"])
	gs_water_number.text= "x"+str(green_snake.poderes["water"])
	gs_thunder_number.text= "x"+str(green_snake.poderes["thunder"])
	
	rs_fire_number.text= "x"+str(snake.poderes["fire"])
	rs_water_number.text= "x"+str(snake.poderes["water"])
	rs_thunder_number.text="x"+str(snake.poderes["thunder"])
