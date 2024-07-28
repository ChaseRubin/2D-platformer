extends TileMap
signal wood
signal brick
signal steel
signal diamond
signal pebble
var ZERO:int = 0
var mat = 3
var mine_cool_down = true

func _process(_delta):
	
	if globals.block_breaking:
		break_block()
	
	$"../CanvasLayer".update_ui()
	if (Input.is_action_just_pressed("1")) and globals.wood > 0:
		mat = 3
		globals.wood_logic = true
		globals.bricks_logic = false
		globals.steel_logic = false
	if (Input.is_action_just_pressed("2")) and globals.bricks > 0:
		mat = 5
		globals.bricks_logic = true
		globals.steel_logic = false
		globals.wood_logic = false
	if (Input.is_action_just_pressed("3")) and globals.steel > 0:
		mat = 4
		globals.steel_logic = true
		globals.wood_logic = false
		globals.bricks_logic = false
	
	# Add a tile if the left mouse button is pressed according to its global position
	if (Input.is_action_just_pressed("second_attack")) and mat == 3 and globals.wood  > 0:
		var tile : Vector2 = local_to_map(get_global_mouse_position())
		var tile_id = get_cell_source_id(ZERO,tile,true)
		if tile_id == -1:
			set_cell(ZERO, tile, 3, Vector2i.ZERO)
			globals.wood -= 1
			wood.emit()
		
	if (Input.is_action_just_pressed("second_attack")) and mat == 4 and globals.steel > 0:
		var tile : Vector2 = local_to_map(get_global_mouse_position())
		var tile_id = get_cell_source_id(ZERO,tile,true)
		if tile_id == -1:
			set_cell(ZERO, tile, 4, Vector2i.ZERO)
			globals.steel -= 1
			brick.emit()
		
	if (Input.is_action_just_pressed("second_attack")) and mat == 5 and globals.bricks > 0:
		var tile : Vector2 = local_to_map(get_global_mouse_position())
		var tile_id = get_cell_source_id(ZERO,tile,true)
		if tile_id == -1:
			set_cell(ZERO, tile, 5, Vector2i.ZERO)
			globals.bricks -= 1
			steel.emit()
	# Remove a tile if the right mouse button is pressed according to its global position
	if (Input.is_action_pressed("main_attack")) and mine_cool_down and globals.tool == "pickaxe":
		
		var tile : Vector2 = local_to_map(get_global_mouse_position())
		mine_cool_down = false
		$cool_down.start()
		var tile_id = get_cell_source_id(ZERO,tile,true)
		

		if tile_id == 2:
			pass
		else:
			erase_cell(ZERO, tile)
			if tile_id == 6:
				mining_loot()
			if tile_id == 3:
				globals.wood += 1
			if tile_id == 4:
				globals.steel += 1
			if tile_id == 5:
				globals.bricks += 1
			
func mining_loot():
	var drop = randi() % 100 
	if drop < 10:
		diamond.emit()
		
	if drop < 4:
		pass
		
		
		
func _on_cool_down_timeout():
	mine_cool_down = true
	

	
func break_block():
	var tile = local_to_map(globals.collision_position)
	var tile_id = get_cell_source_id(ZERO,tile,true)
	if tile_id == 2:
		pass
	else:
		erase_cell(ZERO, tile)
		globals.block_breaking = false
