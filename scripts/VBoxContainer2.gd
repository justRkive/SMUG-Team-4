extends VBoxContainer

@onready var label_2 = $Label2
@onready var label_3 = $Label3
@onready var label_4 = $Label4

@onready var serpiente = $"../../../serpiente"

func _process(delta):
	label_2.text=str(serpiente.fuego)
	label_3.text=str(serpiente.agua)
	label_4.text=str(serpiente.trueno)
