extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	hide()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			get_tree().paused = false
			hide()
		else:
			get_tree().paused = true
			show()


func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/pause_menu.tscn")
