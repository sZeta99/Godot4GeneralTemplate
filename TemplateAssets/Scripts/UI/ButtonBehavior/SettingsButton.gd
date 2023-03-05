extends Button

@onready var SETTING_MENU = %Settings

func _ready():
	
	self.pressed.connect(_on_options_button_pressed)
	pass
	
	
func _on_options_button_pressed():
	print_debug("Options Opened")
	SETTING_MENU.popup_centered_ratio()
	pass




