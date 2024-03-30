extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta):
	var forward = Input.is_action_pressed("forward")
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	
	if right:
		rotation += 10 * delta
	elif left:
		rotation -= 10 * delta
	
	if forward:
		velocity = Vector2(-400, 0).rotated(rotation)
	else:
		velocity = Vector2(0,0)	
	
	move_and_slide()

	
