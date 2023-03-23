extends Area2D
class_name Interactor

## Groupe of the collectable Item, a Object mabey is better
@export var group : String
## If false, the component will not function
@export var active : bool = true
## Check for group compatibility
@export var groupeActive : bool = false

var entityToInteractWith : Array[Interactables];

func _ready():
	self.body_entered.connect(_on_body_entered)
	self.body_exited.connect(_on_body_exited)
	entityToInteractWith = []
	pass
	
func _input(event):
	print_debug("Input")
	if(event.is_action_pressed("ui_select") && active):
		print_debug("Call")
		print_debug(entityToInteractWith.size())
		
		for entity in entityToInteractWith:
			print_debug("Loop")
			if groupeActive :
				if entity.is_in_group(group):
					entity._interact(self)
			else :
				print_debug("Entity.call")
				entity._interact(self)
	pass
	
func _on_body_entered(body):
	print_debug("Enter")
	print_debug(entityToInteractWith.size())
	if active:
		if groupeActive:
				if body.is_in_group(group):
					entityToInteractWith.push_front(body)
		else:
			entityToInteractWith.push_front(body)
	pass 
	
func _on_body_exited(body):
	print_debug("Exit")
	print_debug(entityToInteractWith.size())
	var itemIndex = entityToInteractWith.find(body)
	if itemIndex != -1 :
		entityToInteractWith.remove_at(itemIndex)
	pass
