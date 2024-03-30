extends CharacterBody2D

var WeakPoint = preload("res://edgemon_weak_point.tscn")
var edges: int  = 3
var hp: int = 3
var radius = 100
var move_speed: int = 100
var weakPointTexture: ImageTexture

var time: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	weakPointTexture = ImageTexture.create_from_image(Image.load_from_file("res://Red_Circle_full.png"))
	generate()
	
func generate() -> void:
	var line2D: Line2D = $Line2D
	var collisionPolygon2D: CollisionPolygon2D = $CollisionPolygon2D
	var angle: float = (2 * PI) / edges
	
	line2D.clear_points()
	var points = []
	for i in range(edges):
		var point = Vector2.from_angle(angle * i) * radius
		line2D.add_point(point)
		points.append(point)
		var weak_point = WeakPoint.instantiate()
		weak_point.position = point
		weak_point.destroyed.connect(on_hit.bind(weak_point))
		add_child(weak_point)
		
	line2D.add_point(line2D.get_point_position(0))
	collisionPolygon2D.polygon = PackedVector2Array(points)
	print(points)
		

func on_hit(weak_point):
	remove_child(weak_point)
	hp -= 1
	if hp == 0:
		edges += 1
		hp = edges
		generate()
	 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("transform"):
		edges = edges + 1
		hp = edges
		generate()
		
	# Pulse
	const freq: int = 1
	const amplitude: float = 0.5
	time += delta
	var s: float = sin(time * freq) * amplitude
	scale = Vector2(1 + s, 1 + s)
	
	# Rotation
	rotation += 0.01
	
	# Chase player
	var player_position = $"../Player".position
	velocity = (player_position - position).normalized() * move_speed
	move_and_slide()
