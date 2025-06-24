extends Area2D

@export var linked_door_path: NodePath

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		var linked_door = get_node_or_null(linked_door_path)
		if linked_door and linked_door is Node2D:
			# Move player to the linked door position + slight offset
			body.global_position = linked_door.global_position + Vector2(0, 16)

			# Look for the Camera2D in the *linked door's* parent (i.e. the room you're entering)
			var room_camera = linked_door.get_parent().get_node_or_null("Camera2D")

			if room_camera and room_camera is Camera2D:
				room_camera.make_current()  # Safer than setting `.current = true`
			else:
				print("No valid Camera2D found in linked room")
		else:
			print("Invalid linked door or path: ", linked_door_path)
