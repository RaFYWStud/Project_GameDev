extends Node

var score: int = 0
var high_score:HighScore

func _ready() -> void:
	high_score = HighScore.load_or_create()
	print("Singleton Has been loaded Score:", score)
