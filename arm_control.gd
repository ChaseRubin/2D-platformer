extends Sprite2D


func _process(_delta):
	if globals.player_alive:
		look_at(get_global_mouse_position())
	
	
	

	
