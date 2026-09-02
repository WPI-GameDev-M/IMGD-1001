extends Control

@onready var grid_container: GridContainer = $TemporaryName/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for button in grid_container.get_children():
		if button is Button:
			
			button.mouse_entered.connect(_on_mouse_entered.bind(button))
			button.mouse_exited.connect(_on_mouse_exited.bind(button))
			

func _on_mouse_entered(chosen_button: Button) -> void:
	var texture = chosen_button.get_node("TextureRect")
	texture.modulate = Color(0.8,0.8,0.8) # Replace with function body.

func _on_mouse_exited(chosen_button: Button) -> void:
	var texture = chosen_button.get_node("TextureRect")
	texture.modulate = Color(1,1,1) # Replace with function body.


func _on_button_pressed_Start() -> void:
	pass # Replace with function body.


func _on_button_2_pressed_Version_Notes() -> void:
	pass # Replace with function body.

func _on_button_3_pressed_Credits() -> void:
	pass # Replace with function body.


func _on_button_4_pressed_Exit() -> void:
	get_tree().quit()
