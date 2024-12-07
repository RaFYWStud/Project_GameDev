class_name HighScore extends Resource

@export var high_score:int = 0

const SAVE_PATH:String = "user://high_score.tres"

func Save() -> void:
	ResourceSaver.save(self, SAVE_PATH)
	
static func load_or_create() -> HighScore:
	var res:HighScore
	if FileAccess.file_exists(SAVE_PATH):
		res = load(SAVE_PATH) as HighScore
	else:
		res = HighScore.new()
	return res
