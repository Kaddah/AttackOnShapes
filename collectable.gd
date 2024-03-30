extends Node2D

func _on_body_entered(body):
	if body.name == "Player":
		queue_free()
	

  
