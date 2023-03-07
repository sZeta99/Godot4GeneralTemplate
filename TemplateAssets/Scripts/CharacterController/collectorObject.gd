extends Area2D

signal coin_collected

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	emit_signal("coin_collected")
	body.queue_free()
	print_debug("Body freed")
	pass # Replace with function body.
