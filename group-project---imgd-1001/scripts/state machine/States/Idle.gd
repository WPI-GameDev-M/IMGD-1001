class_name Idle
extends State

func enter() -> void:
	print("Entering Idle State")
	
	
func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		transitioned.emit("InAir/Falling")
	
	
func handle_input(event: InputEvent) -> void:
	if  Input.get_axis("Left", "Right") :
		transitioned.emit("OnGround/Moving")
	elif Input.is_action_just_pressed("Jump"):
		transitioned.emit("InAir/Jumping")

	
