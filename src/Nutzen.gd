extends KinematicBody2D

var velocity: Vector2 = Vector2 (750, 750)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
	$Foto.rotation_degrees += 3
		

func _on_Area2D_input_event(viewport, event, shape_idx):
	owner.activate_effect()
