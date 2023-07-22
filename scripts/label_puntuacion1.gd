extends Label

@export var puntos=0
@onready var serpiente = $"../../../../serpiente"

func _process(_delta):
	self.text= "Player 1 = " + str(serpiente.puntos)
