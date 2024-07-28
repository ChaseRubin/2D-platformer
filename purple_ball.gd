extends Area2D
var direction: Vector2 = Vector2.UP 
var SPEED = 150

func _process(delta):
	position += direction * SPEED * delta

func _ready():
	$life_span.start()
	


func _on_life_span_timeout():
	queue_free()



func _on_body_entered(body):
	globals.block_breaking = true
	globals.collision_position = $".".position
	queue_free()

