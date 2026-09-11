extends Legs


@onready var dash_timer: Timer = $Timer
@export var dash_speed : float
var character : CharacterBody2D

var is_dashing = false
var can_dash = true


func enter_legs(animator: AnimationPlayer, player: CharacterBody2D) -> void:
	character = player

func exit_legs() -> void:
	pass

func use() -> void:
	is_dashing = true
	can_dash = false
	dash_timer.start()
	

	
