extends Arms

@export var projectile: PackedScene
@onready var muzzle: Marker2D = $Muzzle

var player_animator: AnimationPlayer

func enter_arms(animator: AnimationPlayer) -> void:
	player_animator = animator

func use() -> void:
	print('FIRE')
	if projectile:
		var projectile = projectile.instantiate()
		projectile.global_position = muzzle.global_position 
		projectile.global_rotation = muzzle.global_rotation
		get_tree().current_scene.add_child(projectile)
