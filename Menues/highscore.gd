extends CanvasLayer

const LABELS_COUNT = 5

var highscore_labels = []  # Liste für die einzelnen Label-Knoten

func _ready():
	$BackButton.grab_focus()
	# Sammeln der Label-Knoten
	for i in range(1, LABELS_COUNT + 1):
		var label = get_node("Label" + str(i))
		highscore_labels.append(label)

	display_highscores()

func display_highscores():

	for label in highscore_labels:
		label.text = ""  # Leere jedes Label

	for i in range(LABELS_COUNT):
		if i < Globals.names.size():
			var label_text = str(i + 1) + ". " + Globals.names[i] + " - " + str(Globals.scores[i])
			highscore_labels[i].text = label_text
		else:
			# Wenn weniger Highscores vorhanden sind als Labels, leere das entsprechende Label
			highscore_labels[i].text = ""



func _on_BackButton_pressed():
	get_tree().change_scene_to_file("res://Menues/main_menu.tscn")
