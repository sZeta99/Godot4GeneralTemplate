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
	
	if(event.is_action_pressed("ui_select") && active):	
		for entity in entityToInteractWith:
			if groupeActive :
				if entity.is_in_group(group):
					entity._interact(self)
			else :
				entity._interact(self)
	pass
	
func _on_body_entered(body):
	if active:
		if groupeActive:
				if body.is_in_group(group):
					entityToInteractWith.push_front(body)
		else:
			entityToInteractWith.push_front(body)
	pass 
	
func _on_body_exited(body):
	var itemIndex = entityToInteractWith.find(body)
	if itemIndex != -1 :
		entityToInteractWith.remove_at(itemIndex)
	pass
