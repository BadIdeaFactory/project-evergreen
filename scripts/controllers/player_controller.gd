extends Node2D

@export var keyboard_scroll_speed: float = 7
@export var mouse_drag_scroll_speed: float = 1.5 
@export var mouse_edge_scroll_speed: float = 6
@export var mouse_scroll_threshold: float = 50 # how many pixels from the sides of the screen triggers a mouse scroll
@export var drag_icon: Texture2D
@export var arrow_icon: Texture2D
@export var scroll_east_icon: Texture2D
@export var scroll_north_icon: Texture2D
@export var scroll_south_icon: Texture2D
@export var scroll_west_icon: Texture2D
@export var hud: Control
@export var camera_component: CameraComponent
var is_dragging: bool = false

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	Input.set_custom_mouse_cursor(arrow_icon, Input.CURSOR_ARROW)

func _input(event):
	if event.is_action_pressed("start_drag"):
		Input.set_custom_mouse_cursor(drag_icon, Input.CURSOR_DRAG)
		is_dragging = true
		hud.mouse_default_cursor_shape = Control.CURSOR_DRAG
	elif event.is_action_released("start_drag"):
		is_dragging = false
		hud.mouse_default_cursor_shape = Control.CURSOR_ARROW
	
	if event is InputEventMouseMotion and is_dragging:
		camera_component.apply_camera_movement(event.relative * mouse_drag_scroll_speed)

func _process(_delta: float) -> void:
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
		scroll_and_set_cursor(Vector2.LEFT)
	elif mouse_global_position.y <= mouse_scroll_threshold:
		scroll_and_set_cursor(Vector2.UP)
	elif mouse_global_position.y >= max_y - mouse_scroll_threshold:
		scroll_and_set_cursor(Vector2.DOWN)
	elif mouse_global_position.x >= max_x - mouse_scroll_threshold:
		scroll_and_set_cursor(Vector2.RIGHT)
	elif !is_dragging:
		hud.mouse_default_cursor_shape = Control.CURSOR_ARROW
		
	camera_component.apply_camera_movement(camera_movement)

func scroll_and_set_cursor(direction: Vector2):
	match direction:
		Vector2.LEFT:
			Input.set_custom_mouse_cursor(scroll_west_icon, Input.CURSOR_MOVE)
		Vector2.RIGHT:
			Input.set_custom_mouse_cursor(scroll_east_icon, Input.CURSOR_MOVE)
		Vector2.DOWN:
			Input.set_custom_mouse_cursor(scroll_south_icon, Input.CURSOR_MOVE)
		Vector2.UP:
			Input.set_custom_mouse_cursor(scroll_north_icon, Input.CURSOR_MOVE)
			
	hud.mouse_default_cursor_shape = Control.CURSOR_MOVE
	camera_component.apply_camera_movement(direction * mouse_edge_scroll_speed)
