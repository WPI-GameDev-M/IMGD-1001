class_name AbilityResource
extends Resource

var player = Player

func on_enter(player_ref: Player) ->void:
	player = player_ref

func on_physics_update(player: Player, delta) -> String:
	return ""

func on_exit(player: Player) -> void:
	pass
	
