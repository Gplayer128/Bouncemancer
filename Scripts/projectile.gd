extends CharacterBody2D

@export var SPEED = 100

var dir : float
var spawnPos : Vector2
var spawnRot : float

func _ready() :
	global_position = spawnPos
	global_rotation = spawnRot

func setup(p_dir: float, p_pos: Vector2, p_rot: float):
	dir = p_dir
	spawnPos = p_pos
	spawnRot = p_rot

func _physics_process(delta):
	velocity = Vector2(0, 0).rotated(dir)
	move_and_slide()
