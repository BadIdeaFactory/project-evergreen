extends Area2D
class_name Country

enum Keys { USA }

@export var country_key: Keys
@export var sprite: Sprite2D
@export var country_carbon_component: CountryCarbonComponent
var selected_material: Material = preload("res://entities/countries/selected_country_material.tres")
var country_name: String
static var carbon_initialization_data: Dictionary;

static func _static_init():
	var json = JSON.new()
	var carbon_initialization_stats_json = FileAccess.get_file_as_string("res://entities/countries/carbon_initialization.json")
	var error = json.parse(carbon_initialization_stats_json)
	if error:
		push_error(error)
		return

	carbon_initialization_data = json.data

func _ready() -> void:
	var country_key_str = Keys.keys()[country_key]
	country_carbon_component.initialize_carbon(carbon_initialization_data[country_key_str])
	
	var countries_view_model = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.COUNTRIES) as CountriesViewModel
	if countries_view_model:
		var country_view_model = CountryViewModel.new()
		country_view_model.set_country_carbon_component(country_carbon_component)
		country_view_model.country = self
		countries_view_model.register_country_vm(country_key, country_view_model)

func select() -> void:
	var countries_vm = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.COUNTRIES) as CountriesViewModel
	sprite.material = selected_material
	if countries_vm:
		countries_vm.select_country(country_key)

func unselect() -> void:
	sprite.material = null
