extends AnimationPlayer


#


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $"..".velocity.x != 0:
		play("wlking")
	
