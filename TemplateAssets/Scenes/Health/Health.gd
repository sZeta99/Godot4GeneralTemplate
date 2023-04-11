## Abstract class, contein the rappresentation of Health
class_name Health
extends Node2D
## If true health can be modify
@export var active : bool = true
## The entity of which this node rappresent the health
@export var entity : Node2D
## The ammount of health in the current moment
@export var currentHealth : int
## The ammount of healt possible
@export var maxHealth : int
## If true health can go below 0
@export var allowSubZeroHealth: bool = false;
## If true emit the HEALTH_SET signal when health change
@export var emitSignalOnHealthChange : bool = true
## If true emit the MAX_HEALTH_SET signal when health change
@export var emitSignalOnMaxHealthChange : bool = true

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
	var entity_emit
	if !is_instance_valid(entity):
		entity_emit = self
		
	SignalEventBusSingleton.emit_signal(SignalEventBusSingleton.CURRENT_HEALTH_SET,entity_emit,currentHealth)
	
func emit_max():
	var entity_emit
	if !is_instance_valid(entity):
		entity_emit = self
		
	SignalEventBusSingleton.emit_signal(SignalEventBusSingleton.MAX_HEALTH_SET,entity_emit,maxHealth)
	
