extends CanvasLayer

var player: Node2D



func display_text(score_val):
	$score_display.text = "Score: " + str(score_val)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().get_node("Player")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	display_text(round(player.score/100))
