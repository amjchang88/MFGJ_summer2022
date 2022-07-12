extends Sprite

var targetX := position.x
var targetY := position.y
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
	
func _ready():
	#move_to(2,2)
	$AnimatedSprite.animation = "dog3"
