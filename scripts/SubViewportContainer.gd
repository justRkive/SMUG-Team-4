extends SubViewport
@onready var sub_viewport_container = $"."

var ancho =ProjectSettings.get_setting("display/window/size/viewport_width")
var largo =ProjectSettings.get_setting("display/window/size/viewport_height")
var medidas= Vector2i(ancho,largo)
# Called when the node enters the scene tree for the first time.
func _ready():
	$".".set_size(medidas)

