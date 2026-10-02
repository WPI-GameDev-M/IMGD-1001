extends Area2D

@export var bullet_Speed: float

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	position += transform.x * bullet_Speed * delta

func _on_body_entered(area: Area2D) -> void:
	if not area.is_in_group('Player'):
		queue_free()
