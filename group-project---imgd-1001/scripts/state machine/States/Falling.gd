class_name Falling
extends State



func enter() -> void:
	print('Entering Falling')

func physics_update(delta: float) -> void:
	
	player.velocity.x = (player.direction * player.AIR_SPEED)
	
	if player.is_on_floor():
		if player.velocity.x == 0:
			transitioned.emit('OnGround/Idle')
		else:
			transitioned.emit('OnGround/Moving')
			

func handle_input(event: InputEvent) -> void:
	pass
