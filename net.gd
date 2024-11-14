extends Node2D

var rng = RandomNumberGenerator.new()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_pos = get_node("../../Player").get_position()
	var playerx = player_pos.x
	var playery = player_pos.y
	
	set_position(Vector2(
		rng.randf_range(playerx-350, playerx+350),
		rng.randf_range(playery+300, playery+400)
		))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
