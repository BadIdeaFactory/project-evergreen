extends Label

var view_model: TimerViewModel

func _ready() -> void:
	view_model = ViewModelRegistry.retrieve(ViewModelRegistry.Keys.TIMER) as TimerViewModel
	view_model.on_formatted_time_updated.connect(_handle_formatted_datetime_changed)
	
func _handle_formatted_datetime_changed(new_datetime: String):
	text = new_datetime
