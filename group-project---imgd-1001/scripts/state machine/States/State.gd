class_name State
extends Node

# Ref to state machine
var state_machine: StateMachine

# Initalization for state
func enter() -> void:
	pass

# Cleanup for state
func exit() -> void:
	pass

# Frame logic update
func update(delta: float) -> void:
	pass

# Character movement logic
func physics_update(delta: float) -> void:
	pass

# Player input logic
func handle_input(event: InputEvent) -> void:
	pass
