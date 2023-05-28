extends Label

@export var puntos=0

func _process(delta):
	self.text= "Player 1 = " + str(puntos)
