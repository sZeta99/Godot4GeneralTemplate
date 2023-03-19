class_name SignalEventBusSignleton
extends Node

## Implementetion of EventBusSignleton : https://www.gdquest.com/tutorial/godot/design-patterns/event-bus-singleton/

##Enum 
const ITEM_COLLECTED = "item_collected"
const INTERACTED_TO = "interacted_to"

## Fired on Player Interaction
signal interacted_to(entity)
# Fired on Collision of CollectrNode
signal item_collected(item: Node2D)


	
	
