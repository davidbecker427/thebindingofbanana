extends CharacterBody2D

var pos: Vector2
var rota: float
var dir: float
var speed = 1000

func _ready():
	global_position = pos

func _physics_process(delta):
	velocity = Vector2(speed, 0).rotated(dir)
	move_and_slide()

	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.is_in_group("enemies"):
			collider.queue_free()  # Remove enemy
			queue_free()           # Remove bullet
			return                 # Stop after collision
		else:
			queue_free()           # Remove bullet if hit something else
			return
