extends StaticBody2D
class_name WeakPoint

signal destroyed(Node2D)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func apply_damage(damage:int ):
	print("damage applied: ", damage)
	destroyed.emit(self)
	queue_free()
