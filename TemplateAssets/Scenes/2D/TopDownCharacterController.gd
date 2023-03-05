extends CharacterBody2D

## Max velocity acivable 
@export var maxSpeed : float = 200
## Variable devide the time needed to parse the accelerection Curve
@export var accelerationUnit : float = 1
## Variable devide the time needed to parse the friction Curve
@export var frictionUnit : float = 1
## Set the acceleration 
@export var accelerationCurve : Curve
## Set the friction/deceleration 
@export var frictionCurve : Curve


# Get the gravity from the project settings to be synced with RigidBody noes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var friction: float = 0
var acceleration : float = 0


func _physics_process(delta):
	
	var direction = get_input()
	if direction.length() != 0:
		velocity = velocity.lerp(direction.normalized() * maxSpeed, accelerationCurve.sample(acceleration))
		acceleration += delta / accelerationUnit
		friction = 0
	
	else:
		velocity = velocity.lerp(Vector2.ZERO,frictionCurve.sample(friction))
		friction += delta * frictionUnit
		acceleration = 0
	
	move_and_slide()



func get_input():
	var input = Vector2()
	if Input.is_action_pressed('ui_right'):
		input.x += 1
	if Input.is_action_pressed('ui_left'):
		input.x -= 1
	if Input.is_action_pressed('ui_down'):
		input.y += 1
	if Input.is_action_pressed('ui_up'):
		input.y -= 1
	return input


