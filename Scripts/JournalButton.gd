extends Area2D



func _on_JournalButton_mouse_entered():
	$Sprite.get_material().set_shader_param("opacity", 1)


func _on_JournalButton_mouse_exited():
	$Sprite.get_material().set_shader_param("opacity", 0)


func _on_EndButton_mouse_entered():
	$Sprite.get_material().set_shader_param("opacity", 1)


func _on_EndButton_mouse_exited():
	$Sprite.get_material().set_shader_param("opacity", 0)


func _on_MenuButton_mouse_entered():
	$MenuButton.get_material().set_shader_param("opacity", 1)


func _on_MenuButton_mouse_exited():
	$MenuButton.get_material().set_shader_param("opacity", 0)
