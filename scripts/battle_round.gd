extends HBoxContainer
var velocidad=4

@onready var label = $PanelContainer/Label
@export var activacion_animada=false
func _process(_delta):
	if activacion_animada==true:
		$".".position.y = $".".position.y+6.3

