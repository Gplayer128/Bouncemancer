
extends RigidBody2D

@export var bounce_force: float = 1000.0
@export var horizontal_multiplier: float = 0.75


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y = -bounce_force
		body.speed_multiplier = horizontal_multiplier
		body.has_bounced = true
