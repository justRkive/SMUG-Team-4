extends Label
@export var rondas=1

func _process(_delta):
	self.text=str(rondas)
func _on_serpiente_2_ronda():
	rondas+=1

