class_name Jumping
extends State

@onready var flip_container: Node2D = $"../../FlipContainer"

var JUMP_VELOCITY = -400.0
var timeSinceGrounded = 0.0

var gravity = 980
var AIR_SPEED = 300.0

func enter() -> void:
	var character = state_machine.get_parent()
	character.velocity.y = JUMP_VELOCITY

func physics_update(delta: float) -> void:
	var character = state_machine.get_parent()
	var direction = Input.get_axis("Left", "Right")
	character.velocity.y += gravity * delta
	
	character.velocity.x = direction * AIR_SPEED
	#if direction == -1 or 1:
		#flip_container.scale.x = direction
	
	character.move_and_slide()
	
	if character.velocity.y >= 0:
		state_machine.change_state("Falling")
