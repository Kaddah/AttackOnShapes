extends Timer

var collectable = preload("res://collectable.tscn")

func _on_timeout():
	randomize()
	var flower = collectable.instantiate()
	flower.position = Vector2(randi_range(10, 990), randi_range(0,590))
	add_child(flower)
	wait_time = randi_range(0,1)

