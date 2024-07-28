extends Node2D


signal mana_spawn

# Emit the signal when needed, for example, in _ready or another function
func _ready():
	emit_signal("mana_spawn")
