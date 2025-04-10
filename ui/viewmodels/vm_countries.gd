extends ViewModelBase
class_name CountriesViewModel

var registry = {}
signal on_selected_country_changed(country_vm: CountryViewModel)

func _ready() -> void: 
	ViewModelRegistry.register(ViewModelRegistry.Keys.COUNTRIES, self)

func register_country_vm(key: CountryNameAndKeyRegistry.COUNTRY_CODES, country_vm: CountryViewModel) -> void:
	registry[key] = country_vm
	
func select_country(key: CountryNameAndKeyRegistry.COUNTRY_CODES) -> void:
	var country_vm = _retrieve_country_vm(key)
	if country_vm:
		on_selected_country_changed.emit(country_vm)

func _retrieve_country_vm(key: CountryNameAndKeyRegistry.COUNTRY_CODES) -> CountryViewModel:
	return registry[key]
