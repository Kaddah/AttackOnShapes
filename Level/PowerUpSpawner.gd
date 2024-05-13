extends Timer

var PowerUp = preload("res://PowerUp/PowerUp.tscn")

func _on_timeout():
	var powerUp = PowerUp.instantiate()
	powerUp.position = Vector2(randi_range(10, 1150), randi_range(10,625))
	$"..".add_child(powerUp)
	
