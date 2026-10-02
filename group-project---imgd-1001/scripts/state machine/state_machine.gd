class_name StateMachine
extends Node

var player: CharacterBody2D


@export var initial_state: State

func _ready() -> void:
	await  owner.ready
	for superState in get_children():
		if superState is State:
			superState.state_machine = self
		for subState in superState.get_children():
			if subState is State:
				subState.state_machine = self
	
	if initial_state:
		change_state(initial_state)
	
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	pass
	#print(current_state.name)

func _input(event: InputEvent) -> void:
	pass

func change_state(new_state: State) -> void:
	pass
