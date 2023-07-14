extends HBoxContainer
var velocidad=4

@onready var label = $PanelContainer/Label
@export var activacion_animada=false
func _process(delta):
	if activacion_animada==true:
		$".".position.x = $".".position.x+9

