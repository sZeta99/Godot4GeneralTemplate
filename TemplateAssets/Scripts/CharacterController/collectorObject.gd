extends Area2D
class_name Collector 

## Groupe of the collectable Item, a Object mabey is better
@export var groupe : String
## If false, the component will not function
@export var active : bool = true

func _ready():
	self.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body.is_in_group(groupe) and active:
		SignalEventBusSingleton.emit_signal(SignalEventBusSingleton.ITEM_COLLECTED, body as Node2D)
		body.queue_free()
		print_debug("Item Collected")
	pass # Replace with function body.
