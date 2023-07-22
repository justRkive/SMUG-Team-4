extends Label

@onready var red_snake = $".."

func _process(_delta):
	$".".text=str($"..".hp)
