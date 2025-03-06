@tool
extends Button

@export var label: Label
@export var button_text: String

func _ready() -> void:
	label.text = text
