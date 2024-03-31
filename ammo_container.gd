extends HBoxContainer

@onready var AmmoGuiClass = preload("res://ammo_gui.tscn")
# Called when the node enters the scene tree for the first time.

func setMaxAmmo(max: int):
	
	for i in range(max):
		var ammo = AmmoGuiClass.instantiate()
		add_child(ammo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
