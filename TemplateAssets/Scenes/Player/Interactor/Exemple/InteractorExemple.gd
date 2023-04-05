extends Interactables

@export var label : Label
# Called when the node enters the scene tree for the first time.
func _ready():
	label.hide()
	pass # Replace with function body.
	
func _interact(body):
	label.show()


