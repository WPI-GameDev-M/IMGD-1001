class_name ArmsStateMachine
extends StateMachine


@onready var arms_manager: Node2D = $"../ArmsManager"
@export var initial_arms : PackedScene

var current_state: State
var current_arms: Arms

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
	
	if initial_arms:
		equip_arms(initial_arms)

func _proccess(delta: float) -> void:
	if current_state:
		current_state.update(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)
	

func _input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_input(event)

func change_state(new_state_command: State) -> void:
	if current_state == new_state_command:
		return 
	
	if current_state:
		current_state.exit()
		
	var new_state: Node = new_state_command
	
	current_state = new_state
		
	current_state.enter()
	if not current_state.transitioned.is_connected(_on_state_transitioned):
		current_state.transitioned.connect(_on_state_transitioned)
			

func equip_arms(new_arms : PackedScene) -> void:
	if current_state:
		current_state.exit()
	
	if current_arms:
		current_arms.queue_free()
	
	current_arms = new_arms.instantiate() as Arms
	arms_manager.add_child(current_arms)
	
	_on_state_transitioned("ArmsIdle")
	

func _on_state_transitioned(new_state_path: String) -> void: 
	print("TRANSITION " + new_state_path)
	var new_state: State = get_node(new_state_path) as State
	if new_state:
		change_state(new_state)
		

func arms_direction_update() -> void:
	arms_manager.scale.x = player.facing_direction
