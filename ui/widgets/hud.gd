extends Control

@export var country_information_widget: CountryInformationSimpleWidget
@export var loss_modal_scene: PackedScene

func _ready() -> void:
	var countries_vm = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.COUNTRIES) as CountriesViewModel
	if countries_vm:
		countries_vm.on_selected_country_changed.connect(_handle_selected_country_changed)
	
	var game_mode_vm = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.GAME_MODE) as GameModeViewModel
	if game_mode_vm:
		game_mode_vm.on_loss_condition_reached.connect(_handle_on_loss_condition_reached)

func _handle_selected_country_changed(country_vm: CountryViewModel) -> void:
	country_information_widget.bind_vm(country_vm)

func _handle_on_loss_condition_reached(loss_condition: StandardGameMode.LossCondition) -> void:
	var loss_modal_instance = loss_modal_scene.instantiate() as LossModal
	loss_modal_instance.set_loss_condition(loss_condition)
	add_child(loss_modal_instance)
