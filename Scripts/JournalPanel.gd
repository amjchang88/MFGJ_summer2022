extends UIPanel

onready var animalPanel = get_tree().get_root().get_node("Main").get_node("AnimalPanel")

signal returned 
var paused := false

func _ready():
	pass


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	# clicked back button
	if event is InputEventMouseButton:
		if event.pressed and !paused:
			move_to(defaultX, defaultY)
			emit_signal("returned")

func _on_AnimalPanel_returned():
	paused = false
	
func _on_Cat_clicked():
	if !paused:
		animalPanel.move_to(112, 2)
		paused = true



