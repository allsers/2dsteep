extends Area2D

var rng = RandomNumberGenerator.new()

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


func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	print("Score: ", round(get_node("../../Player").score))
