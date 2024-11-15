extends Control

func _ready():
	# Menghubungkan tombol dengan fungsinya
	$Play.connect("pressed", Callable(self, "_on_play_button_pressed"))
	$Knowledge.connect("pressed", Callable(self, "_on_knowledge_button_pressed"))
	$Setting.connect("pressed", Callable(self, "_on_setting_button_pressed"))
	$Exit.connect("pressed", Callable(self, "_on_exit_button_pressed"))

func _on_play_button_pressed():
	print("Play button clicked")
	get_tree().change_scene("res://Scenes/Game.tscn")  # Ganti dengan scene game Anda

func _on_knowledge_button_pressed():
	print("Knowledge button clicked")
	get_tree().change_scene("res://Scenes/Knowledge.tscn")  # Ganti dengan scene knowledge Anda

func _on_setting_button_pressed():
	print("Setting button clicked")
	get_tree().change_scene("res://Scenes/Setting.tscn")  # Ganti dengan scene setting Anda

func _on_exit_button_pressed():
	print("Exit button clicked")
	get_tree().quit()
