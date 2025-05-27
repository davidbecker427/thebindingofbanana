extends Node2D


func _on_player_detector_body_entered(body: Node2D) -> void:
	# when a player is detected in a room, log the room the player has entered
	Events.room_entered.emit(self)
