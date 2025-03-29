extends Area2D
class_name Country

enum Keys { USA }

@export var country_key: Keys
@export var sprite: Sprite2D
@export var test: StringName
var selected_material: Material = preload("res://entities/countries/selected_country_material.tres")
var country_name: String

func _ready() -> void:
	var countries_view_model = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.COUNTRIES) as CountriesViewModel
	if countries_view_model:
		var country_view_model = CountryViewModel.new()
		country_view_model.country = self
		countries_view_model.register_country_vm(country_key, country_view_model)

func select() -> void:
	var countries_vm = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.COUNTRIES) as CountriesViewModel
	sprite.material = selected_material
	if countries_vm:
		countries_vm.select_country(country_key)

func unselect() -> void:
	sprite.material = null
