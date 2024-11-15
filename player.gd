extends CharacterBody2D

var score = 0

var SPEED_X = 175.0
const SKI_VELOCITY = 200.0
const MAX_SKI_VELOCITY = 600.0
var current_ski_velocity = SKI_VELOCITY

# Rotation variable to hold the current rotation
var target_rotation = 0.0


func _physics_process(delta: float) -> void:
	score += current_ski_velocity * delta
	
	# Handle jump.
	current_ski_velocity = min(current_ski_velocity + delta * 7, MAX_SKI_VELOCITY)
	velocity.y = current_ski_velocity
	
	# Horizontal movement
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED_X

	move_and_slide()
	update_animation(direction)  # Pass direction to update animation

	#global_position.x = clamp(global_position.x, -1200, 1200)
	

func update_animation(direction: float):
	var sprite = $Sprite2D
	var collision = $CollisionShape2D
	
	# Determine target rotation based on direction
	if direction < 0:
		target_rotation = deg_to_rad(25)  # Rotate left
	elif direction > 0:
		target_rotation = deg_to_rad(-25)  # Rotate right
	else:
		target_rotation = 0.0  # No rotation when not moving horizontally
	
	# Apply rotation directly to sprite and collision shape
	sprite.rotation = target_rotation
	collision.rotation = target_rotation
