extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var music_bus_index = AudioServer.get_bus_index("music")
	var sfx_bus_index = AudioServer.get_bus_index("sfx")
	music_value_changed.connect(_on_music_value_changed)
	

func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db("music", linear_to_db(value))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	volume_update()
	
func volume_update():
	var music_volume = $MusicScrollBar
	var sfx_volume = $SfxScrollBar
	AudioGlobal.music_volume = music_volume.value
	AudioGlobal.sfx_volume = music_volume.value
	
	
