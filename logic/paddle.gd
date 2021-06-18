extends Area2D

const MOVE_SPEED = 100

var _ball_dir
var _up
var _down
var _left
var _right
var currentMinimum = 100000000
var previous_position = global_position
var allPoints = []

onready var _screen_size_y = get_viewport_rect().size.y
onready var _screen_size_x = get_viewport_rect().size.x

func _ready():
 pass
func is_moving():
	if global_position != previous_position:
		currentMinimum = 100000000
	else:
		pass
	previous_position = global_position
	
func get_closest(points, aPoint):
	for i in points:
		if currentMinimum > (i - aPoint).dot(i - aPoint):
			print("Hit")
			currentMinimum = (i - aPoint).dot(i - aPoint)
		else:
			pass

func _process(delta):
	allPoints = get_node("/root/Pong/Node2D").points_drawn
	is_moving()

	print(currentMinimum)
	# Move up and down based on input.
	var inputY = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var inputX = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	position.y = clamp(position.y + inputY * MOVE_SPEED * delta, 16, _screen_size_y - 16)
	position.x = clamp(position.x + inputX * MOVE_SPEED * delta, 16, _screen_size_x - 16)
	get_closest(allPoints, Vector2(position.x,position.y))
	$Label.text = "Soldier power\n" + str(100/sqrt(currentMinimum))
