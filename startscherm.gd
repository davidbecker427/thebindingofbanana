extends Control 

# changing to world scene when the start button is pressed
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
