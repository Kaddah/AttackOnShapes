extends Area2D

signal destroyed 

func _on_body_entered(body):
	if body.is_in_group("player"):
		destroyed.emit()
