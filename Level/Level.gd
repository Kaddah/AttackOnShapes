extends Node2D

const height = 2732
const width = 2732

const edgemonNames = [
	"Nilmon",
	"Monomon",
	"Dimon",
	"Trimon",
	"Tetramon",
	"Pentamon",
	"Hexamon",
	"Heptamon",
	"Octamon",
	"Enneamon",
	"Decamon",
	"Hendecamon",
	"Dodecamon",
	"Triskaidecamon",
	"Tetrakaidecamon",
	"Pentakaidecamon",
	"Hexakaidecamon",
	"Heptakaidecamon",
	"Octakaidecamon",
	"Enneakaidecamon",
	"Icosamon"
]

func _on_player_ammo_changed(amount):
	$Ammo.size = Vector2(width, amount * height + 1)

var messageTime : float 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Ammo.size = Vector2(width, $Player.ammo * height + 1)
	messageTime = 5.0
	$MessageLabel.text = "Defeat the " + getEdgemonName(3)
	$Edgemon.evolve.connect(_display_evolve_message)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if messageTime > 0:
		$MessageLabel.visible = true
		messageTime -= delta
	else:
		$MessageLabel.visible = false
		
	
func _display_evolve_message(edges: int): 
	$MessageLabel.text = "\"This isn't even my final form!\"s\n" + getEdgemonName(edges) + " evolves to " + getEdgemonName(edges + 1)
	messageTime = 8.0

func getEdgemonName(edges : int):
	if edges < edgemonNames.size():
		return edgemonNames[edges]
	return "Infimon"
