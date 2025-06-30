extends CharacterBody2D
class_name Bullet

# setting some variables
var pos: Vector2
var rota: float
var dir: float
var speed = 1000

# when scene is ready, set the bullet position to saved position
func _ready():
	global_position = pos

# every physics frame, set the speed and rotation and move
func _physics_process(delta):
	velocity = Vector2(speed, 0).rotated(dir)
	move_and_slide()
#
# check if the bullet has collided with anything
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		#
		# if statement for removing the bullet/enemies
		if collider:
			queue_free()           # Remove bullet
			return                 # Stop after collision
