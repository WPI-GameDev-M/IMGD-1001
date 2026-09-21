class_name OnGround
extends State


func enter() -> void:
	player.AIR_SPEED = player.standard_AIR_SPEED
	


func physics_update(delta: float) -> void:
	
	#match player.facing_direction:
		#-1 : player.sprite.flip_h = true
		#1: player.sprite.flip_h = false
	
	
	if not player.is_on_floor():
		transitioned.emit('InAir/Falling')
	
	if Input.is_action_just_pressed('Jump'):
		transitioned.emit('InAir/Jumping')
	
	if Input.is_action_just_pressed('Legs'):
		transitioned.emit('OnGround/GroundSpecialAbility')
		
		
	player.move_and_slide()
	
	
