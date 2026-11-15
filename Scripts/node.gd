class_name bullet_manager extends Node

@onready var main = get_parent()
@onready var projectile = load("res://Scenes/projectile.tscn")
@onready var projectile2 = load("res://Scenes/projectile_2.tscn")

var old_one = null
var old_one2 = null

# Track each trampoline type separately
var active_trampoline_1 = null
var active_trampoline_2 = null

func shoot1() -> void:
	if old_one:
		old_one.queue_free()
	var instance = projectile.instantiate()
	old_one = instance
	instance.setup(Global.bullet_dir.angle(), Global.player_pos, Global.bullet_dir.angle())
	main.add_child.call_deferred(instance)

func shoot2() -> void:
	if old_one2:
		old_one2.queue_free() 
	var instance2 = projectile2.instantiate()
	old_one2 = instance2
	instance2.setup(Global.bullet_dir.angle(), Global.player_pos, Global.bullet_dir.angle())
	main.add_child.call_deferred(instance2)

# Register Trampoline Type 1
func register_trampoline_1(new_trampoline: Node) -> void:
	if active_trampoline_1 and is_instance_valid(active_trampoline_1):
		active_trampoline_1.queue_free()
	active_trampoline_1 = new_trampoline

# Register Trampoline Type 2
func register_trampoline_2(new_trampoline: Node) -> void:
	if active_trampoline_2 and is_instance_valid(active_trampoline_2):
		active_trampoline_2.queue_free()
	active_trampoline_2 = new_trampoline
