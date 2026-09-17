class_name Falling
extends State

var gravity = 980
var timeSinceSpace: float
var AIR_SPEED = 300
func enter() -> void:
	print('Entering Falling')

func physics_update(delta: float) -> void:
	var character = state_machine.get_parent()
	
	character.velocity.y += gravity * delta
	
	var direction = Input.get_axis("Left", "Right")
	character.velocity.x = direction * AIR_SPEED
	
	character.move_and_slide()
	
	if character.is_on_floor():
		print('On floor')
		if character.velocity.x == 0:
			state_machine.change_state('Idle')
		else:
			state_machine.change_state('OnGround')

func handle_input(event: InputEvent) -> void:
	pass
