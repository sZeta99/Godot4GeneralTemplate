extends Node
# Da rivedere è ancora un po confuso
enum FILES {
	SETTINGS_FILE,
	PLAYER_FILE,
	ENVIRONMENT_FILE
	}
@export var files: FILES


# Forse una data class serebbe più appropriata
var game_data = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	#load_data()
	pass

func load_data(f : FILES):
	var file = FileAccess.open(get_enum_value(f), FileAccess.READ)
	game_data = file.get_var()
	# Equivale a file.close
	file = null
	
func save_data(f : FILES, game_data_pass):
	
	var file = FileAccess.open(get_enum_value(f), FileAccess.WRITE)
	file.store_var(game_data_pass)
	file = null
	
	
	
func get_enum_value(f : FILES) -> String :
	var selectedFile = ""
	if f == FILES.SETTINGS_FILE:
		selectedFile = "user://SETTINGS_FILE.save"
	if f == FILES.PLAYER_FILE:
		selectedFile = "user://PLAYER_FILE.save"
	if f == FILES.ENVIRONMENT_FILE:
		selectedFile = "user://PLAYER_FILE.save"
	if selectedFile.is_empty():
		print_debug("Minssing type in file save/load Selection")
	return selectedFile
	
	
		
	
