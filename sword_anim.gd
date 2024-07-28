extends AnimationPlayer
var already_rotated = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globals.tool != "sword":
		play("no_tool")
	if Input.is_action_pressed("e"):
		globals.tool = "sword"
		if globals.rotated:
			play("idle left")
			already_rotated = false
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
		
	if Input.is_action_pressed("main_attack") and  globals.rotated and globals.tool == "sword":
		play("swing_l")
