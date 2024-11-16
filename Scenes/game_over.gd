extends Control

func _ready():
	var score_label = $ScoreLabel
	if score_label:
		print("Skor gamedata = ", game_data.score)
		score_label.text = "Skor: " + str(game_data.score)
	else:
		print("score label tidak ditemukan")
	



func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
