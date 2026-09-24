class_name InAir
extends State


func enter() -> void:
	pass

func physics_update(delta: float) -> void:
	
	#match player.facing_direction:
		#-1 : player.sprite.flip_h = true
		#1: player.sprite.flip_h = false
		
	print(player.sprite.flip_h)
	print(player.AIR_SPEED)
	player.velocity.y += (player.gravity * delta)
	
	player.move_and_slide()
	
	
