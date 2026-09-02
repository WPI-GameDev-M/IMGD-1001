extends Control

@onready var main_menu = preload("res://scenes/main_menu.tscn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(main_menu)
	queue_free()
