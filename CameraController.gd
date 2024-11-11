extends Camera2D

@export var player: NodePath
var player_node: Node2D
var world_node: Node2D

func _ready() -> void:
	player_node = get_node(player)
	world_node = get_parent()

func _process(delta: float) -> void:
	if player_node:
		global_position.y = player_node.global_position.y
		global_position.x = clamp(player_node.global_position.x, 0, world_node.MAX_WIDTH)
