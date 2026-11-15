extends Area2D

@export var speed: float = 500.0

var trampoline_inst = preload("res://HighTrampoline.tscn")

var num
var hit_wall : bool 
var second_anim : bool

@onready var anim_player : AnimatedSprite2D = $AnimatedSprite2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var dir : float
var spawnPos : Vector2
var spawnRot : float

func _ready() -> void:
	num = 0
	second_anim = false
	hit_wall = false
	global_position = spawnPos
	global_rotation = spawnRot 

func _physics_process(delta: float) -> void:
	if !audio_stream_player_2d.playing:
		audio_stream_player_2d.play()
	
	if !hit_wall:
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
		var instantiated_node = trampoline_inst.instantiate()
		get_tree().current_scene.add_child(instantiated_node)
		instantiated_node.global_position = global_position
		
		# Register with slot 1
		var manager = get_tree().get_root().get_node("/root/BulletManager") # Or your group lookup
		if manager and manager.has_method("register_trampoline_2"):
			manager.register_trampoline_2(instantiated_node)
			
		queue_free()
