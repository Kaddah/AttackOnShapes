extends Node2D

@onready var laser_container = $laserContainer

var player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	#player = get_tree().get_first_node_in_group("player")
	
	player = $Player
	assert(player!=null)
	player.laser_shot.connect(_on_player_laser_shot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
func _on_player_laser_shot(laser_scene, location, rotation):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser.rotation = rotation
	laser_container.add_child(laser)
