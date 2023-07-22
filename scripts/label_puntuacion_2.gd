extends Label

@onready var serpiente_2 = $"../../../../serpiente2"

@export var puntos=0

func _process(_delta):
	self.text= "Player 2 = " + str(serpiente_2.puntos)
