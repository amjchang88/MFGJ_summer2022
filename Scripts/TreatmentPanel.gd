extends UIPanel

signal returned



func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			move_to(defaultX, defaultY)
			emit_signal("returned")
