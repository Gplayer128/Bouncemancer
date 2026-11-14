extends RigidBody2D


@export var gravity_strength := 600.0

func _ready():
	gravity_scale = 0

var bounce_force = 33


func _on_area_2d_body_entered(body: Node2D) -> void:
	var bounce_velocity = Vector3(0, bounce_force, 0)
	body.velocity = body.velocity + bounce_velocity
