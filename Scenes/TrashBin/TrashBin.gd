extends Area2D

# Fungsi ketika objek memasuki area tong sampah
func _on_organic_area_entered(area):
	if area.name == "Organic" or area.name == "Anorganic" or area.name == "Toxic":
		
		area.queue_free()  # Menghapus sampah yang masuk
