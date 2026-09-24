extends CanvasLayer

var time_left: int = 30
var player

@onready var timer_label: Label = $Control/TimerLabel
@onready var countdown_timer: Timer = $Control/Countdown
@onready var health_bar: ProgressBar = $Control/HealthBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_label.text = "00:30"
	player = get_tree().get_first_node_in_group("player")
	
	if player:
		health_bar.value = player.health

func _process(_delta: float) -> void:
	if player:
		health_bar.value = player.health

func _on_countdown_timer_timeout():
	time_left -= 1
	var minutes = time_left / 60
	var seconds = time_left % 60
	
	timer_label.text = "%02d:%02d" % [minutes, seconds]
	
	if time_left <= 0:
		get_tree().reload_current_scene()
	
	
