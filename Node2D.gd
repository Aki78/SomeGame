extends Node2D


const CENTER = Vector2(400,300)

const COLOR = Color(0,0,0,1)

var points_drawn=[]


func _process(delta):
	if Input.is_mouse_button_pressed(1):
		points_drawn.append(get_global_mouse_position())
		update()

func _draw():
	for point in points_drawn:
		draw_circle(point, 3, COLOR)
