extends CharacterBody2D
var score = 0

const SPEED = 300.0
const SKI_VELOCITY = 200.0
const MAX_SKI_VELOCITY = 500.0
var current_ski_velocity = SKI_VELOCITY

func _physics_process(delta: float) -> void:
	score += current_ski_velocity * delta
	# Handle jump.
	current_ski_velocity = min(current_ski_velocity + delta * 5, MAX_SKI_VELOCITY)
	velocity.y = current_ski_velocity
	
	# Horizontal
	var direction := Input.get_axis("move-left", "move-right")
	velocity.x = direction * SPEED

	move_and_slide()
	update_animation()
	global_position.x = clamp(global_position.x, 0, get_viewport_rect().size.x)
	
func update_animation():
	var sprite = $Sprite2D
	var collision = $CollisionShape2D
	
	# Reset rotation to 0
	sprite.transform = Transform2D.IDENTITY
	collision.transform = Transform2D.IDENTITY
	
	var target_rotation = 0.0  # Default to no rotation
	
	if velocity.x < 0:
		# Moving left
		target_rotation = deg_to_rad(25)
	elif velocity.x > 0:
		# Moving right
		target_rotation = deg_to_rad(-25)
	
	# Apply rotation
	sprite.rotate(target_rotation)
	collision.rotate(target_rotation)
	
