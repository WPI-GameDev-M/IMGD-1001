class_name ArmsIdle
extends State

func enter() -> void:
	pass
	
	
func physics_update(delta: float) -> void:
	pass
	
	
func handle_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Action"):
		print('INPUT')
		transitioned.emit("Attack")
		

	
