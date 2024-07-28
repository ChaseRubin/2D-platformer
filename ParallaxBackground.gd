extends ParallaxBackground


func _process(_delta):
	if globals.player_alive == false:
		var tween = get_tree().create_tween()
		tween.set_parallel(true)
		tween.tween_property($ParallaxLayer, "modulate:r",0,1 )
		tween.tween_property($ParallaxLayer, "modulate:g",0,1 )
		tween.tween_property($ParallaxLayer, "modulate:b",0,1)
		



func _on_main_respawn():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($ParallaxLayer, "modulate:r",1,1 )
	tween.tween_property($ParallaxLayer, "modulate:g",1,1 )
	tween.tween_property($ParallaxLayer, "modulate:b",1,1)
