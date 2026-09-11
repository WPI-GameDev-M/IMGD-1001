extends Node2D

signal legs_changed(new_arms: Arms)

@export var legs_array : Array[PackedScene]
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var player: CharacterBody2D = $"../.."



var current_legs : Legs = null
var current_index : int = 0

# We need the ability to track the current weapon, add a weapon to the list, check if we already have one
# when we pick another set up, then swap between the two

func _ready() -> void:
	if legs_array.size() > 0:
		equip_arms(0)

func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("next_arms"):
	#	cycle_arms(1)
	#if event.is_action_pressed("prev_arms"):
	#	cycle_arms(-1)
	if event.is_action_pressed("Legs"):
		current_legs.use()
		
func equip_arms(index: int) -> void:
	if index < 0 or index >= legs_array.size():
		return
	
	if current_legs:
		current_legs.exit_arms()
		current_legs.queue_free()
	
	current_index = index
	
	var new_legs: PackedScene = legs_array[index]
	current_legs = new_legs.instantiate() as Legs
	
	if current_legs:
		add_child(current_legs)
		current_legs.enter_legs(animation_player, player)
		emit_signal("legs_changed")
	
	
func cycle_legs(direction: int) -> void:
	pass
	
