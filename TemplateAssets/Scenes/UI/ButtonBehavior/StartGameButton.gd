extends Button
@export var StartScene : PackedScene

func _ready():
	self.pressed.connect(_on_start_button_pressed)
	pass

func _on_start_button_pressed():
	get_tree().change_scene_to_packed(StartScene)
	print_debug("Scene Loded")
	pass

