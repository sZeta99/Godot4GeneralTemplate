extends PopupPanel

@onready var FULLSCREEN = %FullScreenButton

#Probabilmente un bug ma gli index non sono ricalibrabili da fuori
func _on_full_screen_button_item_selected(index):

	if index == 0 :
		index = DisplayServer.WINDOW_MODE_FULLSCREEN
	else:
		index = DisplayServer.WINDOW_MODE_WINDOWED
	DisplayServer.window_set_mode(index)
	print_debug("Full Screen mode set to " + str(index))

