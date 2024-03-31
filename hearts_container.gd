extends HBoxContainer


@onready var HeartGUIClass = preload("res://heart_gui.tscn")

func setMaxHearts(max: int):
	
	for i in range(max):
		var heart = HeartGUIClass.instantiate()
		add_child(heart)
	
	
func decreaseHearts(currentHealth):
	print_debug(currentHealth)
	for child in get_children():
		remove_child(child)
	
	for i in range (currentHealth):
		var heart = HeartGUIClass.instantiate()
		add_child(heart)
