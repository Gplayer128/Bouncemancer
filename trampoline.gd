extends RigidBody2D

@export var gravity_strength := 600.0


var bounce_force = 33


func _on_body_entered(body):
	var bounce_velocity = Vector3(0, bounce_force, 0)
	body.velocity = body.velocity + bounce_velocity 
	
