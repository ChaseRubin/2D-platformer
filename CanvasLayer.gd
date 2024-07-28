extends CanvasLayer
@onready var wood_label: Label = $"wood counter/VBoxContainer/Label"
@onready var brick_label: Label = $"brick counter/VBoxContainer/Label"
@onready var steel_label: Label = $"steel counter/VBoxContainer/Label"
@onready var coin_label: Label = $coin_counter/VBoxContainer/Label
@onready var health_bar = $health/TextureProgressBar
@onready var diamonds = $diamonds/VBoxContainer/Label
@onready var arrows = $arrows/VBoxContainer/Label
func update_ui():
	coin_label.text = str(globals.coin_amount)
	steel_label.text = str(globals.steel)
	wood_label.text = str(globals.wood)
	brick_label.text = str(globals.bricks)
	diamonds.text = str(globals.diamonds)
	health_bar.value = globals.health
	arrows.text = str(globals.arrow_count)



func _ready():

	update_ui()

func _process(_delta):
	pass
