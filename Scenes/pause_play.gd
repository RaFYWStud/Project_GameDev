extends Button

@onready var overlay = get_node("/root/Main/PauseOverlay")  
@onready var pause_label = get_node("/root/Main/PauseLabel")
@onready var retry = get_node("/root/Main/Retry")

func _ready() -> void:
	# Tombol tetap berfungsi saat game terpause
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	self.connect("toggled", Callable(self, "_on_pause_button_toggled"))
	get_node("/root/Main/Audio/ButtonPressed").process_mode = Node.PROCESS_MODE_ALWAYS
	text = "Pause"

func _on_pause_button_toggled(is_pressed: bool) -> void:  # Ubah nama parameter
	if is_pressed:
		get_node("/root/Main/Audio/ButtonPressed").play()
		get_tree().paused = true  # Pause game
		text = "Lanjut"
		overlay.visible = true  # Tampilkan overlay
		pause_label.visible = true
		retry.visible = true
	else:
		get_node("/root/Main/Audio/ButtonPressed").play()
		get_tree().paused = false  # Resume game
		text = "Pause"
		overlay.visible = false  # Sembunyikan overlay
		pause_label.visible = false
		retry.visible = false
