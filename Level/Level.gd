extends Node2D

var messageTime : float 

# Called when the node enters the scene tree for the first time.
func _ready():
	messageTime = 5.0
	$MessageLabel.text = "TEST MESSAGE"
	$Edgemon.evolve.connect(_display_evolve_message)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if messageTime > 0:
		$MessageLabel.visible = true
		messageTime -= delta
	else:
		$MessageLabel.visible = false
		
	
func _display_evolve_message(edges: int):
	$MessageLabel.text = "Tod " + str(edges)
	messageTime = 5.0
