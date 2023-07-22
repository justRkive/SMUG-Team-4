extends Label

@onready var serpiente = $"../../../../serpiente"
@onready var serpiente_2 = $"../../../../serpiente2"
@onready var dado = $"../../../SubViewport/Camera3D/dado"

func _physics_process(_delta):
	if dado.jugador_actual==0 and serpiente.movimientos_disponibles==0 and serpiente_2.movimientos_disponibles==0:
		self.text="1"
	if dado.jugador_actual==1 and serpiente.movimientos_disponibles==0 and serpiente_2.movimientos_disponibles==0:
		self.text="2"

