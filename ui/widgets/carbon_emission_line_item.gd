extends Control
class_name CarbonEmissionLineItem

@export var source_label: Label
@export var amount_label: Label

func set_values(source: String, amount: float):
	source_label.text = source
	set_amount(amount)

func set_amount(amount: float):
	amount_label.text = str(amount)
