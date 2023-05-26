extends Label

@export var puntos=0

func _process(delta):
	self.text="jugador 1="+str(puntos)
