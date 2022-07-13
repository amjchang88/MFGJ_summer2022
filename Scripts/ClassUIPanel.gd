extends Sprite

# Panel class

class_name UIPanel

var targetX := -118
var targetY := 2
export var movespeed := 4

func move_to(p_x, p_y):
	targetX = p_x
	targetY = p_y
	
func _process(_delta):
	if position.x < targetX:
		position.x += movespeed
	if position.y < targetY:
		position.y += movespeed
		
	if position.x > targetX:
		position.x -= movespeed
	if position.y > targetY:
		position.y -= movespeed

