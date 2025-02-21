extends Node2D

@export var keyboard_scroll_speed: float = 7
@export var mouse_scroll_speed: float = 2 
@export var mouse_scroll_threshold: float = 50 # how many pixels from the sides of the screen triggers a mouse scroll
@export var camera_component: CameraComponent
var is_dragging: bool = false

func _input(event):
	if event.is_action_pressed("start_drag"):
		is_dragging = true
	elif event.is_action_released("start_drag"):
		is_dragging = false
	
	if event is InputEventMouseMotion and is_dragging:
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
	
	var max_x = get_viewport_rect().size.x
	var max_y = get_viewport_rect().size.y
	var mouse_global_position = get_viewport().get_mouse_position()
	if mouse_global_position.x <= mouse_scroll_threshold:
		camera_component.apply_camera_movement(Vector2.LEFT * mouse_scroll_speed)
	elif mouse_global_position.y <= mouse_scroll_threshold:
		camera_component.apply_camera_movement(Vector2.UP * mouse_scroll_speed)
	elif mouse_global_position.y >= max_y - mouse_scroll_threshold:
		camera_component.apply_camera_movement(Vector2.DOWN * mouse_scroll_speed)
	elif mouse_global_position.x >= max_x - mouse_scroll_threshold:
		camera_component.apply_camera_movement(Vector2.RIGHT * mouse_scroll_speed)
		
	camera_component.apply_camera_movement(camera_movement)
