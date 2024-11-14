extends Area2D

# Fungsi ini akan dipanggil saat sampah memasuki tempat sampah
func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))  # Pastikan menghubungkan area_entered

# Fungsi yang dipanggil ketika objek (sampah) memasuki area tempat sampah
func _on_area_entered(area: Area2D):
	# Pastikan objek yang masuk adalah sampah dan berada dalam grup 'trash'
	if area.is_in_group("trash"):
		var main_scene = get_tree().root.get_node("Main")  # Sesuaikan dengan nama node utama
		if main_scene:
			# Mengirim informasi tentang sampah dan nama tempat sampah ke script utama
			main_scene._on_bin_area_entered(area, self.name)
