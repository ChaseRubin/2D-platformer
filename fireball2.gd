extends RigidBody2D

var direction: Vector2 = Vector2.UP
var power = 0


func _ready():
	if power > 1:
		power = 1
	linear_velocity = direction * power * 500
	
	

func _physics_process(delta):
	if linear_velocity.length() > 0:
		rotation = linear_velocity.angle()



func _on_collision_shape_2d_body_entered(body):
	
	linear_velocity = Vector2(0,0)
	$".".gravity_scale = 0 
	$life_span2.start()
	


func _on_life_span_2_timeout():
	queue_free()
