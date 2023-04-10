class_name SignalEventBusSignleton
extends Node

## Implementetion of EventBusSignleton : https://www.gdquest.com/tutorial/godot/design-patterns/event-bus-singleton/

##Enum 
const ITEM_COLLECTED = "item_collected"
const HEALTH_SET = "health_set"

# Fired on Collision of CollectrNode
signal item_collected(item: Node2D)
signal health_set(entity : Node2D, newHealth : int )



	
	
