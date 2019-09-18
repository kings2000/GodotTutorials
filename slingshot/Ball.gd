extends RigidBody2D

var pressed = -1 #ball not pressed
var boundary = 100;
onready var center_pos = $"../Sling/Center".global_position
onready var main = $".."
var force = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if pressed == 1:
		set_global_position(event.position)
		
		var dis_to_center = global_position - center_pos
		if dis_to_center.length() > boundary:
			set_global_position(dis_to_center.normalized() * boundary + center_pos)
		
		on_drag()
	if event is InputEventMouseButton && !event.is_pressed():
		pressed = -1
		shoot()


func _on_Ball_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed():
		pressed = 1
	
func on_drag():
	main.set_line_point(global_position)

func shoot():
	main.reset_line_to_origin()
	var dis = center_pos - global_position
	var impulse = dis.normalized() * dis.length() * force
	mode = RigidBody2D.MODE_RIGID
	apply_impulse(dis, impulse)








