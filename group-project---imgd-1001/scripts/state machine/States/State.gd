class_name State
extends Node

signal transitioned(new_state_string: String)

var state_machine: StateMachine
var parent_state : State
@onready var player = owner as CharacterBody2D

var direction: float

func _ready() -> void:
	await owner.ready
	if get_parent() is State:
		parent_state = get_parent()
			
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
