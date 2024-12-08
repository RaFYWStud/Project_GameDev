extends Button

func _ready() -> void:
	# Pastikan tombol tetap aktif meskipun game dalam keadaan paused
	self.process_mode = Node.PROCESS_MODE_ALWAYS  # Tombol tetap aktif saat game pause
	self.connect("pressed", Callable(self, "_on_retry_button_pressed"))
	text = "Ulang"

func _on_retry_button_pressed() -> void:
	get_node("/root/Main/Audio/ButtonPressed").play()
	# Jika game dalam keadaan pause, nonaktifkan pause terlebih dahulu
	get_tree().paused = false  # Matikan pause agar game bisa dimulai ulang

	# Muat ulang scene saat ini untuk mengulang game
	var scene_path = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file(scene_path)
