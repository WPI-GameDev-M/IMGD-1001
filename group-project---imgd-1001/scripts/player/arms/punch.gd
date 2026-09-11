extends Arms

@onready var hitbox: CollisionShape2D = $Area2D/hitbox
var player_animator: AnimationPlayer

func enter_arms(animator: AnimationPlayer) -> void:
	player_animator = animator

func use() -> void:
	if player_animator and not player_animator.is_playing():
		player_animator.play("attack")
	
func enable_hitbox() -> void:
	hitbox.disabled = false

func disable_hitbox() -> void:
	hitbox.disabled = true
