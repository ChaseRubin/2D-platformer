extends Area2D
	
@export var speed: int = 250

var direction: Vector2 = Vector2.UP


func _process(delta):
	position += direction * speed * delta
	
func _ready():
	$life_span.start()



func _on_body_entered(_body):
	queue_free()


func _on_life_span_timeout():
	queue_free()
	print("t")
