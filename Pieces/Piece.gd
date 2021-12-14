extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2(0,0)
var default_modulate = Color(1,1,1,1)
var highlight = Color(1,0.8,0,1)

var dying = false

func _ready():
	default_modulate = modulate

func _physics_process(_delta):
	if dying:
		queue_free()
	if selected:
		$Selected.emitting = true
		$Selected.show()
		z_index = 10
	else:
		$Selected.emitting = false
		$Selected.hide()
		z_index = 1
		

func move_piece(change):
	target_position = position + change
	position = target_position

func die():
	dying = true;
