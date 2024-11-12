extends Area2D

@export var speed = 200  # Kecepatan jatuh sampah

func _ready():
	# Menentukan posisi spawn di dalam lebar layar
	z_index = 5

	# Atur ukuran sampah melalui skala sprite

func _process(delta):
	# Membuat sampah jatuh ke bawah
	position.y += speed * delta

	# Menghapus sampah jika sudah melewati layar bawah
	if position.y > get_viewport().size.y:
		queue_free()
