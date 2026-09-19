extends CharacterBody2D

@onready var flip_container: Node2D = $FlipContainer
@onready var animated_sprite_top: AnimatedSprite2D = $FlipContainer/AnimatedSpriteTop2D
@onready var animated_sprite_bottom: AnimatedSprite2D = $FlipContainer/AnimatedSpriteBottom2D

var SPEED = 300.0
const JUMP_VELOCITY = -400.0
var current_Arms : Arms
var timeSinceGrounded = 0.0
var timeSinceSpace = 1.0
#var current_Legs : Legs
var current_Legs : Legs

var DASH_SPEED = 600.0
var is_dashing = false
var can_dash = true

func _ready() -> void:
	pass

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

	move_and_slide()
