class_name bullet_manager extends Node

@onready var main = get_parent()
@onready var projectile = load("res://Scenes/projectile.tscn")
@onready var projectile2 = load("res://Scenes/projectile_2.tscn")

var old_one = null
var old_one2 = null
var active_trampoline = null # Tracks the currently spawned trampoline

func shoot1() -> void:
	if old_one:
		old_one.queue_free()
	var instance = projectile.instantiate()
	old_one = instance
	instance.setup(Global.bullet_dir.angle(), Global.player_pos, Global.bullet_dir.angle())
	main.add_child.call_deferred(instance)

func shoot2() -> void:
	if old_one2:
		old_one2.queue_free() # Fixed: was calling old_one instead of old_one2
	var instance2 = projectile2.instantiate()
	old_one2 = instance2
	instance2.setup(Global.bullet_dir.angle(), Global.player_pos, Global.bullet_dir.angle())
	main.add_child.call_deferred(instance2)

# Call this from your projectile when the trampoline spawns
func register_trampoline(new_trampoline: Node) -> void:
	if active_trampoline and is_instance_valid(active_trampoline):
		active_trampoline.queue_free() # Destroy the old trampoline
	active_trampoline = new_trampoline
