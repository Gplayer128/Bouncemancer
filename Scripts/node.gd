class_name bullet_manager extends Node

@onready var main = get_parent()
@onready var projectile = load("res://Scenes/projectile.tscn")
@onready var projectile2 = load("res://HighTrampoline.tscn")

func _ready() -> void:
	pass
 
func shoot1() -> void:
	var instance = projectile.instantiate()
	instance.setup(Global.bullet_dir.angle(), Global.player_pos, Global.bullet_dir.angle())
	main.add_child.call_deferred(instance)

func shoot2() -> void:
	var instance2 = projectile.instantiate()
	instance2.setup(Global.bullet_dir.angle(), Global.player_pos, Global.bullet_dir.angle())
	main.add_child.call_deferred(instance2)
