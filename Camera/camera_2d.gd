extends Camera2D

@export var is_starting_camera: bool = false

func _ready():
	# Always connect to room_entered so this camera can react if needed
	Events.room_entered.connect(_on_room_entered)

	# Only make this one active if it's the starting camera
	if is_starting_camera:
		make_current()

func _on_room_entered(room):
	# Check if this camera belongs to the room that was entered
	if get_parent() == room:
		make_current()
