extends CharacterBody2D
class_name Enemy_WormApple

var player: Player = null

var speed: float = 600.0
var direction := Vector2.ZERO
var stop_distance := 20.0

# Knockback variables
var knockback_velocity := Vector2.ZERO
var knockback_friction := 1500.0  # How fast knockback slows down (adjust as needed)

func _physics_process(delta: float) -> void:
	if player != null:
		var enemy_to_player = (player.global_position - global_position)
		if enemy_to_player.length() > stop_distance:
			direction = enemy_to_player.normalized()
		else:
			direction = Vector2.ZERO
		
		var base_velocity = Vector2.ZERO
		if direction != Vector2.ZERO:
			base_velocity = speed * direction
		else:
			base_velocity.x = move_toward(velocity.x, 0, speed)
			base_velocity.y = move_toward(velocity.y, 0, speed)

		# Add knockback velocity to base velocity
		velocity = base_velocity + knockback_velocity

		move_and_slide()

	# Reduce knockback velocity over time (apply friction)
	if knockback_velocity.length() > 0:
		var friction = knockback_friction * delta
		var kb_length = knockback_velocity.length()
		if kb_length <= friction:
			knockback_velocity = Vector2.ZERO
		else:
			knockback_velocity = knockback_velocity.normalized() * (kb_length - friction)

func apply_knockback(from_position: Vector2, force: float) -> void:
	var direction = (global_position - from_position).normalized()
	knockback_velocity = direction * force

#detects if player is in range
func _on_player_detector_body_exited(body: Node2D) -> void:
	if body is Player:
		if player != null:
			player = null
			print(name + " lost player")

#detects if player is out of range
func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		if player == null:
			player = body
			print(name + " found player")
