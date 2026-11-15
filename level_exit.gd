extends Area2D
@export var next_scene: String

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var player: CharacterBody2D = $"../player"

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file(next_scene)
