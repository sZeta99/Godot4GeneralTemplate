extends Area2D
class_name Collector 

## Groupe of the collectable Item, a Object mabey is better
@export var group : String
## If false, the component will not function
@export var active : bool = true

## Check for group compatibility
@export var groupeActive : bool = false

func _ready():
	self.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if active:
		if groupeActive :
			if body.is_in_group(group):
				collect(body)
		else :
			collect(body)
	pass

func collect(body):
	SignalEventBusSingleton.emit_signal(SignalEventBusSingleton.ITEM_COLLECTED, body as Node2D)
	body.queue_free()
	print_debug("Item Collected")
	
