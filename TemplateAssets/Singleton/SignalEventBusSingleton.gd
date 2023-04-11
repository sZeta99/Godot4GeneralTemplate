class_name SignalEventBusSignleton
extends Node

## Implementetion of EventBusSignleton : https://www.gdquest.com/tutorial/godot/design-patterns/event-bus-singleton/

##Enum 
const ITEM_COLLECTED = "item_collected"
const CURRENT_HEALTH_SET = "current_health_set"
const MAX_HEALTH_SET = "max_health_set"

# Fired on Collision of CollectrNode
signal item_collected(item: Node2D)
signal current_health_set(entity : Node2D, newHealth : int )
signal max_health_set(entity : Node2D, newMaxHealth : int )



	
	
