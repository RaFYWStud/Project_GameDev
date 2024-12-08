extends Control

func _on_back_button_pressed() -> void:
	$Audio/ButtonPressed.play()
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
