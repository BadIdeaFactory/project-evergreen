extends Node
class_name TemperatureComponent

@onready var view_model = TemperatureViewModel.new()

@export var time_component: TimeComponent

signal on_temperature_anomaly_changed (new_temperature_anomaly: float)

# TODO: Currently sourced from https://climate.nasa.gov/vital-signs/global-temperature/?intent=121. 
# This should be based on the actual start date of the game.
var temperature_anomaly_celsius = 1.28

func _ready() -> void:
	ViewModelRegistry.register(ViewModelRegistry.Keys.TEMPERATURE, view_model)
	time_component.on_new_day.connect(_handle_new_day)
	
func _handle_new_day(new_timestamp: int) -> void:
	# TODO: this is a large increase for testing. it should be based on the state of the world.
	set_temperature_anomaly(temperature_anomaly_celsius + .01)

func set_temperature_anomaly(new_temperature_anomaly_celsius: float) -> void: 
	temperature_anomaly_celsius = new_temperature_anomaly_celsius
	on_temperature_anomaly_changed.emit(temperature_anomaly_celsius)
	view_model.set_temperature_anomaly(temperature_anomaly_celsius)
