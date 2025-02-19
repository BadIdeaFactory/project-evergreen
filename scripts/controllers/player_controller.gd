extends Node

@export var keyboard_scroll_speed: float = 7
@export var camera: Camera2D

func _process(delta: float) -> void:
	var camera_movement := Vector2.ZERO
	
	if Input.is_action_pressed("move_map_left"):
		camera_movement += Vector2.LEFT * keyboard_scroll_speed
	elif Input.is_action_pressed("move_map_right"):
		camera_movement += Vector2.RIGHT * keyboard_scroll_speed
		
	if Input.is_action_pressed("move_map_up"):
		camera_movement += Vector2.UP * keyboard_scroll_speed
	elif Input.is_action_pressed("move_map_down"):
		camera_movement += Vector2.DOWN * keyboard_scroll_speed
		
	camera.position += camera_movement
