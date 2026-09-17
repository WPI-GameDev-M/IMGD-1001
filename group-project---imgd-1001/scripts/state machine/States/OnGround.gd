class_name OnGround
extends State

@onready var flip_container: Node2D = $"../../FlipContainer"

var SPEED = 300.0
var timeSinceGrounded = 0.0
var timeSinceSpace = 1.0
var current_Legs_Action_State : bool 

func enter() -> void:
	print("Walking")


func physics_update(delta: float) -> void:
	var character = state_machine.get_parent()
	var direction = Input.get_axis("Left", "Right")
	
	if direction == 0:
			state_machine.change_state('Idle')
			return
			
	print(current_Legs_Action_State)
	if !_on_legs_manager_legs_action(current_Legs_Action_State):
		
		character.velocity.x = direction * SPEED
		flip_container.scale.x = direction
		
			
		if character.is_on_floor():
			timeSinceGrounded = 0.0
		else:
			timeSinceGrounded += delta
				
				
		if not character.is_on_floor():
			if timeSinceGrounded > .015:
				state_machine.change_state("Falling")
	
	character.move_and_slide()	

	#print(character.velocity.x)
func handle_input(event: InputEvent) -> void:
		
	if Input.is_action_just_pressed("Jump"):
		if timeSinceGrounded <= .015:
			#print("Coyote!")
			state_machine.change_state("Jumping")


func _on_legs_manager_legs_action(current_Action_State: bool) -> bool:
	current_Legs_Action_State = current_Action_State
	return current_Legs_Action_State
