extends CharacterBody2D

var edges: int  = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	var image = Image.create(128, 128, false, Image.FORMAT_RGBA8)
	image.fill(Color.BLUE)

	for x in range(14):
		for y in range(14):
			image.set_pixel(x + 0, y + 0, Color.RED)

	var imageTexture = ImageTexture.create_from_image(image)
	#$Sprite2D.texture = imageTexture
	generate()
	
func generate() -> void:
	var line2D: Line2D = $Line2D
	var angle: float = (2 * PI) / edges
	var radius = 100
	
	line2D.clear_points()
	for i in range(edges + 1):
		var position: Vector2 = Vector2.from_angle(angle * i) * radius
		print(angle * i, position)
		line2D.add_point(position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("transform"):
		edges = edges + 1
		generate()
	rotation += 0.01
