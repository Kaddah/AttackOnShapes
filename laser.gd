extends Node2D

@export var speed = 600

func _process(delta): 
	global_position +=  delta * speed *Vector2.LEFT.rotated(rotation)



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
