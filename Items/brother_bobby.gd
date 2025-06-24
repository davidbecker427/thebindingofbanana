extends Node2D

@onready var saved_node : Node = $Brother_Bobby

func _on_body_entered(body: Node2D) -> void:
	print("Entered")

	var brother_node = get_node_or_null("Brother_Bobby")
	if brother_node == null:
		print("Brother_Bobby node not found!")
		print("Available children: ", get_children())
		return
	
	saved_node = brother_node.duplicate()
	queue_free()	
