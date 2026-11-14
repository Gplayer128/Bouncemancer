extends CharacterBody2D

@onready var anim_sprite: AnimatedSprite2D = $anim_sprite
@onready var player: Marker2D = $player

const SPEED = 500.0
const JUMP_VELOCITY = -400.0

@export var projectile : PackedScene

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")

	if direction:
		velocity.x = direction * SPEED
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

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("1"):
		shoot(1)
	if event.is_action_pressed("2"):
		shoot(2)
	if event.is_action_pressed("3"):
		shoot(3)

func shoot(num):
	var instance = projectile.instantiate()
	var bullet_direction = player.global_position - get_global_mouse_position()
	instance.position = Vector2.(10.0, 0)
	add_child(instance)
	#Global.bullet_dir = bullet_direction * SPEED
	#Global.trampoline_shot_type = num
