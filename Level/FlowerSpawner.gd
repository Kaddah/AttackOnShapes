extends Timer

var Flower = preload("res://Flower/flower.tscn")

func _on_timeout():
	var flower = Flower.instantiate()
	flower.position = Vector2(randi_range(10, 1150), randi_range(10,625))
	$"..".add_child(flower)
	
