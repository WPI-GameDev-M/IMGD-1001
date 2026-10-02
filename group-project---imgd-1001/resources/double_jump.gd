class_name DoubleJump
extends AbilityResource

func on_enter(player: Player) ->void:
		player.velocity.y = player.JUMP_VELOCITY

func on_exit(player: Player) -> void:
	pass

func on_physics_update(player: Player, delta) -> String:
	if player.velocity.y <= 0:
		return "InAir/Falling"
	else:
		return ""
