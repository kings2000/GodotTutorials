extends Node2D

onready var b_line = $"Sling/SBack/Point/line"
onready var f_line = $"Sling/SFront/Point/line"

onready var b_line_point = $"Sling/SBack/Point".global_position
onready var f_line_point = $"Sling/SFront/Point".global_position

onready var center_pos = $Sling/Center.global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_line_to_origin()

func set_line_point(pos : Vector2):
	var point1 = pos - b_line_point
	var point2 = pos - f_line_point
	b_line.set_point_position(1 , point1)
	f_line.set_point_position(1 , point2)
	pass

func reset_line_to_origin():
	set_line_point(center_pos)
	pass