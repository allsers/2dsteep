extends Control  # Or whatever your root node type is

func _ready():
	# Connect the TextureButton's "pressed" signal to the _on_StartButton_pressed function
	$start_btn/TextureButton.pressed.connect(_on_StartButton_pressed)
	$quit_btn/TextureButton.pressed.connect(_on_QuitButton_pressed)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file("res://world.tscn")

func _on_StartButton_pressed():
	# Change the scene to world.tscn
	get_tree().change_scene_to_file("res://world.tscn")

func _on_QuitButton_pressed():
	# Quit the game
	get_tree().quit()
