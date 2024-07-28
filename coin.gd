extends Area2D
signal coin




func _on_body_entered(body):
	if body == $"../character":
		coin.emit()
		queue_free()
