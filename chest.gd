extends Area2D



func _on_body_entered(body):
	if body == $"../character":
		$AnimationPlayer.play("open")



func _on_body_exited(body):
	if body == $"../character":
		$AnimationPlayer.play("close")
