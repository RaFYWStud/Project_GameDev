extends Area2D

@export var speed = 200  # Kecepatan jatuh, akan diubah dari main.gd
var unique_id : String = ""

func _ready():
	z_index = 5
	unique_id = str(self.get_instance_id())  # ID unik untuk sampah

# Fungsi untuk memproses ketika sampah berada di tempat sampah yang benar atau salah
func _on_area_entered(area: Area2D):
	if area.name == "OrganicBin" or area.name == "AnorganicBin" or area.name == "ToxicBin":
		var bin_name = area.name
		var main_scene = get_tree().root.get_node("Main")
		if main_scene:
			main_scene._on_bin_area_entered(self, bin_name)  # Kirim objek trash dan nama tempat sampah
