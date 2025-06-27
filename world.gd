extends Node2D

@onready var player = $Player

func _ready() -> void:
	player.died.connect(_on_player_died)

func _on_player_died():
	print("game over")
	get_node("/root/World/GameOverUI").visible = true

#func _on_enemy_died():
	#check_enemies_left()
#
#func check_enemies_left():
	#var enemies_left = get_tree().get_nodes_in_group("enemies").size()
	#print("Enemies left:", enemies_left)
	#if enemies_left == 0:
		#_on_all_enemies_defeated()
#
#func _on_all_enemies_defeated():
	#print("All enemies defeated!")
	#get_node("/root/World/YouWinUI").visible = true
	

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Startscherm.tscn")
