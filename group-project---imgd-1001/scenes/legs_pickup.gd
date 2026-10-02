extends Area2D


@export var stored_leg: AbilityResource


func _on_body_entered(body: CharacterBody2D) -> void:
	if body.has_node("MovementStateMachine") and stored_leg:
		var legs_machine = body.get_node("MovementStateMachine") as MovementStateMachine
		legs_machine.leg_equip(stored_leg)
	queue_free()
	
