extends Control
class_name CountryInformationSimpleWidget

@export var country_name_label: Label
@export var buildings_emissions_line_item: CarbonEmissionLineItem
@export var power_emissions_line_item: CarbonEmissionLineItem
@export var other_industries_line_item: CarbonEmissionLineItem
@export var other_sectors_line_item: CarbonEmissionLineItem
@export var transportation_line_item: CarbonEmissionLineItem

func _ready() -> void:
	visible = false

func bind_vm(view_model: CountryViewModel) -> void:
	country_name_label.text = view_model.country.country_name
	var country_carbon_vm = view_model.country_carbon_vm
	
	if country_carbon_vm.on_buildings_co2_changed.is_connected(_handle_buildings_co2_changed):
		country_carbon_vm.on_buildings_co2_changed.disconnect(_handle_buildings_co2_changed)
	country_carbon_vm.on_buildings_co2_changed.connect(_handle_buildings_co2_changed)
	
	if country_carbon_vm.on_power_co2_changed.is_connected(_handle_power_co2_changed):
		country_carbon_vm.on_power_co2_changed.disconnect(_handle_power_co2_changed)
	country_carbon_vm.on_power_co2_changed.connect(_handle_power_co2_changed)
	
	if country_carbon_vm.on_transportation_co2_changed.is_connected(_handle_transportation_co2_changed):
		country_carbon_vm.on_transportation_co2_changed.disconnect(_handle_transportation_co2_changed)
	country_carbon_vm.on_transportation_co2_changed.connect(_handle_transportation_co2_changed)
	
	if country_carbon_vm.on_other_sectors_co2_changed.is_connected(_handle_other_sectors_co2_changed):
		country_carbon_vm.on_other_sectors_co2_changed.disconnect(_handle_other_sectors_co2_changed)
	country_carbon_vm.on_other_sectors_co2_changed.connect(_handle_other_sectors_co2_changed)
	
	if country_carbon_vm.on_other_industry_co2_changed.is_connected(_handle_other_industries_co2_changed):
		country_carbon_vm.on_other_industry_co2_changed.disconnect(_handle_other_industries_co2_changed)
	country_carbon_vm.on_other_industry_co2_changed.connect(_handle_other_industries_co2_changed)
	
	country_carbon_vm.rebroadcast()
	visible = true
	
func _handle_buildings_co2_changed(new_amount: float):
	buildings_emissions_line_item.set_values(tr("EMISSIONS_BUILDINGS_NAME"), new_amount)
	
func _handle_power_co2_changed(new_amount: float):
	power_emissions_line_item.set_values(tr("EMISSIONS_POWER_NAME"), new_amount)
	
func _handle_transportation_co2_changed(new_amount: float):
	transportation_line_item.set_values(tr("EMISSIONS_TRANSPORTATION_NAME"), new_amount)
	
func _handle_other_sectors_co2_changed(new_amount: float):
	other_sectors_line_item.set_values(tr("EMISSIONS_OTHERSECTORS_NAME"), new_amount)
	
func _handle_other_industries_co2_changed(new_amount: float):
	other_industries_line_item.set_values(tr("EMISSIONS_OTHERINDUSTRIES_NAME"), new_amount)
