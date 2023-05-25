extends Label
var rondas=1

func _ready():
	self.text=str(rondas)
func _on_serpiente_2_ronda():
	rondas+=1
	self.text=str(rondas)
