extends Control

@onready var apple_label = get_node("/root/Almanac/FunFact/applefunfact")
@onready var banana_label = get_node("/root/Almanac/FunFact/bananafunfact")
@onready var waterbottle_label = get_node("/root/Almanac/FunFact/waterbottlefunfact")
@onready var can_label = get_node("/root/Almanac/FunFact/canfunfact")
@onready var battery_label = get_node("/root/Almanac/FunFact/batteryfunfact") # Perbaikan nama
@onready var poison_label = get_node("/root/Almanac/FunFact/poisonfunfact")
@onready var knowledge_label = $KnowledgeLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_Apple_pressed():
	$Audio/ButtonPressed.play()
	apple_label.visible = false
	banana_label.visible = false
	waterbottle_label.visible = false
	can_label.visible = false
	battery_label.visible = false
	poison_label.visible = false
	knowledge_label.visible = false
	
	apple_label.visible = not apple_label.visible

func _on_Banan_pressed():
	$Audio/ButtonPressed.play()
	apple_label.visible = false
	banana_label.visible = false
	waterbottle_label.visible = false
	can_label.visible = false
	battery_label.visible = false
	poison_label.visible = false
	knowledge_label.visible = false
	
	banana_label.visible = not banana_label.visible

func _on_WaterBottle_pressed():
	$Audio/ButtonPressed.play()
	apple_label.visible = false
	banana_label.visible = false
	waterbottle_label.visible = false
	can_label.visible = false
	battery_label.visible = false
	poison_label.visible = false
	knowledge_label.visible = false
	
	waterbottle_label.visible = not waterbottle_label.visible

func _on_Can_pressed():
	$Audio/ButtonPressed.play()
	apple_label.visible = false
	banana_label.visible = false
	waterbottle_label.visible = false
	can_label.visible = false
	battery_label.visible = false
	poison_label.visible = false
	knowledge_label.visible = false
	
	can_label.visible = not battery_label.visible

func _on_Battery_pressed():
	$Audio/ButtonPressed.play()
	apple_label.visible = false
	banana_label.visible = false
	waterbottle_label.visible = false
	can_label.visible = false
	battery_label.visible = false
	poison_label.visible = false
	knowledge_label.visible = false
	
	battery_label.visible = not battery_label.visible

func _on_Poison_pressed():
	$Audio/ButtonPressed.play()
	apple_label.visible = false
	banana_label.visible = false
	waterbottle_label.visible = false
	can_label.visible = false
	battery_label.visible = false
	poison_label.visible = false
	knowledge_label.visible = false
	
	poison_label.visible = not poison_label.visible


func _on_back_button_2_pressed() -> void:
	$Audio/ButtonPressed.play()
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
