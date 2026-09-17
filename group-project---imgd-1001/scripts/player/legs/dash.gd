extends Legs

signal is_dashing(dashState: bool)

@onready var dash_timer: Timer = $Timer
@onready var player: CharacterBody2D = self.get_parent().owner
@export var dash_speed : float

var flipper: Node2D

var true_Direction = 1
var is_Dashing = false
var can_Dash = true


func enter_legs(animator: AnimationPlayer) -> void:	
	legs_manager = get_parent()
	flipper = legs_manager.get_parent()
	if legs_manager && legs_manager.has_method('_legs_action_signal'):
		is_dashing.connect(legs_manager._legs_action_signal)

# Cleanup for state
func exit_legs() -> void:
	pass


# Player input logic
func handle_input(event: InputEvent) -> void:
	pass

func use() -> void:
	#print('Dashing!')
	var direction = flipper.scale.x
	
	if (!is_Dashing && can_Dash) && player.is_on_floor():
		start_dash()
	
	if is_Dashing:
		player.velocity.x = direction * dash_speed
		player.velocity.y = 0
		
	player.move_and_slide()
		
	
	

func start_dash() -> void:
	is_Dashing = true
	can_Dash = false
	is_dashing.emit(is_Dashing)
	dash_timer.start()
	
	

func _on_timer_timeout() -> void:
	is_Dashing = false
	can_Dash = true
	is_dashing.emit(is_Dashing)
