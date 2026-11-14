extends Area2D
@export var next_scene: String


func _on_body_entered(body):
	if body.is_in_group("player"):
		print("teste1")
		get_tree().change_scene_to_file(next_scene)
		print("teste")
