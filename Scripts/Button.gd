extends Sprite

signal clicked



func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			emit_signal("clicked")


func _on_Area2D_mouse_entered():
	self.get_material().set_shader_param("opacity", 1)


func _on_Area2D_mouse_exited():
	self.get_material().set_shader_param("opacity", 0)
