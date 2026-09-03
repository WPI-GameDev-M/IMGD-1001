extends Control

@onready var grid_container: GridContainer = $buttonsContainer
@onready var credits: PanelContainer = $credits
@onready var version_notes: PanelContainer = $versionNotes

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for button in grid_container.get_children():
		if button is Button:
			button.mouse_entered.connect(_on_mouse_entered.bind(button))
			button.mouse_exited.connect(_on_mouse_exited.bind(button))

func _on_mouse_entered(chosen_button: Button) -> void:
	var texture = chosen_button.get_node("TextureRect")
	audio_stream_player_2d.play()
	texture.modulate = Color(0.8,0.8,0.8) # Replace with function body.
	

func _on_mouse_exited(chosen_button: Button) -> void:
	var texture = chosen_button.get_node("TextureRect")
	texture.modulate = Color(1,1,1) # Replace with function body.


func _on_button_pressed_Start() -> void:
	pass # Replace with function body.


func _on_button_2_pressed_Version_Notes() -> void:
	grid_container.visible = false
	version_notes.visible = true
	

func _on_button_3_pressed_Credits() -> void:
	grid_container.visible = false
	credits.visible = true


func _on_button_4_pressed_Exit() -> void:
	get_tree().quit()


func _on_button_pressed_Back() -> void:
	if credits.visible == true:
		credits.visible = false
		grid_container.visible = true
	else:
		version_notes.visible = false
		grid_container.visible = true


func _on_button_mouse_entered_Back() -> void:
	audio_stream_player_2d.play()
