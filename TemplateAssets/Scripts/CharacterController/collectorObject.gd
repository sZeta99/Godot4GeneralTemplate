extends Area2D

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	body.queue_free()
	print_debug("Body freed")
	pass # Replace with function body.
