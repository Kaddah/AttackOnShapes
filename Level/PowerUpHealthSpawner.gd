extends Timer

var PowerUpHealth = preload("res://PowerUp/PowerUpHealth.tscn")

func _on_timeout():
	var powerUpHealth = PowerUpHealth.instantiate()
	powerUpHealth.position = Vector2(randi_range(10, 1150), randi_range(10,625))
	$"..".add_child(powerUpHealth)
	
