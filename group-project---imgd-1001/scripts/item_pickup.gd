extends Area2D

func _on_body_entered(body: CharacterBody2D) -> void:
	queue_free()
	print_debug("COLLIDED")
	pass # Replace with function body.
