extends CharacterBody2D

@onready var anim_sprite: AnimatedSprite2D = $anim_sprite

const SPEED = 500.0
const JUMP_VELOCITY = -600.0

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

func trow_portal(num):
	if num == 1:
		pass
	if num == 2:
		pass
	if num == 3:
		pass

func shoot():
	var instance = projectile.instantiate()
	get_parent().add_child(instance)
