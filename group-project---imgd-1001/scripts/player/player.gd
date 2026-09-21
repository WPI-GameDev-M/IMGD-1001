class_name Player
extends CharacterBody2D



@export var SPEED : float
@export var JUMP_VELOCITY: float
@export var AIR_SPEED: float
var standard_AIR_SPEED: float

@export var health : float

var direction : float
var facing_direction: float = 1.0
var timeSinceGrounded = 0.0
var timeSinceSpace = 1.0
var gravity = 980

@onready var state_machine: StateMachine = $StateMachine
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	state_machine.player = self
	standard_AIR_SPEED = AIR_SPEED
	
	

func _physics_process(delta: float) -> void:
	direction = Input.get_axis("Left", "Right")
	
	if direction != 0:
		facing_direction = direction

	match facing_direction:
		-1 : sprite.flip_h = true
		1: sprite.flip_h = false
