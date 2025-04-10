extends Node
class_name CountryViewModel

var country: Country
var country_carbon_vm: CountryCarbonViewModel

func initialize(country: Country) -> void:
	self.country = country
	
func set_country_carbon_component(country_carbon_component: CountryCarbonComponent):
	country_carbon_vm = country_carbon_component.view_model
