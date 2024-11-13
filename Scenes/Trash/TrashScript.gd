extends Area2D

@export var speed = 200  # Kecepatan jatuh sampah

# Fungsi yang akan dipanggil ketika area ini bertabrakan dengan area lain
func _on_area_entered(area):
	# Mengecek apakah area yang memasuki adalah tong sampah (organic)
	if area.name == "OrganicBin" or area.name == "AnorganicBin" or area.name == "ToxicBin":  # Pastikan nama area adalah "organic" (tong sampah)
		queue_free()  # Menghapus sampah yang masuk

func _ready():
	# Menentukan posisi spawn di dalam lebar layar
	z_index = 5

	# Tidak perlu connect() manual karena sinyal `area_entered` sudah ada di node `Area2D`
	# Kita cukup menambahkan koneksi sinyal melalui editor atau dengan cara lain.

func _process(delta):
	# Membuat sampah jatuh ke bawah
	position.y += speed * delta

	# Menghapus sampah jika sudah melewati layar bawah
	if position.y > get_viewport().size.y:
		queue_free()
