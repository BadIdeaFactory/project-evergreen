extends ViewModelBase
class_name GameModeViewModel

signal on_loss_condition_reached (loss_condition: StandardGameMode.LossCondition)

func set_loss_condition_reached(loss_condition: StandardGameMode.LossCondition):
	on_loss_condition_reached.emit(loss_condition)
