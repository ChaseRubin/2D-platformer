extends AnimationPlayer
var already_rotated = false


func _process(delta):
	if globals.tool != "pickaxe":
		play("no_tool")
	if Input.is_action_pressed("q"):
		globals.tool = "pickaxe"
		if globals.rotated:
			play("idle left")
			
		if not globals.rotated:
			play("idle_right")
			
	if Input.is_action_pressed("main_attack") and not globals.rotated and globals.tool == "pickaxe":
		play("swing_r")
		
	if Input.is_action_pressed("main_attack") and  globals.rotated and globals.tool == "pickaxe":
		play("swing_l")
		
	if globals.rotated and already_rotated and globals.tool == "pickaxe":
		play("idle left")
		already_rotated = false
		
	if not globals.rotated and not already_rotated and globals.tool == "pickaxe":
		play("idle_right")
		already_rotated = true
