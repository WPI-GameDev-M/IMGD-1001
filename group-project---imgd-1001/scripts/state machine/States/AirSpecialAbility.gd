class_name AirSpecialAbility
extends State

@export var legs_Ability : AbilityResource


var next_state

func enter() -> void:
	if legs_Ability:
		legs_Ability.on_enter(player)
	else:
		transitioned.emit('InAir/Falling')

func physics_update(delta: float) -> void:
	if not legs_Ability:
		transitioned.emit('InAir/Falling')
	else:
		next_state = legs_Ability.on_physics_update(player, delta)
	
	if next_state != "":
		
		transitioned.emit(next_state)

func exit() -> void:
	if legs_Ability:
		legs_Ability.on_exit(player)
