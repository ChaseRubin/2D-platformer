extends AnimationPlayer

var is_dead = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not is_dead:
		play("moving")
		

func dead():
	play("death")
	is_dead = true
	
	


func _on_green_death():
	dead()
