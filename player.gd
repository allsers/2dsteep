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
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED

	move_and_slide()
	global_position.x = clamp(global_position.x, 0, get_viewport_rect().size.x)
	
func _on_body_entered(body):
	if body.is_in_group("obstacles"):
		current_ski_velocity *= 0.5

func update_animation():
	if velocity.x < 0:
		pass
	elif velocity.x > 0:
		pass
