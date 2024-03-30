extends Timer

var collectable = preload("res://collectable.tscn")


func _on_timeout():
	randomize()
	var flower = collectable.instantiate()
	flower.position = Vector2(randi_range(10, 1150), randi_range(10,625))
	add_child(flower)
	wait_time = randi_range(0,1)
