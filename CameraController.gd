extends Camera2D

@export var player: NodePath
var player_node: Node2D
var world_node: Node2D

@export var smooth_speed: float = 5.0  # Adjust for smoother or quicker camera movement

func _ready() -> void:
	player_node = get_node(player)
	world_node = get_parent()
	
	# Ensure the camera is not limited by default
	limit_left = -10000000
	limit_right = 10000000
	limit_top = -10000000
	limit_bottom = 10000000

func _process(delta: float) -> void:
	if player_node:
		# Calculate target position
		var target_pos = player_node.global_position
		
		# Smoothly interpolate to the target position
		global_position = global_position.lerp(target_pos, smooth_speed * delta)
		
		# Clamp the camera's x position if MAX_WIDTH is defined
		if world_node.has_method("get_max_width"):
			var max_width = world_node.get_max_width()
			var half_width = get_viewport_rect().size.x / 2
			global_position.x = clamp(global_position.x, half_width, max_width - half_width)
