extends Label


@export var puntos=0

func _process(delta):
	self.text= "Player 2 = " + str(puntos)
