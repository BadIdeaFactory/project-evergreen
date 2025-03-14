extends Node

@onready var view_model = TemperatureViewModel.new()

@export var time_component: TimeComponent

# TODO: Currently sourced from https://climate.nasa.gov/vital-signs/global-temperature/?intent=121. 
# This should be based on the actual start date of the game.
var temperature_anomaly_celsius = 1.28

func _ready() -> void:
	ViewModelRegistry.register(ViewModelRegistry.Keys.TEMPERATURE, view_model)
	time_component.on_new_day.connect(_handle_new_day)
	
func _handle_new_day(new_temperature_anomaly: int) -> void:
	# TODO: this is a large increase for testing. it should be based on the state of the world.
	temperature_anomaly_celsius += .01
	view_model.set_temperature_anomaly(temperature_anomaly_celsius)
