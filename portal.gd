extends Node2D



func _on_area_2d_area_entered(area):
	print("s")
	$"../character".position = Vector2(33, 481)
