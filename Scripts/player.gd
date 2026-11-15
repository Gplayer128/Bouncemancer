
extends CharacterBody2D

@onready var anim_sprite: AnimatedSprite2D = $anim_sprite
@onready var player: Marker2D = $player
@onready var bullet_manager_var = get_parent().get_child(0) as bullet_manager

var dir_start: Vector2

var speed_multiplier: float = 1.0
var limit_set: bool
var has_bounced: bool = false
var was_airborne: bool = false

const SPEED = 500.0
const JUMP_VELOCITY = -400.0


func _ready() -> void:
	limit_set = false
	bullet_manager_var = get_tree().get_root().get_node("/root/BulletManager")


func _process(delta: float) -> void:
	dir_start = player.global_position

	if Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()

	Global.player_pos = player.global_position
	Global.bullet_dir = get_global_mouse_position() - dir_start


func _physics_process(delta: float) -> void:

	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		was_airborne = true

	# Reset multiplier after landing from trampoline
	if is_on_floor() and was_airborne and has_bounced:
		speed_multiplier = 1.0
		has_bounced = false
		was_airborne = false

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")

	# Movement
	if direction:
		velocity.x = direction * SPEED * speed_multiplier

		if not is_on_floor():
			anim_sprite.play("jump")
		else:
			anim_sprite.play("walk")

		anim_sprite.flip_h = direction < 0

	else:
		if not is_on_floor():
			anim_sprite.play("fall")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			anim_sprite.play("idle")

	move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("1"):
		Global.player_pos = player.global_position
		Global.bullet_dir = get_global_mouse_position() - player.global_position
		bullet_manager_var.shoot1()

	elif event.is_action_pressed("2"):
		Global.player_pos = player.global_position
		Global.bullet_dir = get_global_mouse_position() - player.global_position
		bullet_manager_var.shoot2()
