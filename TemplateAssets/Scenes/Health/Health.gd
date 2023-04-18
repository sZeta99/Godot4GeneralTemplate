## Abstract class, contein the rappresentation of Health
class_name Health
extends Node

## If true health can be modify, signal will be emitted and function can be called
@export var active : bool = true

@export_category("Values")
## The ammount of health in the current moment
@export var currentHealth : int = 100
## The ammount of healt possible
@export var maxHealth : int = 100
## If true health can go below 0
@export var allowSubZeroHealth: bool = false;

@export_category("Emits")
# mabye use export_flags
## If true emit the HEALTH_SET signal when health change
@export var emitSignalOnHealthChange : bool = false
## The entity lincked to the signal, if not set the signal will be emitted from this node
@export_node_path("Node") var entityEmittedOnHealthChange
## If true emit the MAX_HEALTH_SET signal when health change
@export var emitSignalOnMaxHealthChange : bool = false
## The entity lincked to the signal, if not set the signal will be emitted from this node
@export_node_path("Node") var entityEmittedOnMaxHealthChange

func _ready():
	currentHealth = maxHealth
	pass


func set_health(newHealth : int) -> bool:
	
	if !active:
		return false
		
	if newHealth > maxHealth :
		push_error("health can't be more then max health:", self)
		return false
		
	if newHealth < 0 && !allowSubZeroHealth:
		newHealth = 0
	
	currentHealth = newHealth;
	if !emitSignalOnHealthChange:
		emit_current()
	return true

func set_max_health(newMaxHealth : int) -> bool:
	
	if !active:
		return false
	
	if(newMaxHealth < 0 ):
		push_error("max health can't be negative:", self)
		return false
		
	maxHealth = newMaxHealth;
	if !emitSignalOnMaxHealthChange:
		emit_max()
	return true

func get_health() -> int:
	return currentHealth

func get_max_health() -> int:
	return maxHealth
	
func emit_current():
	var entity_emit = entityEmittedOnHealthChange
	if !is_instance_valid(entityEmittedOnHealthChange):
		entity_emit = self
		
	SignalEventBusSingleton.emit_signal(SignalEventBusSingleton.CURRENT_HEALTH_SET,entity_emit,currentHealth)
	
func emit_max():
	var entity_emit = entityEmittedOnMaxHealthChange
	if !is_instance_valid(entityEmittedOnMaxHealthChange):
		entity_emit = self
		
	SignalEventBusSingleton.emit_signal(SignalEventBusSingleton.MAX_HEALTH_SET,entity_emit,maxHealth)

	
