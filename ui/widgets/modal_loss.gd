extends Modal
class_name LossModal

@export var loss_label: Label
@export var restart_button: Button

func _ready() -> void:
	super()
	restart_button.pressed.connect(_restart_game)

func set_loss_condition(loss_condition: StandardGameMode.LossCondition) -> void:
		match loss_condition:
			StandardGameMode.LossCondition.TIME_EXCEEDED:
				loss_label.text = (tr("LOSSCONDITION_TIMEEXCEEDED_TEXT"))
			StandardGameMode.LossCondition.TEMPERATURE_EXCEEDED:
				loss_label.text = (tr("LOSSCONDITION_TEMPERATUREEXCEEDED_TEXT"))

func _restart_game() -> void:
	get_tree().reload_current_scene()
