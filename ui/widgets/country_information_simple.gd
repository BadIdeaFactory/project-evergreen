extends Control
class_name CountryInformationSimpleWidget

@export var label: Label

func _ready() -> void:
	visible = false

func bind_vm(view_model: CountryViewModel) -> void:
	label.text = view_model.country.country_name
	visible = true
