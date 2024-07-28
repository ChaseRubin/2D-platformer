extends CharacterBody2D
var SPEED = 80
var player_chase = true
@onready var player =  $"../character"
signal break_block
var looking_left = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globals.is_above_ground:
		if player_chase:
			velocity = (player.get_global_position() - position).normalized()*SPEED * delta
		else:
			velocity = lerp(velocity,Vector2.ZERO,.07)
			
		move_and_collide(velocity)		


	
		
	if velocity.x > 0 and not looking_left:
		scale.x = -1
		looking_left = true
	if velocity.x <= 0 and  looking_left:
		scale.x = -1
		looking_left = false
		
func _on_area_2d_area_entered(_area):
	if globals.is_attacking:
		queue_free()


func _on_break_block_body_entered(_body):
	break_block.emit()
	$break_block2.start()




func _on_break_block_2_timeout():
	break_block.emit()


