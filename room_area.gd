extends Area2D

func _ready():
	self.body_entered.connect(_on_room_area_body_entered)

func _on_room_area_body_entered(body: Node2D) -> void:
	print("Body entered: ", body.name)
	if body.name == "Player":
		print("Player entered room area: ", self.name)
		Events.room_entered.emit(self)
