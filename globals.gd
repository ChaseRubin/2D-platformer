extends Node
signal health_change


#game logic
var wave = 1
var wave_bool = true


#ui
var coin_amount = 0
var health = 100
var wood = 10
var steel = 10
var bricks = 10
var diamonds = 0
var xp = 0

#player orientation
var rotated = true
var tool = "nothing"
var is_attacking = false
var is_mining = false
var is_above_ground
var arrow_count = 100

#player pos and status
var character = Vector2()
var player_alive = true

#material selection
var wood_logic = true
var bricks_logic
var steel_logic

#map logic
var collision_position
var block_breaking = false

#enemies
var green_speed = 80
