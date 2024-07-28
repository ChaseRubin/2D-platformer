extends TileMap
var ZERO:int = 0
func _process(delta):
	# Add a tile if the left mouse button is pressed according to its global position
	if (Input.is_action_just_pressed("second_attack")):
		var tile : Vector2 = local_to_map(get_global_mouse_position())
		set_cell(ZERO, tile, 0, Vector2i.ZERO)
