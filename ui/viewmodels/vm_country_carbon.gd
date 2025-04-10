extends ViewModelBase
class_name CountryCarbonViewModel

signal on_buildings_co2_changed(new_value: float)
signal on_power_co2_changed(new_value: float)
signal on_other_industry_co2_changed(new_value: float)
signal on_other_sectors_co2_changed(new_value: float)
signal on_transportation_co2_changed(new_value: float)

var _country_carbon_component: CountryCarbonComponent

func initialize(country_carbon_component: CountryCarbonComponent):
	_country_carbon_component = country_carbon_component

func set_buildings_co2(new_value: float):
	on_buildings_co2_changed.emit(snappedf(new_value, .01))
	
func set_power_co2(new_value: float):
	on_power_co2_changed.emit(snappedf(new_value, .01))
	
func set_transportion_co2(new_value: float):
	on_transportation_co2_changed.emit(snappedf(new_value, .01))
	
func set_other_industry_co2(new_value: float):
	on_other_industry_co2_changed.emit(snappedf(new_value, .01))

func set_other_sectors_co2(new_value: float):
	on_other_sectors_co2_changed.emit(snappedf(new_value, .01))

func rebroadcast():
	on_buildings_co2_changed.emit(snappedf(_country_carbon_component.buildings_co2, .01))
	on_power_co2_changed.emit(snappedf(_country_carbon_component.power_co2, .01))
	on_other_industry_co2_changed.emit(snappedf(_country_carbon_component.other_industry_co2, .01))
	on_other_sectors_co2_changed.emit(snappedf(_country_carbon_component.other_sectors_co2, .01))
	on_transportation_co2_changed.emit(snappedf(_country_carbon_component.transport_co2, .01))
