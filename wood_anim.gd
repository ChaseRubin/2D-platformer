extends AnimationPlayer


func _process(_delta):
	if globals.wood_logic:
		$".".play("toggle_vis")
	else:
		$".".play("invisible")
