extends Node2D

func _ready():
	get_tree().paused = true

func clear_visibility():
	$List/About.visible = false
	$List/Tutorial.visible = false

# Button 1: play button
func _on_Area2D_mouse_entered():
	$List/PlayButton.get_material().set_shader_param("opacity", 1)
func _on_Area2D_mouse_exited():
	$List/PlayButton.get_material().set_shader_param("opacity", 0)
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if !$AnimatedSprite.playing:
			$AnimatedSprite.play()
			$AnimatedSprite.visible = true

# Button 2: about button
func _on_Button2_mouse_entered():
	$List/AboutButton.get_material().set_shader_param("opacity", 1)
func _on_Button2_mouse_exited():
	$List/AboutButton.get_material().set_shader_param("opacity", 0)
func _on_Button2_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		clear_visibility()
		$List/About.visible = true
	
# Button 3: tutorial button
func _on_Button3_mouse_entered():
	$List/TutorialButton.get_material().set_shader_param("opacity", 1)
func _on_Button3_mouse_exited():
	$List/TutorialButton.get_material().set_shader_param("opacity", 0)
func _on_Button3_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		clear_visibility()
		$List/Tutorial.visible = true
	
# Button 4: exit button
func _on_Button4_mouse_entered():
	$List/ExitButton.get_material().set_shader_param("opacity", 1)
func _on_Button4_mouse_exited():
	$List/ExitButton.get_material().set_shader_param("opacity", 0)
func _on_Button4_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_tree().quit()


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "start":
		clear_visibility()
		get_tree().paused = false
		get_parent().toMenu = false
		get_parent().paused = false
		
		$AnimatedSprite.animation = "end"
		$AnimatedSprite.play()
		
		$List.visible = false
		return

	if $AnimatedSprite.animation == "end":
		self.visible = false
		$List.visible = true
		$AnimatedSprite.visible = false
		$AnimatedSprite.animation = "start"
		$AnimatedSprite.stop()


func _on_5_mouse_entered():
	$List/SpeedrunButton.get_material().set_shader_param("opacity", 1)
func _on_5_mouse_exited():
	$List/SpeedrunButton.get_material().set_shader_param("opacity", 0)
func _on_5_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_parent().get_node("SpeedrunTimer").run()
