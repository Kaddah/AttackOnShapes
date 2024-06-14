extends Node2D

const height = 2732
const width = 2732

func _on_player_ammo_changed(amount):
	$Ammo.size = Vector2(width, amount * height + 1)
	
var messageTime : float



func _ready():
	$HighscoreLabel.visible = true
	
	$Ammo.size = Vector2(width, $Player.ammo * height + 1)
	messageTime = 5.0
	$MessageLabel.text = "Defeat the Trimon" 
	var LevelNr = 2
	
func _process(delta):
	if messageTime > 0:
		$MessageLabel.visible = true
		messageTime -= delta
	else:
		$MessageLabel.visible = false

#func checkdeath():
	#if death == true:
		
