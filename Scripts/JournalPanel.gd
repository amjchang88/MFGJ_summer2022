extends UIPanel

func _ready():
	pass





func _on_CatArea_mouse_entered():
	$AnimalList/Cat.get_material().set_shader_param("opacity", 1)
