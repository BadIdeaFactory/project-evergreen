extends ViewModelBase
class_name TimerViewModel

signal on_formatted_time_updated (new_time: String)

var time_component: TimeComponent

func initialize(new_time_component: TimeComponent):
	time_component = new_time_component
	
func toggle_paused():
	time_component.toggle_paused()
	
func toggle_speed_up():
	time_component.toggle_speed_up()

func set_time(new_timestamp: int):
	var now_dict := Time.get_datetime_dict_from_unix_time(new_timestamp)
	var formatted_datetime = _format_datetime(now_dict)
	on_formatted_time_updated.emit(formatted_datetime)

func _format_datetime(datetime: Dictionary) -> String:
	var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	var day = datetime["day"]
	var year = datetime["year"]
	var month_name = months[datetime["month"] - 1]

	var suffix = "th"
	if day % 10 == 1 and day % 100 != 11:
		suffix = "st"
	elif day % 10 == 2 and day % 100 != 12:
		suffix = "nd"
	elif day % 10 == 3 and day % 100 != 13:
		suffix = "rd"
	
	return "%s %d%s, %d" % [month_name, day, suffix, year]
