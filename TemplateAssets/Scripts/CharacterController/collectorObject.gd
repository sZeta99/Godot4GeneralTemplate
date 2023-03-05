extends Area2D

func _on_body_entered(body):
	body.queue_free()
	pass # Replace with function body.
