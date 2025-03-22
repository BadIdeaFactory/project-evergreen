extends Node

func _ready() -> void:
	Console.add_command("SetDate", _handle_set_date, 1, 1, "Date should be in format DD/MM/YYYY.")
	Console.add_command("SetTemperatureAnomaly", _handle_set_temperature_anomaly, 1, 1, "Temperature is in Celsius.")

func _handle_set_temperature_anomaly(temperature_anomaly: String) -> void: 
	var temperature_component = _find_node(TemperatureComponent) as TemperatureComponent
	temperature_component.set_temperature_anomaly(temperature_anomaly.to_float())

func _handle_set_date(date: String) -> void:
	var time_component = _find_node(TimeComponent) as TimeComponent
	var regex = RegEx.new()
	regex.compile("(?<day>\\d{2})/(?<month>\\d{2})/(?<year>\\d{4})")
	var results = regex.search(date)
	if results:
		var datetime_dict = {}
		datetime_dict["day"] = results.get_string("day")
		datetime_dict["month"] = results.get_string("month")
		datetime_dict["year"] = results.get_string("year")
		var timestamp = Time.get_unix_time_from_datetime_dict(datetime_dict)
		time_component.set_timestamp(timestamp)
	else:
		Console.print_error("Date should be in format DD/MM/YYYY.")
	
func _find_node(node_type: Variant) -> Node:
	var root_node = get_tree().root
	return _search_tree(root_node, node_type)
	
func _search_tree(node: Node, node_type: Variant) -> Node:
	if is_instance_of(node, node_type):
		return node
	for child in node.get_children():
		var child_node := _search_tree(child, node_type)
		if child_node: 
			return child_node
	return null
		
	
