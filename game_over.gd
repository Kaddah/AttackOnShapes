extends CanvasLayer

func _on_exit_pressed():
	get_tree().quit()

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://Level/Level.tscn")

func _ready():
	$retry.grab_focus()
