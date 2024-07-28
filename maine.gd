extends Node2D
signal player_death
signal respawn
var fireball_scene2: PackedScene = preload("res://fireball_2.tscn")
var green_ghost: PackedScene = preload("res://green.tscn")
var diamond: PackedScene = preload("res://loot_drop.tscn")
var purple_ball: PackedScene = preload("res://purple_ball.tscn")
@onready var player = $character


func _ready():
	$wave_period.start()

func _on_wave_period_timeout():
	globals.wave_bool = false
	globals.wave += 1
	$rest_period.start()
	print("s")

func _on_rest_period_timeout():
	globals.wave_bool = true
	$wave_period.start()
	enemies_update()
	
	
func enemies_update():
	globals.green_speed += 10
	
	
func _on_coin_2_coin():
	globals.coin_amount += 1
	$CanvasLayer.update_ui()
	

func _on_tile_map_brick():
	$CanvasLayer.update_ui()
	
func _on_tile_map_steel():
	$CanvasLayer.update_ui()

func _on_tile_map_wood():
	$CanvasLayer.update_ui()


func _on_character_fireball_2(pos, direction, power_):
	var fireball = fireball_scene2.instantiate() 
	fireball.position = pos
	fireball.rotation_degrees = rad_to_deg(direction.angle())
	fireball.direction = direction
	fireball.power = power_
	$projectiles.add_child(fireball)

func _on_projectile_enemy_shoot(pos, direction):
	var purple = purple_ball.instantiate() as Area2D
	purple.position = pos
	purple.direction = direction
	$projectiles.add_child(purple)
	
	
func _on_green_spawner_green_spawn(pos):
	var green_g = green_ghost.instantiate() as CharacterBody2D
	green_g.position = pos
	$enemies.add_child(green_g)
	


func _process(_delta): 
	if globals.health == 0 and globals.player_alive:
		player_death.emit()
		globals.player_alive = false
		var tween = get_tree().create_tween()
		tween.set_parallel(true)
		tween.tween_property(player, "modulate:r",0,1 )
		tween.tween_property(player, "modulate:g",0,1 )
		tween.tween_property(player, "modulate:b",0,1)
		$respawn.start()
		
		
func _on_respawn_timeout():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($".", "modulate:r",1,1 )
	tween.tween_property($".", "modulate:g",1,1 )
	tween.tween_property($".", "modulate:b",1,1)
	respawn.emit()
	globals.player_alive = true
	globals.health = 100
	
	
	$CanvasLayer.update_ui()
	


func _on_tile_map_diamond():
	var d = diamond.instantiate()
	d.position = get_global_mouse_position()
	$drops.add_child(d)
	




