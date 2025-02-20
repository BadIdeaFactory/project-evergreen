extends Node2D
class_name CameraComponent

@export var camera: Camera2D

func apply_camera_movement(movement: Vector2):
	camera.global_position += movement
	_snap_in_limit()

# _snap_in_limit prevents the camera from moving when the viewport isn't
func _snap_in_limit():
	var viewport_center_x = get_viewport_rect().size.x/2
	var viewport_center_y = get_viewport_rect().size.y/2
	
	# offset the limits to acount for the viewport size
	var adjusted_limit_left = camera.limit_left + viewport_center_x
	var adjusted_limit_top = camera.limit_top + viewport_center_y
	var adjusted_limit_right = camera.limit_right - viewport_center_x
	var adjusted_limit_bottom = camera.limit_bottom - viewport_center_y
	
	var clamped_x = clamp(camera.global_position.x, adjusted_limit_left, adjusted_limit_right)
	var clamped_y = clamp(camera.global_position.y, adjusted_limit_top, adjusted_limit_bottom)
	
	camera.global_position = Vector2(clamped_x, clamped_y)
