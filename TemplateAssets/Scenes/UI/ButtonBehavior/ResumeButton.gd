extends Button

@export var PauseCanvasLayer : CanvasLayer

func _ready():
	self.pressed.connect(_on_resume_button_pressed)
	pass
	
	
func _on_resume_button_pressed():
	print_debug("Pause button pressed")
	get_tree().paused = false
	PauseCanvasLayer.visible = false
	pass
