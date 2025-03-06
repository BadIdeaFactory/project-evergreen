extends Control
class_name Modal

@export var close_button: TextureButton

@onready var content_slot: Control = $BackgroundTextureRect/Content

func _ready() -> void:
	close_button.pressed.connect(_handle_close_button_clicked)

func init(content: PackedScene): 
	content_slot.add_child(content.instantiate())

func _handle_close_button_clicked():
	queue_free()
