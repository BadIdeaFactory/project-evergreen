extends ViewModelBase
class_name TemperatureViewModel

signal on_temperature_anomaly_changed (new_temperature_anomaly: float)

func set_temperature_anomaly(temperature_anomaly: float):
	on_temperature_anomaly_changed.emit(temperature_anomaly)
	
