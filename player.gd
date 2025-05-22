extends CharacterBody2D

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
