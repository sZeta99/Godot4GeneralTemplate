extends Node


const SAVE_FILE = "user://SAVEFILE.save"

# Forse una data class serebbe più appropriata
var game_data = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()

func load_data():
	
	if not FileAccess.file_exists(SAVE_FILE):
		game_data = {
			"fullscreen_on" : false
		}
		save_data()
	
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	game_data = file.get_var()
	# Equivale a file.close
	file.close()
	
func save_data():
	
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_var(game_data)
	file.close()
	
	
