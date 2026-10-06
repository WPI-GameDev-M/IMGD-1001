class_name Falling
extends State



func enter() -> void:
	pass
	#print('Entering Falling')

func physics_update(delta: float) -> void:
	
	player.velocity.x = (player.direction * player.AIR_SPEED)
	
	if player.is_on_floor():
		if player.velocity.x == 0:
			transitioned.emit('OnGround/LegsIdle')
		else:
			transitioned.emit('OnGround/Moving')
			

func handle_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('Legs'):
		transitioned.emit('InAir/AirSpecialAbility')
