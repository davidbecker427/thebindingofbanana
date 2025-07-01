extends Node2D

@onready var player = $Player

func _ready() -> void:
	player.died.connect(_on_player_died)

# when the player has died, show the GameOverUI
func _on_player_died():
	get_node("/root/World/GameOverUI").visible = true
		
	
# changing scene when all enemies are defeated
func _process(_delta):
	if get_tree().get_nodes_in_group("enemies").size() == 0:
		change_scene()

func change_scene():
	get_tree().change_scene_to_file("res://Eindscherm.tscn")

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Startscherm.tscn")
