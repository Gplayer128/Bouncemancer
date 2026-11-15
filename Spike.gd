extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../AudioStreamPlayer2D"

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Global.death_play()
		get_tree().reload_current_scene()
	
