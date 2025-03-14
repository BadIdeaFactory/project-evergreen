extends Node2D
class_name TimeComponent

@onready var view_model = TimerViewModel.new()

@export var day_update_interval_seconds: int = 1
@export var default_speed: float = 1
@export var fast_speed: float = 3

signal on_new_day (new_timestamp: int)

var time_since_last_update: float = 0
var time: float = Time.get_unix_time_from_system()
var is_paused: bool = false
var speed: float = default_speed

func _ready():
	view_model.initialize(self)
	ViewModelRegistry.register(ViewModelRegistry.Keys.TIMER, view_model)
	
func _process(delta: float):
	if is_paused:
		return
	 
	time_since_last_update += delta 
	if time_since_last_update > (day_update_interval_seconds / speed):
		time_since_last_update = 0
		time += 86400 # seconds in a day
		on_new_day.emit(time)
		view_model.set_time(time)

func toggle_paused():
	is_paused = !is_paused

func toggle_speed_up():
	if speed == default_speed: 
		speed = fast_speed
	else:
		speed = default_speed 
