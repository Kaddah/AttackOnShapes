extends Timer

var PowerUpHealth = preload("res://PowerUp/PowerUpHealth.tscn")

func _on_timeout():
	var PowerUpHealth = PowerUpHealth.instantiate()
	PowerUpHealth.position = Vector2(randi_range(10, 1150), randi_range(10,625))
	$"..".add_child(PowerUpHealth)
	
