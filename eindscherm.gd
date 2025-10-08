extends Control

# button functions
func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")
	
	
func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Startscherm.tscn")
