extends Label
@onready var serpiente_2 = $"../../../../serpiente2"
@onready var serpiente = $"../../../../serpiente"
@onready var dado = $"../../../SubViewport/Camera3D/dado"

func _physics_process(delta):
	if serpiente.movimientos_disponibles==0 and serpiente_2.movimientos_disponibles==0:
		self.text="lanza el dado"
	if serpiente.movimientos_disponibles==1 or serpiente_2.movimientos_disponibles==1:	
		self.text="movimientos: 1"
	if serpiente.movimientos_disponibles==2 or serpiente_2.movimientos_disponibles==2:	
		self.text="movimientos: 2"
	if serpiente.movimientos_disponibles==3 or serpiente_2.movimientos_disponibles==3:	
		self.text="movimientos: 3"
	if serpiente.movimientos_disponibles==4 or serpiente_2.movimientos_disponibles==4:	
		self.text="movimientos: 4"
	if serpiente.movimientos_disponibles==5 or serpiente_2.movimientos_disponibles==5:	
		self.text="movimientos: 5"
	if serpiente.movimientos_disponibles==6 or serpiente_2.movimientos_disponibles==6:	
		self.text="movimientos: 6"

