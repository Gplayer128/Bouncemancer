extends Area2D

@export var SPEED = 1200 # Increased default speed so it's visible
@export var speed: float = 500.0

var trampoline_inst = preload("res://trampoline.tscn")

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
	# Calculate velocity using SPEED and the direction angle

var direction: Vector2 = Vector2.RIGHT # Change this to move left, up, down, etc.

func _physics_process(delta: float) -> void:
	# Moves the Area2D by adding to its position every frame
	if !hit_wall:
		position += direction * speed * delta

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
		var instantiated_node = trampoline_inst.instantiate()
		get_tree().current_scene.add_child(instantiated_node)
		instantiated_node.global_position = global_position
		queue_free()
