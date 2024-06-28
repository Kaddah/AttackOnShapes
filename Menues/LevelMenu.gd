extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Level 1".grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Menues/main_menu.tscn")# Replace with function body.


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Level/Level.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Level/level_2.tscn")
