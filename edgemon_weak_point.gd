extends Area2D

signal destroyed 

func _on_body_entered(body):
	print(body)
	if body.is_in_group("missile"):
		destroyed.emit()
