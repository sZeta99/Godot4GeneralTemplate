extends Button
@export var SceneToLoad : String

func _ready():

	self.pressed.connect(_on_load_button_pressed)
	pass

func _on_load_button_pressed():

	#Toglie la pausa, non dovrebbe creare confitti, nel caso editare
	get_tree().paused = false
	
	# change_scene_to_packed sembra non fuzionare correttamente, possibile issue
	get_tree().change_scene_to_file(SceneToLoad)
	print_debug("Scene Loded")
	pass
