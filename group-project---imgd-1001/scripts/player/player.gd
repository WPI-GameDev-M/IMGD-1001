class_name Player
extends CharacterBody2D

@onready var flip_container: Node2D = $FlipContainer
@onready var animated_sprite_top: AnimatedSprite2D = $FlipContainer/AnimatedSpriteTop2D
@onready var animated_sprite_bottom: AnimatedSprite2D = $FlipContainer/AnimatedSpriteBottom2D


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
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Coyote time
	if is_on_floor():
		timeSinceGrounded = 0
	else:
		timeSinceGrounded += delta

	# Jump buffering
	if Input.is_action_just_pressed("Jump"):
		timeSinceSpace = 0.0
	else:
		timeSinceSpace += delta

	# Handles jump.
	if timeSinceSpace <= 0.2 and timeSinceGrounded <= 0.15:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		flip_container.scale.x = direction
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if is_on_floor():
		if direction == 0:
			animated_sprite_top.play("idle_top")
			animated_sprite_bottom.play("idle_bottom")
		else:
			animated_sprite_top.play("running_top")
			animated_sprite_bottom.play("running_bottom")
	else:
		animated_sprite_top.play("jumping_top")
		animated_sprite_bottom.play("jumping_bottom")

	match facing_direction:
		-1 : sprite.flip_h = true
		1: sprite.flip_h = false
