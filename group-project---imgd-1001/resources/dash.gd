class_name Dash
extends AbilityResource

@export var DASH_TIMER: float
@export var DASH_SPEED: float
@export var DASH_AIR_SPEED: float
var dashCountDown : float

func on_enter(player: Player) -> void:
	player.AIR_SPEED = DASH_AIR_SPEED
	dashCountDown = DASH_TIMER
	var direction =  player.direction
	
	if direction == 0:
		direction = player.facing_direction
		
	player.velocity.x = direction * DASH_SPEED
	player.velocity.y = 0
	

func on_physics_update(player: Player, delta) -> String:
	dashCountDown -= delta
	print(dashCountDown)
	
	if dashCountDown <= 0 && player.is_on_floor():
		player.velocity.x = 0
		return "Idle"
	else:
		return ""
func on_exit(player: Player) -> void:
	pass
