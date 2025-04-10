extends Node
class_name CountryCarbonComponent

var buildings_co2: float;
var other_industry_co2: float;
var other_sectors_co2: float;
var power_co2: float;
var transport_co2: float;
var net_carbon_emissions: float;
var view_model: CountryCarbonViewModel

func _init():
	view_model = CountryCarbonViewModel.new()
	view_model.initialize(self)

func initialize_carbon(carbon_stats: Dictionary):
	set_buildings_co2(float(carbon_stats["buildings_co2"]))
	set_other_industry_co2(float(carbon_stats["other_industry_co2"]))
	set_other_sectors_co2(float(carbon_stats["other_sectors_co2"]))
	set_power_co2(float(carbon_stats["power_co2"]))
	set_transportation_co2(float(carbon_stats["transport_co2"]))

func set_buildings_co2(new_value: float):
	buildings_co2 = new_value
	view_model.set_buildings_co2(new_value)
	
func set_transportation_co2(new_value: float):
	transport_co2 = new_value
	view_model.set_transportion_co2(new_value)
	
func set_other_industry_co2(new_value: float):
	other_industry_co2 = new_value
	view_model.set_other_industry_co2(new_value)
	
func set_power_co2(new_value: float):
	power_co2 = new_value
	view_model.set_power_co2(new_value)
	
func set_other_sectors_co2(new_value: float):
	other_sectors_co2 = new_value
	view_model.set_other_sectors_co2(new_value)
