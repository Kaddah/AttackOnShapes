extends Timer

var PowerUpSpeed = preload("res://PowerUp/PowerUpSpeed.tscn")

func _on_timeout():
	var powerUpSpeed = PowerUpSpeed.instantiate()
	powerUpSpeed.position = Vector2(randi_range(10, 1150), randi_range(10,625))
	$"..".add_child(powerUpSpeed)
	
