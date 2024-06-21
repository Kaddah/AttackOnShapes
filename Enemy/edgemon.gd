extends CharacterBody2D

const SPEED: int = 75
const RADIUS: int = 100
var time:float = 0
signal evolve
var level = 2


var edges:int = 3:
	set(value):
		edges = value
		health = value
		var angle: float = (2 * PI) / value
		var line2D: Line2D = $Line2D
		line2D.clear_points()

		var points = []
		for i in range(value):
			var rot = angle * i
			var point = Vector2.from_angle(rot) * RADIUS
			line2D.add_point(point)
			points.append(point)
			var weak_point:WeakPoint = WeakPoint.instantiate()
			weak_point.position = point
			weak_point.rotation = rot + 0.5 * PI
			weak_point.destroyed.connect(on_weak_point_destroyed)
			add_child(weak_point)
			
		line2D.add_point(line2D.get_point_position(0))
		#$CollisionPolygon2D.polygon = PackedVector2Array(points)
		print(points)
		
var health: int = 3: 
	set(value):
		health = value
		print("health: ", health)
		print ("level :", get_tree().get_current_scene().get_name())
		if health == 0:
			if  get_tree().get_current_scene().get_name() == "Level":
				print ("level :", get_tree().get_current_scene().get_name())
				evolve.emit(edges)
				edges += 1
			else:
				get_tree().change_scene_to_file("res://Menues/WinMenu.tscn")
			

var WeakPoint = preload("res://Enemy/weak_points.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	edges = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Pulse
	const freq: int = 2
	const amplitude: float = 0.6
	time += delta
	var s: float = sin(time * freq) * amplitude
	scale = Vector2(1 + s, 1 + s)
	
	# Rotation
	rotation += 0.015
	
	# Chase player
	var player_position = $"../Player".position
	velocity = (player_position - position).normalized() * SPEED
	move_and_slide()
	
func on_weak_point_destroyed(weak_point):
	health -= 1
	


 
