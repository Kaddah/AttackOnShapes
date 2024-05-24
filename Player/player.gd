extends CharacterBody2D

var SPEED = 300.0

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
	var movingForward = Input.is_action_pressed("forward")
	var movingBackward = Input.is_action_pressed("backward")
	if movingForward:
		$Sprite2D.texture = bee_fly
	else:
		$Sprite2D.texture = bee_attack
		
	
		
		
		
	if movingForward:
		direction = Vector2.RIGHT.rotated(rotation) * SPEED * delta
	if movingBackward:
		direction = Vector2.RIGHT.rotated(rotation) * SPEED * -delta
		
	if Input.is_action_just_pressed("shoot") and ammo > 0:
		$AudioStreamPlayer.playing = true
		ammo -= 1
		var projectile = Projectile.instantiate() 
		projectile.global_position = global_position + Vector2(12,12)
		projectile.rotation = rotation
		$"..".add_child(projectile)
		
		
		
		
	var collision = move_and_collide(direction)
	if collision:
		on_collide(collision.get_collider())

func doubleShot():
	
		$AudioStreamPlayer.playing = true
		ammo -= 2 # Ziehe zwei von der Munition ab, da zwei Projektile abgefeuert werden
		var projectile1 = Projectile.instantiate()
		var projectile2 = Projectile.instantiate()
		projectile1.global_position = global_position + Vector2(12, 12)
		projectile2.global_position = global_position + Vector2(12, 12) # Ändere die Position des zweiten Projektils
		projectile1.rotation = rotation
		projectile2.rotation = rotation # Setze die Rotation für beide Projektile
		$"..".add_child(projectile1)
		$"..".add_child(projectile2) # Füge beide Projektile als Kinder hinzu

	

func on_collide(body):
	if body.is_in_group("flower"):
		ammo += 1
		body.queue_free()
		
	if body.is_in_group("PowerUp"):
		ammo += 2
		SPEED *= 2
		if Input.is_action_just_pressed("shoot") and ammo > 1:
			doubleShot()
		$DoubleSpeed.start()
		body.queue_free()
		
	if body.is_in_group("enemy"):
		$DeathSound.playing = true
		get_tree().change_scene_to_file("res://Menues/game_over.tscn")


func _on_double_speed_timeout():
	SPEED = 300
