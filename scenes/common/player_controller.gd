extends Node2D

@export var keyboard_scroll_speed: float = 7
@export var mouse_drag_scroll_speed: float = 1.5 
@export var mouse_scroll_threshold: float = 50 # how many pixels from the sides of the screen triggers a mouse scroll
@export var drag_icon: Texture2D
@export var arrow_icon: Texture2D
@export var hud: Control
@export var camera_component: CameraComponent
var is_dragging: bool = false

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	Input.set_custom_mouse_cursor(arrow_icon, Input.CURSOR_ARROW)

func _unhandled_input(event: InputEvent) -> void:
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
		
	camera_component.apply_camera_movement(camera_movement)
