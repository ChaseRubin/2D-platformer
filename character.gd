extends CharacterBody2D
signal fireball2(pos, direction)
const SPEED = 150.0
const JUMP_VELOCITY = -250
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var time_logic: bool = true

@onready var anim = $AnimatedSprite2D



func _physics_process(delta):
	if globals.player_alive:
		if not is_on_floor():
			velocity.y += gravity * delta

		
		# Handle jump.
		if Input.is_action_just_pressed("space") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("left", "right")
		if direction:
			
			if globals.is_mining and is_on_floor():
				velocity.x = direction * SPEED * .9
			elif globals.is_attacking and is_on_floor():
				velocity.x = direction * SPEED * .6
			else:
				velocity.x = direction * SPEED

		
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
	

func _process(_delta):
	
	if globals.player_alive and not globals.is_attacking:
	
		if $".".position.y > 1008:
			globals.is_above_ground = false
		
		if $".".position.y < 1008:
			globals.is_above_ground = true

			
	var mouse_pos = get_global_mouse_position().x
	var player_pos = $".".position.x

	if mouse_pos > player_pos:
		globals.rotated = false
		anim.flip_h = true
		
	if mouse_pos < player_pos:
		globals.rotated = true
		anim.flip_h = false
		

	globals.character = $".".position

func _on_cool_down_timeout():
	time_logic = true
	


func _on_is_attacking_timeout():
	globals.is_attacking = false





func _on_area_2d_area_entered(area):
	globals.health -= 10
	$"../CanvasLayer".update_ui()
	

func _on_main_player_death():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($".", "modulate:r",0,1 )
	tween.tween_property($".", "modulate:g",0,1 )
	tween.tween_property($".", "modulate:b",0,1 )
	
	
	


func _on_respawn_timeout():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($".", "modulate:r",1,1 )
	tween.tween_property($".", "modulate:g",1,1 )
	tween.tween_property($".", "modulate:b",1,1 )
	$".".position = Vector2(307,480)


func _on_is_mining_timeout():
	globals.is_mining = false
	
	



func _on_animation_player_arrow(power):
	var power_ = power
	var spawn = $"arm_control/arm/bow/arrow spawn point"
	var player_direction = (get_global_mouse_position() - position ).normalized()
	time_logic = false
	$cool_down.start()
	fireball2.emit(spawn.global_position, player_direction, power_)
