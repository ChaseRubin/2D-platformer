extends AnimationPlayer


func _process(_delta):
	if globals.bricks_logic:
		$".".play("toggle_vis")
	else:
		$".".play("invisible")
