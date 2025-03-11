extends Area2D
class_name Country

enum Keys { USA }

@export var country_key: Keys
var country_name: String

func _ready() -> void:
	var countries_view_model = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.COUNTRIES) as CountriesViewModel
	if countries_view_model:
		var country_view_model = CountryViewModel.new()
		country_view_model.country = self
		countries_view_model.register_country_vm(country_key, country_view_model)

func select() -> void:
	var countries_vm = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.COUNTRIES) as CountriesViewModel
	if countries_vm:
		countries_vm.select_country(country_key)
