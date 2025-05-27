extends Area2D

# save a reference to the marker thats inside the doors
@onready var marker_2d: Marker2D = $Marker2D

# when a player enters the area, move it to the saved marker position
func _on_body_entered(body: Node2D) -> void:
	body.global_position = marker_2d.global_position
