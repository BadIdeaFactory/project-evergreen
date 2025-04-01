@tool
extends EditorScript

const year_index = 22
const country_code_index = 2
const sector_index = 1

func _run() -> void:
	var csv_contents = _parse_csv()
	_update_json(csv_contents)
	print("JSON Updated")

func _parse_csv() -> Dictionary:
	var file = FileAccess.open("res://devtools/emissions_data_loader/EDGARv7.0_FT2021_fossil_CO2_booklet_2022_totalsbysectorandcountry.csv", FileAccess.READ)
	var countries_by_code = {}
	
	# Start after CSV headers.
	file.get_csv_line(",")
	while !file.eof_reached():
		var csv_line = file.get_csv_line(",")
		# Some countries do not have data
		if csv_line.size() < year_index + 1:
			continue

		var country_code = csv_line[country_code_index]
		if !countries_by_code.has(country_code):
			var dictionary = {}
			dictionary["buildings_co2"] = "0"
			dictionary["power_co2"] = "0"
			dictionary.country_code = country_code
			dictionary.year = "1988"
			dictionary["transport_co2"] = "0"
			dictionary["other_industry_co2"] = "0"
			dictionary["other_sectors_co2"] = "0"
			countries_by_code[country_code] = dictionary
		
		var sector = csv_line[sector_index]
		var amount = csv_line[year_index]
		var dictionary = countries_by_code[country_code]
		match sector:
			"Other sectors":
				dictionary["other_sectors_co2"] = amount
			"Other industrial combustion":
				dictionary["other_industry_co2"] = amount
			"Transport":
				dictionary["transport_co2"] = amount
			"Buildings":
				dictionary["buildings_co2"] = amount
			"Power Industry":
				dictionary["power_co2"] = amount
		
	print("Found data for {size} countries".format({"size": countries_by_code.size()}))
	return countries_by_code
		
func _update_json(csv_contents: Dictionary):
	var output_file = FileAccess.open("res://entities/countries/carbon_initialization.json", FileAccess.WRITE)
	output_file.store_string(JSON.stringify(csv_contents))
	
