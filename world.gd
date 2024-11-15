extends Node2D

@export var MAX_WIDTH = 1000

var net_scene = preload("res://net_obstacle.tscn")
var stone_scene = preload("res://stone_obstacle.tscn")


func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var net = net_scene.instantiate()
	var stone = stone_scene.instantiate()
	
	add_child(stone)
	add_child(net)
