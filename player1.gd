extends CharacterBody2D

@export var speed = 350
@export var gravity = 35
var jump_force = 1350


func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity
		
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = speed * horizontal_direction


	
	move_and_slide()
