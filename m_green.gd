extends CharacterBody2D

var mana: PackedScene = preload("res://mana.tscn")
var looking_left = false
signal death
signal mana_spawn
var is_alive = true
var type = ""

func _process(delta):
	if globals.player_alive:
		if is_alive:
			velocity = (globals.character - position).normalized()* globals.green_speed * delta
			move_and_collide(velocity)
		
		if velocity.x > 0 and not looking_left and is_alive:
			scale.x = -.5
			looking_left = true
		if velocity.x <= 0 and  looking_left and is_alive:
			scale.x = -.5
			looking_left = false
			
		
	else: 
		queue_free()
		
	

func _on_area_2d_area_entered(area):
	if globals.is_attacking:
		death_action()


func _on_death_timeout():
	queue_free()


	
func death_action():
	is_alive = false
	$death.start()
	death.emit()
	

func _on_projectile_area_entered(area):
	death_action()


func _on_kamakazi_body_entered(body):
	if is_alive:
		globals.health -= 10
	death_action()
