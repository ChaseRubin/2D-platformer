extends Node2D
@onready var anim = $AnimationPlayer



func _on_range_body_entered(body):
	anim.play("door_open")
