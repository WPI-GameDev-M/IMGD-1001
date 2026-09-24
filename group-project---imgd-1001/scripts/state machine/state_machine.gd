class_name StateMachine
extends Node

var player: CharacterBody2D


@export var initial_state: State
var active_state_stack: Array[State] = []

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
	for state in active_state_stack:
		state.update(delta)


func _physics_process(delta: float) -> void:
	
	for state in active_state_stack:
		state.physics_update(delta)
	#print(current_state.name)

func _input(event: InputEvent) -> void:
	for state in active_state_stack:
		state.handle_input(event)

func change_state(new_state: State) -> void:
	for state in active_state_stack:
		state.exit()
		
	active_state_stack.clear()
	### Might require further filter for specific state
	var state_path: Node = new_state
	var cache_stack: Array[State] = []
	while state_path is State:
		cache_stack.push_front(state_path)
		state_path = state_path.get_parent()
	
	active_state_stack = cache_stack
		
	for state in active_state_stack:
		state.enter()
		if not state.transitioned.is_connected(_on_state_transitioned):
			state.transitioned.connect(_on_state_transitioned)
	
	for state in active_state_stack:
		state.enter()
	
	print(active_state_stack)

func _on_state_transitioned(new_state_path: String) -> void:
	print("TRANSITION " + new_state_path)
	var new_state: State = get_node(new_state_path) as State
	if new_state:
		change_state(new_state)
