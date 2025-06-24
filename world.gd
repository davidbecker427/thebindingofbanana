extends Node2D

@onready var player = $Player

func _ready() -> void:
	player.died.connect(_on_player_died)
	
# when player dies, make the Game Over screen visible
func _on_player_died():
	print("game over")
	get_node("/root/World/GameOverUI").visible = true

# when restart button is pressed, change scene to world
func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")

# when menu button is pressed, change scene to main menu screen
func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Startscherm.tscn")
