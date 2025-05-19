extends CharacterBody2D

var base_velocity
@export var speed :int
var direction

func _ready() -> void:
	print("print");


func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	base_velocity = direction * speed
	position += Vector2(base_velocity)
	move_and_slide()
