extends Control

@export var country_information_widget: CountryInformationSimpleWidget

func _ready() -> void:
	var countries_vm = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.COUNTRIES) as CountriesViewModel
	if countries_vm:
		countries_vm.on_selected_country_changed.connect(_handle_selected_country_changed)

func _handle_selected_country_changed(country_vm: CountryViewModel) -> void:
	country_information_widget.bind_vm(country_vm)
