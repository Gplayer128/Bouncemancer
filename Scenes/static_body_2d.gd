extends StaticBody2D
@onready var label: Label = $Label
@onready var tome: Sprite2D = $Tome

func _ready() -> void:
	label.visible = false
	tome.visible = true



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.has_m2 = true
		label.visible = true
		tome.visible = false
