extends CharacterBody2D

const SPEED = 300.0
const SKI_VELOCITY = 200.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	velocity.y = SKI_VELOCITY
	
	# Horizontal movement
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED

	move_and_slide()
	global_position.x = clamp(global_position.x, 0, get_viewport_rect().size.x)
