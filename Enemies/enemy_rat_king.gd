extends CharacterBody2D
class_name Enemy_Rat_King

var player: Player = null
var bullet_path = preload("res://Bullets/cheesebullet.tscn")

var speed: float = 600.0
var direction := Vector2.ZERO
var stop_distance := 20.0

#func _process(delta: float) -> void:
	#pass

#enemy movement
func _physics_process(delta: float) -> void:
	pass
	
	#if player != null:
		#var enemy_to_player = (player.global_position - global_position)
		#if enemy_to_player.length() > stop_distance:
			#direction = enemy_to_player.normalized()
		#else:
			#direction = Vector2.ZERO
		#
		#if direction != Vector2.ZERO:
			#velocity = speed * direction
		#else:
			#velocity.x = move_toward(velocity.x, 0, speed)
			#velocity.y = move_toward(velocity.y, 0, speed)
	#
		#move_and_slide()

func fire(player_sprite, direction, node):
	
	var bullet = bullet_path.instantiate()
	bullet.dir = direction
	bullet.pos = node.global_position
	bullet.rota = global_rotation
	get_parent().add_child(bullet)
	


#detects if player is in range
func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		if player == null:
			player = body
			print(name + "found player")
		

#detects if player is out of range
func _on_player_detector_body_exited(body: Node2D) -> void:
	if body is Player:
		if player != null:
			player = null
			print(name + "lost player")
