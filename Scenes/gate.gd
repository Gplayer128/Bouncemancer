extends StaticBody2D

var has_key = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("keydetect")
	if body.is_in_group("player"):
		print("keygiven")
		has_key = true


func _on_area_2d_body_entered_door(body: Node2D) -> void:
	print("doordetect")
	if body.is_in_group("player") and has_key:
		print("dooropening")
		queue_free()
	
	
