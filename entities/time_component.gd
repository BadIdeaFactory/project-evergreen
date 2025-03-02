extends Node2D

@onready var view_model = TimerViewModel.new()

var time_since_last_update = 0
var time = Time.get_unix_time_from_system()

func _ready():
	ViewModelRegistry.register(ViewModelRegistry.Keys.TIMER, view_model)
	
func _process(delta: float): 
	time_since_last_update += delta 
	if time_since_last_update > 1:
		time_since_last_update = 0
		time += 86400 # seconds in a day
		view_model.set_time(time)
