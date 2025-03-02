extends Control

var view_model: TimerViewModel

@export var date_label: Label
@export var pause_button: TextureButton
@export var speed_up_button: TextureButton

func _ready() -> void:
	view_model = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.TIMER) as TimerViewModel
	view_model.on_formatted_time_updated.connect(_handle_formatted_datetime_changed)
	pause_button.toggled.connect(_handle_pause_button_clicked)
	speed_up_button.toggled.connect(_handle_speed_up_button_clicked)
	
func _handle_formatted_datetime_changed(new_datetime: String):
	date_label.text = new_datetime
	
func _handle_pause_button_clicked(_is_toggled: bool):
	view_model.toggle_paused()

func _handle_speed_up_button_clicked(_is_toggled: bool):
	view_model.toggle_speed_up()
