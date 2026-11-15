extends Area2D

@export var speed: float = 500.0

var trampoline_instance = preload("res://HighTrampoline.tscn")

var num
var hit_wall : bool
var second_anim : bool

@onready var anim_player : AnimatedSprite2D = $AnimatedSprite2D

var dir : float
var spawnPos : Vector2
var spawnRot : float

func _ready() -> void:
	num = 0
	second_anim = false
	hit_wall = false
	global_position = spawnPos
	global_rotation = spawnRot # Rotates the projectile to match the aiming angle

func _physics_process(delta: float) -> void:
	# Only move if it hasn't hit a wall yet
	if !hit_wall:
		# Convert the angle (dir) into a directional vector and multiply by speed
		var movement_vector = Vector2.RIGHT.rotated(dir) * speed
		position += movement_vector * delta

func setup(p_dir: float, p_pos: Vector2, p_rot: float) -> void:
	dir = p_dir
	spawnPos = p_pos
	spawnRot = p_rot

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("WALLS"):
		hit_wall = true
		anim_player.play("hit")

func _on_animated_sprite_2d_animation_finished() -> void:
	if num == 0:
		position += Vector2(-60.0, 0.0)
		anim_player.play("hit2")
		num += 1
	else:
		var instantiated_node = trampoline_instance.instantiate()
		get_tree().current_scene.add_child(instantiated_node)
		instantiated_node.global_position = global_position
		queue_free()
