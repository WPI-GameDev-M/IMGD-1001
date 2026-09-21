class_name GroundSpecialAbility
extends State

@export var legs_Ability : AbilityResource

func enter() -> void:
	if legs_Ability:
		legs_Ability.on_enter(player)
	else:
		transitioned.emit("OnGround/Idle")

func physics_update(delta: float) -> void:
	
	if not legs_Ability:
		transitioned.emit("OnGround/Idle")
	
	var next_state = legs_Ability.on_physics_update(player, delta)

	if next_state != "":
		transitioned.emit("OnGround/" + next_state)

func exit() -> void:
	if legs_Ability:
		legs_Ability.on_exit(player)
