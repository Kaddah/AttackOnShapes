extends CharacterBody2D

const SPEED = 300.0

var Projectile = preload("res://Player/projectile.tscn")

var bee_fly = preload("res://Player/bee_fly.png")
var bee_attack = preload("res://Player/bee_attack.png")

signal ammo_changed(amount:int)
var ammo:int = 3 :
	set(value):
		ammo = clamp(value, 0, 3)
		ammo_changed.emit(ammo)
		
func update_rotation(delta):
	rotation += delta
	if -90 < rotation_degrees and rotation_degrees < 90:
		scale = Vector2(scale.x, abs(scale.y))
	else:
		scale = Vector2(scale.x, abs(scale.y) * -1)

func _process(delta):
	if Input.is_action_pressed("right"):
		update_rotation(8 * delta)
		
	if Input.is_action_pressed("left"):
		update_rotation(-8 * delta)
		
	var direction = Vector2(0,0)
	var moving = Input.is_action_pressed("forward")
	if moving:
		$Sprite2D.texture = bee_fly
	else:
		$Sprite2D.texture = bee_attack
		
	if moving:
		direction = Vector2.RIGHT.rotated(rotation) * SPEED * delta
	elif Input.is_action_just_pressed("shoot") and ammo > 0:
		ammo -= 1
		var projectile = Projectile.instantiate() 
		projectile.global_position = global_position
		projectile.rotation = rotation
		$"..".add_child(projectile)
		
	var collision = move_and_collide(direction)
	if collision:
		on_collide(collision.get_collider())

func on_collide(body):
	if body.is_in_group("flower"):
		ammo += 1
		body.queue_free()
		
	if body.is_in_group("enemy"):
		print("GameOver")
