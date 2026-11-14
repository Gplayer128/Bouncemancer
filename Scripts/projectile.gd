extends CharacterBody2D

@onready var vision: RayCast2D = $vision
@onready var vision_2: RayCast2D = $vision2

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

var type = 0

func _ready() -> void:
	type = Global.trampoline_shot_type
	

func _process(delta: float) -> void:
	if vision.is_colliding():
		velocity = Vector2.ZERO
		anim_sprite.play("hit")
	else:
		anim_sprite.play("fly")
	
	if vision_2.is_colliding():
		pass
