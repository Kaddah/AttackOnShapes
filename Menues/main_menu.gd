extends CanvasLayer

func _ready():
	$Play.grab_focus()

func _on_exit_pressed():
	get_tree().quit()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Menues/LevelMenu.tscn")
	
func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Menues/tutorial.tscn")

func _on_highscore_pressed():
	get_tree().change_scene_to_file("res://Menues/highscore.tscn")
