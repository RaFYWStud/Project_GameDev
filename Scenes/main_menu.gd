extends Control

@onready var score = $HighScoreLabel

func _ready():
	var high_score:int = game_data.high_score.high_score
	score.text = "Skor Tertinggi: " + str(high_score)
	
	# Menghubungkan tombol dengan fungsinya
	print("Main Menu Ready!")
	$Play.connect("pressed", Callable(self, "_on_play_button_pressed"))
	$Knowledge.connect("pressed", Callable(self, "_on_knowledge_button_pressed"))
	$Setting.connect("pressed", Callable(self, "_on_setting_button_pressed"))
	$Exit.connect("pressed", Callable(self, "_on_exit_button_pressed"))

func _on_play_button_pressed():
	print("Play button clicked")
	$Audio/ButtonPressed.play()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")  # Ganti dengan scene game Anda

func _on_knowledge_button_pressed():
	print("Knowledge button clicked")
	$Audio/ButtonPressed.play()
	get_tree().change_scene_to_file("res://Scenes/almanac.tscn")  # Ganti dengan scene knowledge Anda

func _on_setting_button_pressed():
	print("Setting button clicked")
	$Audio/ButtonPressed.play()
	get_tree().change_scene_to_file("res://Scenes/setting.tscn")  # Ganti dengan scene setting Anda

func _on_exit_button_pressed():
	$Audio/ButtonPressed.play()
	print("Exit button clicked")
	get_tree().quit()
