extends Node2D

func _ready():
	get_tree().paused = true

func clear_visibility():
	$About.visible = false
	$Tutorial.visible = false

# Button 1: play button
func _on_Area2D_mouse_entered():
	$PlayButton.get_material().set_shader_param("opacity", 1)
func _on_Area2D_mouse_exited():
	$PlayButton.get_material().set_shader_param("opacity", 0)
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		clear_visibility()
		get_tree().paused = false
		self.visible = false
		get_parent().toMenu = false
		get_parent().paused = false

# Button 2: about button
func _on_Button2_mouse_entered():
	$AboutButton.get_material().set_shader_param("opacity", 1)
func _on_Button2_mouse_exited():
	$AboutButton.get_material().set_shader_param("opacity", 0)
func _on_Button2_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		clear_visibility()
		$About.visible = true
	
# Button 3: tutorial button
func _on_Button3_mouse_entered():
	$TutorialButton.get_material().set_shader_param("opacity", 1)
func _on_Button3_mouse_exited():
	$TutorialButton.get_material().set_shader_param("opacity", 0)
func _on_Button3_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		clear_visibility()
	
# Button 4: exit button
func _on_Button4_mouse_entered():
	$ExitButton.get_material().set_shader_param("opacity", 1)
func _on_Button4_mouse_exited():
	$ExitButton.get_material().set_shader_param("opacity", 0)
func _on_Button4_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_tree().quit()
