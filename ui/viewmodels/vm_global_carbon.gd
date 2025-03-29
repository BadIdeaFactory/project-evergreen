extends ViewModelBase
class_name GlobalCarbonViewModel

signal on_carbon_in_atmosphere_changed (new_carbon_level_ppm: float)

func set_carbon_in_atmosphere(new_carbon_level_ppm: float):
	on_carbon_in_atmosphere_changed.emit(new_carbon_level_ppm)
