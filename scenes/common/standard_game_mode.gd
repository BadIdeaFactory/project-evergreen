extends GameMode
class_name StandardGameMode

@export var start_date: String = "01/01/1988" 
@export var loss_date: String = "01/01/2050"
@export var carbon_in_atmosphere_ppm: float = 350.51
@export var loss_temperature_anomaly: float = 1.50
@export var time_component: TimeComponent;
@export var temperature_component: TemperatureComponent
@export var global_carbon_component: GlobalCarbonComponent

var loss_timestamp: int
var view_model: GameModeViewModel = GameModeViewModel.new()

enum LossCondition { TEMPERATURE_EXCEEDED, TIME_EXCEEDED }

func _ready() -> void:
	time_component.set_timestamp_from_date_string(start_date)
	loss_timestamp = time_component.get_timestamp_from_date_string(loss_date)
	time_component.on_new_day.connect(_handle_new_day)
	temperature_component.on_temperature_anomaly_changed.connect(_handle_new_temperature_anomaly)
	ViewModelRegistry.register(ViewModelRegistry.Keys.GAME_MODE, view_model)
	global_carbon_component.set_carbon_in_atmosphere(carbon_in_atmosphere_ppm)
	
func _handle_new_day(new_timestamp: float) -> void:
	if new_timestamp >= loss_timestamp:
		view_model.set_loss_condition_reached(LossCondition.TIME_EXCEEDED)

func _handle_new_temperature_anomaly(new_temperature_anomaly: float):
	if new_temperature_anomaly >= loss_temperature_anomaly:
		view_model.set_loss_condition_reached(LossCondition.TEMPERATURE_EXCEEDED)
