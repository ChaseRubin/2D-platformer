extends Node2D
signal green_spawn(pos)
var on = true
func _ready():
	$Timer.start()



func _on_timer_timeout():
	if on and globals.player_alive and globals.wave_bool:
		green_spawn.emit($spawn.global_position)
		$Timer.start()

	
	
	
