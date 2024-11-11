extends Camera2D

@export var player: NodePath
var player_node: Node2D
var world_node: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_node = get_node(player)
	world_node = get_parent()


func _process(delta: float) -> void:
	if player_node:
		global_position.y = player_node.global_position.y
		var half_width = get_viewport_rect().size.x / 2
		var min_x = half_width
		var max_x = get_parent().MAX_WIDTH - half_width
		global_position.x = clamp(player_node.global_position.x, min_x, max_x)
