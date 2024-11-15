extends Node2D

@export var spawn_interval = 3
var spawn_timer = 0.0
var trash_scenes = []
var fall_speed = 200
var time_elapsed = 0.0
var spawn_increase_rate = 0.01
var rotation_speed = 180.0

# Variabel untuk nyawa dan skor
var lives = 5
var score = 0

@onready var lives_label = $LivesLabel
@onready var score_label = $ScoreLabel

func _ready():
	trash_scenes = [
		load("res://Scenes/Trash/Organic.tscn"),
		load("res://Scenes/Trash/Anorganic.tscn"),
		load("res://Scenes/Trash/Toxic.tscn")
	]
	randomize()
	update_ui()

func _process(delta):
	spawn_timer += delta
	time_elapsed += delta
	fall_speed += 2 * delta
	spawn_interval = max(0.5, spawn_interval - spawn_increase_rate * delta)

	if spawn_timer >= spawn_interval:
		spawn_timer = 0
		spawn_trash()

	for child in get_children():
		if child.is_in_group("trash"):
			child.position.y += fall_speed * delta
			child.rotation += rotation_speed * delta * deg_to_rad(1)

func spawn_trash():
	if trash_scenes.size() > 0:
		var trash_scene = trash_scenes[randi() % trash_scenes.size()]
		if trash_scene:
			var trash_instance = trash_scene.instantiate()
			add_child(trash_instance)
			trash_instance.add_to_group("trash")  # Menambahkan sampah ke grup 'trash'

			# Menetapkan nama sesuai dengan jenisnya
			if trash_scene == load("res://Scenes/Trash/Organic.tscn"):
				trash_instance.name = "Organic_" + str(trash_instance.get_instance_id())
			elif trash_scene == load("res://Scenes/Trash/Anorganic.tscn"):
				trash_instance.name = "Anorganic_" + str(trash_instance.get_instance_id())
			elif trash_scene == load("res://Scenes/Trash/Toxic.tscn"):
				trash_instance.name = "Toxic_" + str(trash_instance.get_instance_id())

			# Set posisi spawn dan kecepatan jatuh
			trash_instance.position = Vector2(randf_range(-250, 300), -650)

func reduce_lives():
	lives -= 1
	update_ui()
	if lives <= 0:
		game_over()

func update_ui():
	lives_label.text = "Lives: " + str(lives)
	score_label.text = "Score: " + str(score)

func game_over():
	print("Game Over!")  # Ganti dengan logika game over yang sesuai

# Fungsi yang dipanggil ketika sampah memasuki area tempat sampah
func _on_bin_area_entered(trash: Area2D, bin_name: String):
	print("Received trash: %s for bin: %s" % [trash.name, bin_name])  # Debugging line

	# Mengecek apakah sampah sesuai dengan tempat sampah
	if bin_name == "OrganicBin" and trash.name.begins_with("Organic"):
		print("Correct bin! Adding 1 points")  # Debugging line
		score += 1  # Tambah skor jika sesuai
	elif bin_name == "AnorganicBin" and trash.name.begins_with("Anorganic"):
		print("Correct bin! Adding 1 points")  # Debugging line
		score += 1  # Tambah skor jika sesuai
	elif bin_name == "ToxicBin" and trash.name.begins_with("Toxic"):
		print("Correct bin! Adding 1 points")  # Debugging line
		score += 1  # Tambah skor jika sesuai
	else:
		print("Incorrect bin! Reducing lives")  # Debugging line
		reduce_lives()  # Mengurangi nyawa jika sampah salah tempat
		
	update_ui()  # Perbarui UI (skor dan nyawa)
	trash.queue_free()
	
func _on_water_area_entered(trash: Area2D):
	# Pastikan objek yang masuk adalah sampah dan berada dalam grup 'trash'
	if trash.is_in_group("trash"):
		print("Trash entered the water area!")
		reduce_lives()
	update_ui()  # Perbarui UI (skor dan nyawa)
	trash.queue_free()  # Mengurangi nyawa
