extends CharacterBody2D
var is_alive = true
var SPEED = 100
var chase_player = true
var in_range = false
var shot_cool_down = true
signal shoot(pos, direction)
var health = 70
var hit = false
@onready var anim = $AnimationPlayer

func _physics_process(delta):
	if globals.player_alive and is_alive:
		if is_alive and chase_player:
			SPEED = 40
			velocity = (globals.character - position).normalized()*SPEED * delta
			move_and_collide(velocity)
		else:
			SPEED = 0
		
		if in_range and shot_cool_down:
			attack()
			shot_cool_down = false
			
		if in_range:
			anim.play("attacking")
			
		
		else:
			anim.play("chillin")
			
			
func attack():
	$shot_cool_down.start()
	var direction: Vector2 = (globals.character - global_position).normalized()
	shoot.emit($".".position, direction)
	

func _on_shot_cool_down_timeout():
	shot_cool_down = true

func _process(_delta):
	var player_pos = globals.character
	var enemy_pos = $".".position
	var distance = (player_pos - enemy_pos).length()

	if distance < 280 and distance > 150:
		in_range = false
	elif distance < 150 and distance > 68:
		in_range = true
	
		
func _on_hit_box_area_entered(area):
	if globals.is_attacking:
		health -= 50
		hit_tween()

	
		
	if health <= 0 and is_alive:
		is_alive = false
		death()
		
func death():
	anim.play("dying")
	$dying.start()
	


func _on_dying_timeout():
	queue_free()


func _on_projectile_hit_box_area_entered(area):
	health -= 10
	hit_tween()
	
func hit_tween():
	var tween = get_tree().create_tween()
	tween.tween_property($".", "modulate:r",0,0 )
	tween.tween_property($".", "modulate:g",0,0 )
	tween.tween_property($".", "modulate:b",0,0 )
	tween.tween_property($".", "modulate:r",1,1 )
	tween.tween_property($".", "modulate:g",1,1 )
	tween.tween_property($".", "modulate:b",1,1 )
