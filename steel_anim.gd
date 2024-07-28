extends AnimationPlayer




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if globals.steel_logic:
		$".".play("toggle_vis")
	else:
		$".".play("invisible")
