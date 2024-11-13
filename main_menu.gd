extends Control  # Or whatever your root node type is

func _ready():
	# Connect the TextureButton's "pressed" signal to the _on_StartButton_pressed function
	$VBoxContainer/TextureButton.pressed.connect(_on_StartButton_pressed)

func _on_StartButton_pressed():
	# Change the scene to world.tscn
	get_tree().change_scene_to_file("res://world.tscn")
