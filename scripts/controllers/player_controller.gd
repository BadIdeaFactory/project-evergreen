extends Node

@export var keyboard_scroll_speed: float = 7
@export var mouse_scroll_speed: float = 2
@export var camera_component: CameraComponent
var is_dragging: bool = false

func _input(event):
	if event.is_action_pressed("start_drag"):
		is_dragging = true
	elif event.is_action_released("start_drag"):
		is_dragging = false
	
	if is_dragging and event is InputEventMouseMotion:
		camera_component.apply_camera_movement(event.relative * mouse_scroll_speed)
		

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
		
	camera_component.apply_camera_movement(camera_movement)
