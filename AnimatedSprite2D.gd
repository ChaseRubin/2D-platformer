extends AnimatedSprite2D
var rotated: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("right") and rotated:
		rotation_degrees -= 180
		rotated = false
	if Input.is_action_pressed("left") and not rotated:
		rotation_degrees += 180
		rotated = true
	if Input.is_action_pressed("main_attack"):
		pass
		
