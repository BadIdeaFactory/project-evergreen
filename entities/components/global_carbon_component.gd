extends Node
class_name GlobalCarbonComponent

@onready var view_model = GlobalCarbonViewModel.new()
@export var time_component: TimeComponent

var carbon_level_ppm: float

func _ready():
	ViewModelRegistry.register(ViewModelRegistry.Keys.GLOBAL_CARBON, view_model)
	time_component.on_new_month.connect(_handle_new_month)

func _handle_new_month(_new_timestamp: float):
	# TODO: this is a large increase for testing. it should be based on the state of the world.
	set_carbon_in_atmosphere(carbon_level_ppm + 1)

func set_carbon_in_atmosphere(new_carbon_level_ppm: float):
	carbon_level_ppm = new_carbon_level_ppm
	view_model.set_carbon_in_atmosphere(carbon_level_ppm)
