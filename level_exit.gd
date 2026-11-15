extends Area2D
@export var next_scene: String


func _on_body_entered(body):
	print("smt_entered")
	if body.is_in_group("player"):
		print("teste")
		get_tree().change_scene_to_file(next_scene)
		print("teste")
