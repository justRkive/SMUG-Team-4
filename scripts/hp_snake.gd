extends Label

@onready var red_snake = $".."

func _process(delta):
	$".".text=str($"..".hp)
