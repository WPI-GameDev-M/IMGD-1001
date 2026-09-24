class_name ArmsManager
extends Node2D

signal arms_changed(new_arms: Arms)

@export var arms_array : Array[PackedScene]
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


var current_arms : Arms = null
var current_index : int = 0

# We need the ability to track the current weapon, add a weapon to the list, check if we already have one
# when we pick another set up, then swap between the two

func _ready() -> void:
	if arms_array.size() > 0:
		equip_arms(0)

func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("next_arms"):
	#	cycle_arms(1)
	#if event.is_action_pressed("prev_arms"):
	#	cycle_arms(-1)
	if event.is_action_pressed("Action"):
		current_arms.use()
		
func equip_arms(index: int) -> void:
	if index < 0 or index >= arms_array.size():
		return
	
	if current_arms:
		current_arms.exit_arms()
		current_arms.queue_free()
	
	current_index = index
	
	var new_arms: PackedScene = arms_array[index]
	current_arms = new_arms.instantiate() as Arms
	
	if current_arms:
		add_child(current_arms)
		current_arms.enter_arms(animation_player)
		emit_signal("arms_changed")
	
	
func cycle_arms(direction: int) -> void:
	pass
	
func activate_current_arms_hitbox() -> void:
	if current_arms and current_arms.has_method("enable_hitbox"):
		current_arms.enable_hitbox()

func deactivate_current_weapon_hitbox() -> void:
	if current_arms and current_arms.has_method("disable_hitbox"):
		current_arms.disable_hitbox()
	
