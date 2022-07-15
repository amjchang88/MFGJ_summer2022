extends UIPanel

onready var infoPanel = get_tree().get_root().get_node("Main").get_node("AnimalPanel")

func _ready():
	pass


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	# clicked back button
	if event is InputEventMouseButton:
		if event.pressed:
			move_to(defaultX, defaultY)
