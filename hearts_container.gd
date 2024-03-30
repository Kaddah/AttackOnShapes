extends HBoxContainer


@onready var HeartGUIClass = preload("res://heart_gui.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
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
