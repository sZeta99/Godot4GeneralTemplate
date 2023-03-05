extends PopupPanel


const DISPLAY_MODE: Dictionary = {0 : DisplayServer.WINDOW_MODE_FULLSCREEN,
1 : DisplayServer.WINDOW_MODE_WINDOWED
}

const RESOLUTION_SIZE: Dictionary = {0 : Vector2(720,576),
1 : Vector2(1280, 720),
2 : Vector2(1920,1080)
}

#Probabilmente un bug ma gli index non sono ricalibrabili da fuori
func _on_full_screen_button_item_selected(index):
	DisplayServer.window_set_mode(DISPLAY_MODE.get(index))
	print_debug("Full Screen mode set to " + str(DISPLAY_MODE.get(index)))
	pass



func _on_resolution_button_item_selected(index):
	print_debug(index)
	DisplayServer.window_set_size(RESOLUTION_SIZE.get(index))
	print_debug("Resolution Set to " + str(RESOLUTION_SIZE.get(index)))
	pass

