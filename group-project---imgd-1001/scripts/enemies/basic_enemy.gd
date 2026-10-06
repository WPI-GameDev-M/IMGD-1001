extends CharacterBody2D

var speed = 100
#var velocity = Vector2()
var chase = true
var player
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# var player_test = get_tree().get_nodes_in_group("player")[0]
var health = 100

#checks once a physics tick
func _physics_process(delta):
	# Check if chasing the player
	if chase:
		if player == null:
			player = get_node("res://scenes/player/player.tscn")
		var direction = (player.global_position - global_position).normalized()
		$Sprite.flip_h = direction.x < 0
		velocity.x = direction.x * speed
	else:
		velocity.x = 0
		# Move using the computed velocity
		move_and_slide()
		#move_and_slide(velocity, Vector2.UP)
		pass
#https://godotforums.org/d/39943-enemy-moves-to-player/2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var player = get_tree().get_nodes_in_group("player")[0]
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	 #Var direction = (target.position - position).normalised() 
	 #Velocity = direction * speed
	 #Move_and_slide 
	pass

#detects player collision with enemy
func _on_PlayDetection_body_entered(body):
	if body.name == "Player":
		chase = true

#detects player leaving collission (probably not necessary)
func _on_PlayDetection_body_exited(body):
	if body.name == "Player":
		chase = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
