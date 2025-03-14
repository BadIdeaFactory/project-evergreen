extends Control

var timer_view_model: TimerViewModel

@export var date_label: Label
@export var pause_button: TextureButton
@export var speed_up_button: TextureButton
@export var temperature_anomaly_label: Label

func _ready() -> void:
	timer_view_model = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.TIMER) as TimerViewModel
	if timer_view_model:
		timer_view_model.on_formatted_time_updated.connect(_handle_formatted_datetime_changed)
	pause_button.toggled.connect(_handle_pause_button_clicked)
	speed_up_button.toggled.connect(_handle_speed_up_button_clicked)
	var temperature_view_model = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.TEMPERATURE) as TemperatureViewModel
	if temperature_view_model:
		temperature_view_model.on_temperature_anomaly_changed.connect(_on_temperature_anomaly_changed)
	
func _handle_formatted_datetime_changed(new_datetime: String):
	date_label.text = new_datetime
	
func _handle_pause_button_clicked(_is_toggled: bool):
	timer_view_model.toggle_paused()

func _handle_speed_up_button_clicked(_is_toggled: bool):
	timer_view_model.toggle_speed_up()

func _on_temperature_anomaly_changed(new_temperature_anomaly: float):
	temperature_anomaly_label.text = str(new_temperature_anomaly)
