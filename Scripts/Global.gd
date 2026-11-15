extends Node

var trampoline_shot_type
var bullet_dir
var has_m2 = false
var trampoline_unlocked = 1
var player_pos

var death_scene = preload("res://Scenes/death_player.tscn")

func death_play():
	var instance = death_scene.instantiate()
	add_child(instance)
	instance.play()
