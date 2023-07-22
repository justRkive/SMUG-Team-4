extends VBoxContainer

@onready var label_2 = $Label2
@onready var label_3 = $Label3
@onready var label_4 = $Label4

@onready var serpiente_2 = $"../../../serpiente2"

func _process(_delta):
	label_2.text=str(serpiente_2.fuego)
	label_3.text=str(serpiente_2.agua)
	label_4.text=str(serpiente_2.trueno)
