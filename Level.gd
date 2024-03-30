extends Node2D

@onready var player = $Player
@onready var laser_container = $laserContainer
@onready var heartsContainer = $CanvasLayer2/heartsContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	
	heartsContainer.setMaxHearts(5)
	
	player = $Player
	assert(player!=null)
	player.laser_shot.connect(_on_player_laser_shot)
	player.healthChanged.connect(heartsContainer.decreaseHearts)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
func _on_player_laser_shot(laser_scene, location, rotation):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser.rotation = rotation
	laser_container.add_child(laser)
