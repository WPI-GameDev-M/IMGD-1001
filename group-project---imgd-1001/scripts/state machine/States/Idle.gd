class_name Idle
extends State

@onready var player: CharacterBody2D = $"../.."

var legs_Action_State : bool

func enter() -> void:
	print("Entering Idle State")
	player.velocity.x = 0.0
	
func physics_update(delta: float) -> void:
	#print(player.velocity.x)
	if _on_legs_manager_legs_action(legs_Action_State):
		player.move_and_slide()
	if !player.is_on_floor():
		state_machine.change_state('Falling')
	
func handle_input(event: InputEvent) -> void:
	if Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		state_machine.change_state("OnGround")
	elif Input.is_action_just_pressed("Jump"):
		state_machine.change_state("Jumping")


func _on_legs_manager_legs_action(current_Action_State: bool) -> bool:
	legs_Action_State = current_Action_State
	return legs_Action_State
	
