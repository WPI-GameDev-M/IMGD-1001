class_name Jumping
extends State


func enter() -> void:
	player.velocity.y = player.JUMP_VELOCITY

func physics_update(delta: float) -> void:
	
	player.velocity.x = (player.direction * player.AIR_SPEED)
	
	if player.velocity.y <= 0:
		transitioned.emit("InAir/Falling")
