extends Label

# todo: move all of this out of the view and make it not hard coded
var time_since_last_update = 0
var time = Time.get_unix_time_from_system()

func _ready() -> void:
	var now_dict := Time.get_datetime_dict_from_unix_time(time)
	text = format_datetime(now_dict)
	
func _process(delta: float): 
	time_since_last_update += delta 
	if time_since_last_update > 1:
		time_since_last_update = 0
		time += 86400 # seconds in a day
		var time_dict := Time.get_datetime_dict_from_unix_time(time)
		text = format_datetime(time_dict)

func format_datetime(datetime: Dictionary) -> String:
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
