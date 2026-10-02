class_name Attack
extends State

@onready var melee: Melee = $Melee
@onready var ranged: Ranged = $Ranged

var active_substate: State = null

func enter() -> void:
	print("Swing")
	var arms = state_machine.current_arms
	
	match arms.arms_type:
		arms.Type.MELEE:
			active_substate = melee
		arms.Type.RANGED: 
			active_substate = ranged
	
	
	if active_substate:
		active_substate.enter()
	else:
		transitioned.emit('ArmsIdle')
		

func handle_input(event: InputEvent) -> void:
	pass

func physics_update(delta: float) -> void:
	if active_substate:
		active_substate.physics_update(delta)
	else:
		transitioned.emit('ArmsIdle')

func exit() -> void:
	if active_substate:
		active_substate.exit()
	active_substate = null
