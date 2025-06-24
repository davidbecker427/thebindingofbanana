extends CharacterBody2D
class_name Player

var bullet_path = preload("res://Bullet/Bullet.tscn")
var health = 6
signal died

# Textures for player directions
@export var player_sprite_up: Texture2D
@export var player_sprite_down: Texture2D
@export var player_sprite_left: Texture2D
@export var player_sprite_right: Texture2D
@onready var sprite = $Placeholderplayer 

# Movement speed
var speed = 1000

# Knockback variables
var knockback_velocity = Vector2.ZERO
var knockback_friction = 2000  # How fast knockback slows down (adjust to your liking)

func get_input():
	# Get the input vector for player movement
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	
	# Add knockback velocity to player velocity
	velocity += knockback_velocity
	
	# Move the player with the combined velocity
	move_and_slide()

	# Apply friction to reduce knockback velocity over time
	if knockback_velocity.length() > 0:
		var friction = knockback_friction * delta
		var kb_length = knockback_velocity.length()
		if kb_length <= friction:
			knockback_velocity = Vector2.ZERO
		else:
			knockback_velocity = knockback_velocity.normalized() * (kb_length - friction)
	
	# Shooting controls
	if Input.is_action_just_pressed("shoot_up"):
		fire(player_sprite_up, -PI / 2, $Node2D_up)
	elif Input.is_action_just_pressed("shoot_down"):
		fire(player_sprite_down, PI / 2, $Node2D_down)
	elif Input.is_action_just_pressed("shoot_left"):
		fire(player_sprite_left, PI, $Node2D_left)
	elif Input.is_action_just_pressed("shoot_right"):
		fire(player_sprite_right, 0, $Node2D_right)

func fire(player_sprite, direction, node):
	sprite.texture = player_sprite  # Change player sprite
	
	var bullet = bullet_path.instantiate()
	bullet.dir = direction
	bullet.pos = node.global_position
	bullet.rota = global_rotation
	get_parent().add_child(bullet)

# Call this to apply knockback when player is hit
func apply_knockback(from_position: Vector2, force: float):
	var direction = (global_position - from_position).normalized()
	knockback_velocity = direction * force


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Enemy_Rat or body is Enemy_WormApple:
		health -= 1
		print("Player hit! Health:", health)

		# Apply knockback to player, away from enemy
		apply_knockback(body.global_position, 1200)

		# Also apply knockback to enemy, away from player
		if "apply_knockback" in body:
			body.apply_knockback(global_position, 800)  # Enemy gets pushed back too!
		
		if health <= 0:
			died.emit()
			queue_free()
