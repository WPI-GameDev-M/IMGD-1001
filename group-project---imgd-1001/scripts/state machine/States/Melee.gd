class_name Melee
extends State

var arms: Arms = null
var timer: float 

func enter() -> void:
	timer = .15
	arms = state_machine.current_arms
	arms.enable_hitbox()


func physics_update(delta: float) -> void:
	timer -= delta
	if timer <= 0:
		exit()

func exit() -> void:
	print('I am exiting!')
	arms.disable_hitbox()
	get_parent().active_substate = null
	transitioned.emit('ArmsIdle')
