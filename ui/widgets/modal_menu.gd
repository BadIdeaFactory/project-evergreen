extends Modal

@export var quit_button: Button
@export var credits_button: Button
@export var credits_scene: PackedScene

var credits_instance: Control

func _ready() -> void:
	super()
	quit_button.pressed.connect(_handle_quit_button_pressed)
	credits_button.pressed.connect(_handle_credits_button_pressed)
	
func _handle_quit_button_pressed():
	get_tree().quit()

func _handle_credits_button_pressed():
	if not credits_instance:
		credits_instance = credits_scene.instantiate()
		add_child(credits_instance)
