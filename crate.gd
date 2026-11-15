
extends RigidBody2D

@export var bounce_force: float = 700.0
@export var horizontal_multiplier: float = 1.5

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		audio_stream_player_2d.play()
		body.velocity.y = -bounce_force
		body.speed_multiplier = horizontal_multiplier
		body.has_bounced = true
