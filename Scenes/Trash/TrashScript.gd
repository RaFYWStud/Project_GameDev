extends Area2D

@export var speed = 200  # Kecepatan jatuh sampah
<<<<<<< Updated upstream
=======
@export var trash_type = ""  # Jenis sampah: "Organic", "Anorganic", atau "Toxic"
>>>>>>> Stashed changes

func _ready():
	add_to_group("trash")  # Tambahkan ke grup sampah
	z_index = 5

<<<<<<< Updated upstream
	# Atur ukuran sampah melalui skala sprite

=======
>>>>>>> Stashed changes
func _process(delta):
	# Membuat sampah jatuh ke bawah
	position.y += speed * delta

	# Menghapus sampah jika sudah melewati layar bawah dan mengurangi nyawa
	if position.y > get_viewport().size.y:
		var main_scene = get_tree().get_root().get_node("Main")
		if main_scene:
			main_scene.decrease_lives()  # Kurangi nyawa jika sampah jatuh ke sungai
		queue_free()
