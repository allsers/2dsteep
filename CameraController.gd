extends Camera2D

@export var player: NodePath
var player_node: Node2D
var world_node: Node2D

@export var smooth_speed: float = 5.0  # Adjust for smoother or quicker camera movement

func _ready() -> void:
	player_node = get_node(player)
	world_node = get_parent()

func _process(delta: float) -> void:
	if player_node:
		# Calculate target position
		var target_pos = player_node.global_position
		target_pos += Vector2(0, 75)
		
		global_position = global_position.lerp(target_pos, smooth_speed * delta)
		
