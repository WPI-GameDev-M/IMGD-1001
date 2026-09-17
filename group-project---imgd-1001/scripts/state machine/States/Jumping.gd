class_name Jumping
extends State

var JUMP_VELOCITY = -400.0
var timeSinceGrounded = 0.0

var gravity = 980
var AIR_SPEED = 300.0

func enter() -> void:
	var character = state_machine.get_parent()
	character.velocity.y = JUMP_VELOCITY

func physics_update(delta: float) -> void:
	var character = state_machine.get_parent()
	
	character.velocity.y += gravity * delta
	
	var direction = Input.get_axis("Left", "Right")
	character.velocity.x = direction * AIR_SPEED
	
	character.move_and_slide()
	
	if character.velocity.y >= 0:
		state_machine.change_state("Falling")
