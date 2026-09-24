class_name Moving
extends State



func enter() -> void:
	print("Walking")


func physics_update(delta: float) -> void:
	
	if player.direction == 0:
			transitioned.emit('OnGround/Idle')
		
	player.velocity.x = (player.direction * player.SPEED)
		
	if player.is_on_floor():
		player.timeSinceGrounded = 0.0
	else:
		player.timeSinceGrounded += delta
				
				
	if not player.is_on_floor():
		if player.timeSinceGrounded > .05:
			transitioned.emit("InAir/Falling")	

	#print(character.velocity.x)
func handle_input(event: InputEvent) -> void:
		
	if Input.is_action_just_pressed("Jump"):
		if player.timeSinceGrounded <= .015:
			#print("Coyote!")
			transitioned.emit("InAir/Jumping")
