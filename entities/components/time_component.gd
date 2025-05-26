extends Node2D
class_name TimeComponent

@onready var view_model = TimerViewModel.new()

@export var day_update_interval_seconds: int = 1
@export var default_speed: float = 1
@export var fast_speed: float = 3

signal on_new_day (new_timestamp: int)
signal on_new_month (new_timestamp: int)

var time_since_last_update: float = 0
var time: float = Time.get_unix_time_from_system()
var is_paused: bool = false
var speed: float = default_speed
var date_string_regex: RegEx
var last_month: int

func _ready():
	date_string_regex = RegEx.new()
	date_string_regex.compile("(?<day>\\d{2})/(?<month>\\d{2})/(?<year>\\d{4})")
	view_model.initialize(self)
	ViewModelRegistry.register(ViewModelRegistry.Keys.TIMER, view_model)
	
func _process(delta: float):
	if is_paused:
		return
	 
	time_since_last_update += delta 
	if time_since_last_update > (day_update_interval_seconds / speed):
		time_since_last_update = 0
		time += 86400 # seconds in a day
		on_new_day.emit(time)
		view_model.set_time(int(time))
		var datetime_dict = Time.get_datetime_dict_from_unix_time(int(time))
		var current_month = datetime_dict.get("month")
		if last_month == Time.MONTH_DECEMBER and current_month == Time.MONTH_JANUARY || current_month > last_month:
			last_month = current_month
			on_new_month.emit(time) 

func get_timestamp_from_date_string(date_string: String) -> int:
	var results = date_string_regex.search(date_string)
	if results:
		var datetime_dict = {}
		datetime_dict["day"] = results.get_string("day")
		datetime_dict["month"] = results.get_string("month")
		datetime_dict["year"] = results.get_string("year")
		return Time.get_unix_time_from_datetime_dict(datetime_dict)
	else:
		return 0

# Must be in format MM/DD/YYYY. 
func set_timestamp_from_date_string(date_string: String) -> Error:
	var new_timestamp = get_timestamp_from_date_string(date_string)
	if new_timestamp:
		set_timestamp(new_timestamp)
		return OK
	else:
		return ERR_INVALID_PARAMETER

func set_timestamp(new_timestamp: float) -> void:
	time = new_timestamp
	start_new_day()
	
func start_new_day() -> void:
	# Force an update on next tick.
	time_since_last_update = (day_update_interval_seconds / speed)	

func toggle_paused():
	is_paused = !is_paused

func toggle_speed_up():
	if speed == default_speed: 
		speed = fast_speed
	else:
		speed = default_speed 
