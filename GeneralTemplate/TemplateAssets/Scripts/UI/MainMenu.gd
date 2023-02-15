extends Node

const START_SCENE = "res://TemplateAssets/Scenes/UI/main_menu.tscn"

func _ready():
	#Setta come iniziale il tasto start, permette di scorrere con le frecette
	$VBoxContainer/StartButton.grab_focus()
	pass
# On Start Button
func _on_start_button_pressed():
	get_tree().change_scene_to_file(START_SCENE)
	print_debug("Scene Loded")
	pass # Replace with function body.

# On Options Button
func _on_options_button_pressed():
	print_debug("Options Opened")
	pass # Replace with function body.

# On Exit Button
func _on_exit_button_pressed():
	print_debug("Quit Game")
	get_tree().quit()
	pass # Replace with function body.
