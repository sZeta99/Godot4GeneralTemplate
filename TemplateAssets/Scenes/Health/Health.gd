class_name Health
extends Node2D

## The entity of which this node rappresent the health
@export var entity : Node2D
## The ammount of health in the current moment
@export var currentHealth : int
## The ammount of healt possible
@export var maxHealth : int
## If true health can go below 0
@export var allowSubZeroHealth: bool = false;
## If true health can be modify
@export var active : bool = true
## If true emit the HEALTH_SET signal when health change
@export var emitSignalOnHealthChange : bool = false

func _ready():
	currentHealth = maxHealth
	pass


func _set_health(newHealth : int) -> bool:
	
	if !active:
		return false
		
	if newHealth > maxHealth :
		push_error("health can't be more then max health:", self)
		return false
		
	if newHealth < 0 && !allowSubZeroHealth:
		newHealth = 0
	
	currentHealth = newHealth;
	_emit()
	return true
	pass
func _set_max_health(newMaxHealth : int) -> bool:
	
	if !active:
		return false
	
	if(newMaxHealth < 0 ):
		push_error("max health can't be negative:", self)
		return false
		
	maxHealth = newMaxHealth;
	return true
	pass

func _get_health() -> int:
	return currentHealth
	pass
func _get_max_health() -> int:
	return maxHealth
	pass
	
func _emit():
	var entity_emit
	if !is_instance_valid(entity):
		entity_emit = self
		
	SignalEventBusSingleton.emit_signal(SignalEventBusSingleton.HEALTH_SET,entity_emit,currentHealth)
	pass
