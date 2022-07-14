extends AnimatedSprite

signal clicked

func _on_CatArea_mouse_entered():
	get_material().set_shader_param("opacity", 1)


func _on_CatArea_mouse_exited():
	get_material().set_shader_param("opacity", 0)


func _on_CatArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			emit_signal("clicked")
