class_name AirSpecialAbility
extends State

@export var legs_Ability : AbilityResource

func enter() -> void:
	if legs_Ability:
		legs_Ability.on_enter(player)
	else:
		transitioned.emit('InAir')

func physics_update(delta: float) -> void:
	if not legs_Ability:
		transitioned.emit('InAir')
	
	var next_state = legs_Ability.on_physics_update(player, delta)
	if next_state != "":
		transitioned.emit(next_state)

func exit() -> void:
	if legs_Ability:
		legs_Ability.on_exit(player)
