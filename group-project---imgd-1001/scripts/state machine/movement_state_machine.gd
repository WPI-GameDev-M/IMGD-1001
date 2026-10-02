class_name MovementStateMachine
extends StateMachine

@onready var ground_special_ability: GroundSpecialAbility = $OnGround/GroundSpecialAbility
@onready var air_special_ability: AirSpecialAbility = $InAir/AirSpecialAbility

var current_legs : AbilityResource = null

var active_state_stack: Array[State] = []

func ready() -> void: 
	if ground_special_ability.legs_Ability:
		current_legs = ground_special_ability.legs_Ability
	elif air_special_ability.legs_Ability:
		current_legs = air_special_ability.legs_Ability

func _proccess(delta: float) -> void:
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
			

func leg_equip(new_legs: AbilityResource) -> void:
	if new_legs != current_legs:
		match new_legs.ability_type:
			AbilityResource.Type.GROUND:
				air_special_ability.legs_Ability = null
				ground_special_ability.legs_Ability = new_legs as AbilityResource
			AbilityResource.Type.AIR: 
				ground_special_ability.legs_Ability = null
				air_special_ability.legs_Ability = new_legs as AbilityResource
	else:
		return

func _on_state_transitioned(new_state_path: String) -> void:
	print("TRANSITION " + new_state_path)
	var new_state: State = get_node(new_state_path) as State
	if new_state:
		change_state(new_state)
