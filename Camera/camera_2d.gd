extends Camera2D

# runs when the scene is ready and all nodes are active
func _ready() -> void:
	# connecting the rooom_entered signal from Events (autoload script)
	Events.room_entered.connect(func(room):
		# when the room_entered is triggered, move the camera to that rooms global position
		global_position = room.global_position
	)
