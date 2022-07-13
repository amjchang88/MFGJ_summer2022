extends UIPanel

func _ready():
	$Animal.get_node("AnimatedSprite").animation = "dogShadow"
