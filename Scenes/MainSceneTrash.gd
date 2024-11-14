extends Node2D

@export var spawn_interval = 3
var spawn_timer = 0.0
var trash_scenes = []
var fall_speed = 20
var time_elapsed = 0.0
var fall_increase_rate = 2
var spawn_increase_rate = 0.01
var rotation_speed = 180.0  # Kecepatan rotasi dalam derajat per detik

var score = 0
var lives = 5

func _ready():
	trash_scenes = [
		load("res://Scenes/Trash/Organic.tscn"),
		load("res://Scenes/Trash/Anorganic.tscn"),
		load("res://Scenes/Trash/Toxic.tscn")
	]
	randomize()
	update_score_label()
	update_lives_label()

func _process(delta):
	spawn_timer += delta
	time_elapsed += delta
	fall_speed += fall_increase_rate * delta
	spawn_interval = max(0.5, spawn_interval - spawn_increase_rate * delta)

	if spawn_timer >= spawn_interval:
		spawn_timer = 0
		spawn_trash()

	for child in get_children():
		if child.is_in_group("trash"):
			child.position.y += fall_speed * delta
			child.rotation += rotation_speed * delta * deg_to_rad(1)  # Rotasi objek

func spawn_trash():
	if trash_scenes.size() > 0:
		var trash_scene = trash_scenes[randi() % trash_scenes.size()]
		if trash_scene:
			var trash_instance = trash_scene.instantiate()
			add_child(trash_instance)
			trash_instance.add_to_group("trash")
			if trash_instance.get_child_count() > 0 and trash_instance.get_child(0).texture:
				trash_instance.position = Vector2(randf_range(-250, 300), -650)
<<<<<<< Updated upstream
=======

# Fungsi untuk memperbarui tampilan skor
func update_score_label():
	$ScoreLabel.text = "Score: " + str(score)

# Fungsi untuk memperbarui tampilan nyawa
func update_lives_label():
	$LivesLabel.text = "Lives: " + str(lives)

# Fungsi untuk menambah skor ketika sampah dimasukkan dengan benar
func increase_score():
	score += 1
	update_score_label()

# Fungsi untuk mengurangi nyawa ketika sampah dimasukkan salah atau jatuh ke sungai
func decrease_lives():
	lives -= 1
	update_lives_label()
	if lives <= 0:
		game_over()

# Fungsi yang dijalankan ketika nyawa habis
func game_over():
	print("Game Over")  # Tambahkan logika untuk layar Game Over atau restart game
>>>>>>> Stashed changes
