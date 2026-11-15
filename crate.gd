extends RigidBody2D

@export var bounce_force: float = 750.0

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		audio_stream_player_2d.play()
		body.velocity.y = -bounce_force
		print("Bounce force: ", bounce_force)
		print("Player velocity: ", body.velocity)
