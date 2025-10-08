extends Area2D

@export var linked_door_path: NodePath

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	# if the player collides with the door, teleport and turn of can_teleport so theres no loop
	if body.name == "Player" and body.has_method("disable_teleport_for") and body.can_teleport:
		body.can_teleport = false  # Prevent instant retrigger
		var linked_door = get_node_or_null(linked_door_path)

		if linked_door:
			body.global_position = linked_door.global_position + Vector2(0, 16)

			# Activate destination camera
			var room_camera = linked_door.get_parent().get_node_or_null("Camera2D")
			if room_camera:
				room_camera.make_current()

			# Reactivate teleporting after short delay
			body.disable_teleport_for(0.5)
		else:
			print("Linked door not found from path: ", linked_door_path)
