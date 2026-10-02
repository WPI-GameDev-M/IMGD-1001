extends Area2D

@export var stored_arm: PackedScene


func _on_body_entered(body: CharacterBody2D) -> void:
	if body.has_node("ArmsStateMachine") and stored_arm:
		var arms_machine = body.get_node("ArmsStateMachine") as ArmsStateMachine
		arms_machine.equip_arms(stored_arm)
	queue_free()
	
