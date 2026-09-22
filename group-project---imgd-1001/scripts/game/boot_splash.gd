extends Control

## initialize the main menu and unpack it to use to swap out of boot screen
@onready var main_menu = preload("res://scenes/system_management/main_menu.tscn")

## Swaps the scene to the main menu
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(main_menu)
	queue_free()
	
# Click spacebar to skip animation
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Jump"):
			get_tree().change_scene_to_packed(main_menu)
			queue_free()
