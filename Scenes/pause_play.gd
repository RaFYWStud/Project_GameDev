extends Button

func _ready() -> void:
	# Tombol tetap berfungsi saat game terpause
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	self.connect("toggled", Callable(self, "_on_pause_button_toggled"))

func _on_pause_button_toggled(button_pressed: bool) -> void:
	if button_pressed:
		get_tree().paused = true  # Pause game
		text = "Resume"
	else:
		get_tree().paused = false  # Resume game
		text = "Pause"
