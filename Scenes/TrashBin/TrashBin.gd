extends Area2D

@export var bin_type = "" 
@onready var main_scene = get_tree().get_root().get_node("Main")  

# Fungsi ketika objek memasuki area tong sampah
func _on_area_entered(area):
	if area.name == bin_type:
		main_scene.increase_score()  # Tambahkan skor jika jenis sampah cocok
		area.queue_free()  # Hapus sampah yang benar
	else:
		main_scene.decrease_lives()  # Kurangi nyawa jika jenis sampah tidak cocok
		area.queue_free()  # Hapus sampah yang salah
