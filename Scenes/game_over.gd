extends Control

func _ready():
	var score_label = $ScoreLabel
	if score_label:
		print("Cihuyy")
	else:
		print("alamakk")

func set_score(final_score):
	var score_label = $ScoreLabel
	if score_label:
		score_label.text = "Skor: " + str(final_score)
	else:
		print("score labek tidak ditemukan")


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
