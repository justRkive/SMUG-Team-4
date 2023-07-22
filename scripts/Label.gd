extends Label
@onready var serpiente_2 = $"../../../../serpiente2"
@onready var serpiente = $"../../../../serpiente"
@onready var dado = $"../../../SubViewport/Camera3D/dado"

func _physics_process(_delta):
	if serpiente.movimientos_disponibles==0 and serpiente_2.movimientos_disponibles==0:
		self.text="Throw Dice"
	if serpiente.movimientos_disponibles==1 or serpiente_2.movimientos_disponibles==1:	
		self.text="movements: 1"
	if serpiente.movimientos_disponibles==2 or serpiente_2.movimientos_disponibles==2:	
		self.text="movements: 2"
	if serpiente.movimientos_disponibles==3 or serpiente_2.movimientos_disponibles==3:	
		self.text="movements: 3"
	if serpiente.movimientos_disponibles==4 or serpiente_2.movimientos_disponibles==4:	
		self.text="movements: 4"
	if serpiente.movimientos_disponibles==5 or serpiente_2.movimientos_disponibles==5:	
		self.text="movements: 5"
	if serpiente.movimientos_disponibles==6 or serpiente_2.movimientos_disponibles==6:	
		self.text="movements: 6"

