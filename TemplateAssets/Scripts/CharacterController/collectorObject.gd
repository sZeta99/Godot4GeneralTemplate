extends Area2D

class_name Collector 
##  Emitted when a Collectabal Item get "Picked Up", pass the Object item(Node2D)
signal item_collected(item: Node2D)
## Groupe of the collectable Item, a Object mabey is better
@export var groupe : String
## If false, the component will not function
@export var active : bool = true


func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group(groupe) and active:
		emit_signal("item_collected", body as Node2D)
		body.queue_free()
		print_debug("Body freed")
	pass # Replace with function body.
