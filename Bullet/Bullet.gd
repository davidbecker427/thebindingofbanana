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
		queue_free()  # remove bullet on any collision
