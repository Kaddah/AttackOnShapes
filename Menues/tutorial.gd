extends CanvasLayer
func _ready():
	$Back.grab_focus()
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menues/main_menu.tscn")
