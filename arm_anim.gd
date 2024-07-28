extends AnimationPlayer
var already_rotated = false
var shooting = false
signal arrow
var power = 0
func _process(delta):
	if globals.player_alive:
		if Input.is_action_pressed("z"):
			globals.tool = "bow"
		if globals.tool == "nothing":
			play("no_tool")
		if Input.is_action_pressed("e") and not shooting:
			globals.tool = "sword"
			if globals.rotated:
				play("idle left")
				
			if not globals.rotated:
				play("idle_right")
				
		if globals.rotated and already_rotated and globals.tool == "sword":
			play("idle left")
			already_rotated = false
			
		if not globals.rotated and not already_rotated and globals.tool == "sword":
			play("idle_right")
			already_rotated = true

		if Input.is_action_pressed("main_attack") and not globals.rotated and globals.tool == "sword":
			play("swing_r")
			globals.is_attacking = true
			$"../../../is_attacking".start()
			
		if Input.is_action_pressed("main_attack") and  globals.rotated and globals.tool == "sword":
			play("swing_l")
			globals.is_attacking = true
			$"../../../is_attacking".start()
			
		if Input.is_action_pressed("q") and not shooting:
			globals.tool = "pickaxe"
			
			if globals.rotated:
				play("pic_left")
				
			if not globals.rotated:
				play("pic_right")

		if globals.rotated and already_rotated and globals.tool == "pickaxe":
			play("pic_left")
			already_rotated = false
			
		if not globals.rotated and not already_rotated and globals.tool == "pickaxe":
			play("pic_right")
			already_rotated = true

		if Input.is_action_pressed("main_attack") and not globals.rotated and globals.tool == "pickaxe":
			play("mine_left")
			globals.is_mining = true
			$"../../../is_mining".start()
		if Input.is_action_pressed("main_attack") and  globals.rotated and globals.tool == "pickaxe":
			play("mine_right")
			globals.is_mining = true
			$"../../../is_mining".start()

		if globals.tool == "bow":
			if globals.arrow_count > 0:
				
			
				if Input.is_action_pressed("main_attack") and not shooting:
					play("bow")
					shooting = true
				if Input.is_action_pressed("main_attack"):
					power = power + delta
					
				if not Input.is_action_pressed("main_attack") and shooting:
					play("release")
					shooting = false
					arrow.emit(power)
					power = 0
					globals.arrow_count -= 1
				elif not Input.is_action_pressed("main_attack"):
					play("release")
					
			else:
				play("release")
