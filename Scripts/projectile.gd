extends Area2D

@export var SPEED = 800 # Increased default speed so it's visible

var dir : float
var spawnPos : Vector2
var spawnRot : float

func _ready() -> void:
	global_position = spawnPos
	# Calculate velocity using SPEED and the direction angle

func setup(p_dir: float, p_pos: Vector2, p_rot: float) -> void:
	dir = p_dir
	spawnPos = p_pos
	spawnRot = p_rot
