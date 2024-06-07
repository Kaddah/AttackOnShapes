extends CanvasLayer

var name_input: LineEdit

func _ready():
	$retry.grab_focus()
	$score.text = str(Globals.score)  # Anzeige des aktuellen Punktestands
	name_input = $name

func _on_exit_pressed():
	get_tree().quit()

func _on_retry_pressed():
	# Setze den Score zurück und wechsle zur Level-Szene
	Globals.score = 0
	get_tree().change_scene_to_file("res://Level/Level.tscn")

func _on_save_pressed():
	var name = name_input.text.strip_edges()  # Bereinigung des eingegebenen Namens
	if name != "":
		Globals.save_highscore(Globals.score, name)
		get_tree().change_scene_to_file("res://Menues/highscore.tscn")
	else:
		print("Name field is empty. Please enter your name.")
