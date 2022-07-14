extends UIPanel


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	# clicked back button
	if event is InputEventMouseButton:
		if event.pressed:
			move_to(defaultX, defaultY)
