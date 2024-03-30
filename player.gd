extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

signal laser_shot(laser_scene, location, rotation)
#signal laser_orientation(global_rotation)
var laser_scene = preload("res://laser.tscn")

@onready var muzzle = $Muzzle

func _process(delta):
	var forward = Input.is_action_pressed("forward")
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	if right:
		rotation += 10 * delta
	elif left:
		rotation -= 10 * delta
	
	if forward:
		velocity = Vector2(-400, 0).rotated(rotation)
	else:
		velocity = Vector2(0,0)	
	
	move_and_slide()

func shoot():
	laser_shot.emit(laser_scene, muzzle.global_position, rotation)
	#laser_orientation.emit(global_rotation)


	
