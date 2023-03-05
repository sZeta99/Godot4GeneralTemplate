extends Button

func _ready():
	self.pressed.connect(_on_exit_button_pressed)


func _on_exit_button_pressed():
	print_debug("Quit Game")
	get_tree().quit()


