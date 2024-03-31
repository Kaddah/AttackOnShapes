extends RigidBody2D

const SPEED: int = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.from_angle(rotation)
	var collision = move_and_collide(direction * delta * SPEED)
	if collision:
		var collider = collision.get_collider()
		print("Projectile collided: ", collider)
		if collider.is_in_group("weak_point"):
			collider.apply_damage(1)
		queue_free()
