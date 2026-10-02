class_name Arms
extends Node2D

enum Type {MELEE, RANGED}

@export var arms_type: Type
@export var arms_name: String

func enter_arms(animator: AnimationPlayer) -> void:
	pass

func exit_arms() -> void:
	pass

func use() -> void:
	pass
