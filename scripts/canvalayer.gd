extends CanvasLayer

@onready var fires_number = $Fires_number
@onready var water_number = $Water_number
@onready var thunder_number = $Thunder_number

@onready var fires_number_2 = $Fires_number2
@onready var water_number_2 = $Water_number2
@onready var thunder_number_2 = $Thunder_number2

@onready var snake = $"../Snake"
@onready var green_snake = $"../green_snake"


func _process(delta):
	fires_number.text= "x"+str(green_snake.fuego)
	water_number.text= "x"+str(green_snake.agua)
	thunder_number.text= "x"+str(green_snake.trueno)
	
	fires_number_2.text= "x"+str(snake.fuego)
	water_number_2.text= "x"+str(snake.agua)
	thunder_number_2.text="x"+str(snake.trueno)
