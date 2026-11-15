
extends RigidBody2D

@onready var timer: Timer = $Timer

@export var bounce_force: float = 650.0
@export var horizontal_multiplier: float = 1.25

var can_bounce: bool = true


func _on_timer_timeout() -> void:
	can_bounce = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and can_bounce:
		can_bounce = false
		timer.start()

		body.velocity.y = -bounce_force
		body.speed_multiplier = horizontal_multiplier
		body.has_bounced = true
