extends CharacterBody2D
class_name Player

var bullet_path=preload("res://Bullet/Bullet.tscn")
var health = 2
signal died

# Adding a texture for these variable textures (See Player node)
@export var player_sprite_up: Texture2D
@export var player_sprite_down: Texture2D
@export var player_sprite_left: Texture2D
@export var player_sprite_right: Texture2D
@onready var sprite = $Placeholderplayer 

# set a speed variable
@export var speed = 1000

func get_input():
	# get the input fields from the input map
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

# actually move the player
func _physics_process(delta):
	get_input()
	move_and_slide()
	
	# check for the input key (defined in the input map) and execute the fire function
	if Input.is_action_just_pressed("shoot_up"):
		fire(player_sprite_up, -PI / 2, $Node2D_up)
		
	elif Input.is_action_just_pressed("shoot_down"):
		fire(player_sprite_down, PI / 2, $Node2D_down)
		
	elif Input.is_action_just_pressed("shoot_left"):
		fire(player_sprite_left, PI, $Node2D_left)
		
	elif Input.is_action_just_pressed("shoot_right"):
		fire(player_sprite_right, 0, $Node2D_right)
		
# define the fire function
func fire(player_sprite, direction, node):
	sprite.texture = player_sprite  # Change player sprite
	
	# create the bullet in the world
	var bullet=bullet_path.instantiate()
	
	# set the direction of the bullets 
	bullet.dir= direction
	
	# set the position of the bullet to the position of the node (located in Player.tscn)
	bullet.pos=node.global_position
	
	# match the rotation of the player node
	bullet.rota=global_rotation
	
	# add the bullet to the scene tree so it can be updated
	get_parent().add_child(bullet)
	
	



func _on_hitbox_body_entered(body: Node2D) -> void:
	
	if body is Enemy_Rat or body is Enemy_WormApple:
		health -= 2 # Subtract 2
		print("Player hit! Health is now:", health)

		# Check for death
		if health <= 0:
			died.emit()
			queue_free()
