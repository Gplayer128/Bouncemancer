extends RigidBody2D


@export var gravity_strength := 600.0

func _ready():
	gravity_scale = 0

func _physics_process(delta):
	linear_velocity += Global.gravity_dir * gravity_strength * delta
