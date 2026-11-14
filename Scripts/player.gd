extends CharacterBody2D

@onready var anim_sprite: AnimatedSprite2D = $anim_sprite
@onready var player: Marker2D = $player

var speed_multiplier: float = 1.0

const SPEED = 500.0
const JUMP_VELOCITY = -400.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")

	if direction:
		velocity.x = direction * SPEED * speed_multiplier
		if !is_on_floor():
			anim_sprite.play("jump")
		else:
			anim_sprite.play("walk")
		anim_sprite.flip_h = direction < 0
	else:
		if !is_on_floor():
			anim_sprite.play("fall")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			anim_sprite.play("idle")

	move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("1"):
		Global.player_pos = position + Vector2(0.0, 5.0)
		Global.bullet_dir = dir_start - get_global_mouse_position()
		bullet_manager_var.shoot()
