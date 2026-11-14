class_name bullet_manager extends Node

@onready var main = get_parent()
@onready var projectile = load("res://Scenes/projectile.tscn")

func _ready() -> void:
	pass
 
func shoot() -> void:
	var instance = projectile.instantiate()
	instance.setup(Global.bullet_dir.angle(), Global.player_pos, Global.bullet_dir.angle())
	main.add_child.call_deferred(instance)
