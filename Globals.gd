extends Node

const HIGHSCORE_FILE = "user://highscores.cfg"
const MAX_HIGHSCORES = 5

var scores = []  # Liste der Scores
var names = []   # Liste der Namen
var score = 0

func _ready():
	load_highscores()

# Benutzerdefinierte Funktion zum Zippen von zwei Arrays
func zip_arrays(array1: Array, array2: Array) -> Array:
	var zipped_array = []
	var min_length = min(array1.size(), array2.size())
	for i in range(min_length):
		zipped_array.append([array1[i], array2[i]])
	return zipped_array

func save_highscore(score: int, name: String):
	load_highscores()
	
	scores.append(score)
	names.append(name)
	
	# Kombiniere die Namen und Scores in Tupeln
	var combined = zip_arrays(scores, names)
	
	# Sortiere die kombinierten Daten nach dem Score absteigend
	combined.sort()
	combined.reverse()  # Sortiere absteigend durch Umkehrung der aufsteigend sortierten Liste
	
	# Begrenze die Anzahl der Highscores auf MAX_HIGHSCORES
	if combined.size() > MAX_HIGHSCORES:
		combined.resize(MAX_HIGHSCORES)
	
	# Entpacke die sortierten Daten in die scores und names Arrays
	scores.clear()
	names.clear()
	for entry in combined:
		scores.append(entry[0])
		names.append(entry[1])
	
	save_scores_to_file()

func load_highscores():
	scores.clear()
	names.clear()
	var config = ConfigFile.new()
	var error = config.load(HIGHSCORE_FILE)
	if error == OK:
		for i in range(MAX_HIGHSCORES):
			if config.has_section_key("highscores", str(i) + "_name") and config.has_section_key("highscores", str(i) + "_score"):
				var name = config.get_value("highscores", str(i) + "_name")
				var score = config.get_value("highscores", str(i) + "_score")
				scores.append(score)
				names.append(name)
	else:
		print("Failed to load high score file or file does not exist: ", error)

func save_scores_to_file():
	var config = ConfigFile.new()
	for i in range(scores.size()):
		config.set_value("highscores", str(i) + "_name", names[i])
		config.set_value("highscores", str(i) + "_score", scores[i])
	
	var error = config.save(HIGHSCORE_FILE)
	if error != OK:
		print("Failed to save high score file: ", error)
	else:
		print("High scores saved successfully.")
