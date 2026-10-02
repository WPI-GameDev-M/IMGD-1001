class_name Ranged
extends State


var arms: Arms

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	arms = state_machine.current_arms
	arms.use()
	exit()

func exit() -> void:
	get_parent().active_substate = null
	transitioned.emit('ArmsIdle')
