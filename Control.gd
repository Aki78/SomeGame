extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var points = PoolVector2Array([])

# Called when the node enters the scene tree for the first time.
func _ready():
	points = PoolVector2Array([Vector2(10,20), Vector2(300,400)])	
	draw_colored_polygon(points, Color(1,0.5,1,1))

func _draw():
	points = PoolVector2Array([Vector2(10,20), Vector2(300,400)])
	print(points)
	draw_colored_polygon(points, Color(1,0.5,1,1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
