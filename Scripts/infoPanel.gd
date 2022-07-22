extends UIPanel

var animalNode
onready var global = get_node("/root/Global")
signal select_treatment_mode

func set_values(p_animalNode, p_animalName, p_nickname, p_weight, p_symptom, _p_affliction, p_gender, p_rarity, p_animation, p_recovered):
	# set data
	$Name.bbcode_text = "[center]" + p_nickname + "[/center]"
	$SpeciesText.text = p_animalName
	$WeightText.text = str("%.1f" % p_weight) + " lbs"
	$StatusText.text = p_symptom
	$GenderIcon.frame = p_gender
	$StarSheet.frame = p_rarity
	$AnimatedSprite.animation = p_animation
	
	# set visible
	$GenderIcon.visible = true
	$Shadow.visible = true
	$AnimatedSprite.visible = true
	$StarSheet.visible = true
	
	$TreatIcon.visible = true
	$TreatIcon.frame = 0
	if p_recovered:
		$TreatIcon.visible = false
	# get reference to node clicked
	animalNode = p_animalNode		
	$TreatIcon/AnimatedSprite2.visible = false
	if animalNode and animalNode.treatment:
		$TreatIcon/AnimatedSprite2.animation = animalNode.treatment.to_lower()
		$TreatIcon/AnimatedSprite2.visible = true
		$TreatIcon.frame = 1
		

func _on_Area2D_input_event(_viewport, event, _shape_idx):

	if event is InputEventMouseButton and event.pressed:
			emit_signal("select_treatment_mode")


func _on_Area2D_mouse_entered():
	$TreatIcon.get_material().set_shader_param("opacity", 1)


func _on_Area2D_mouse_exited():
	$TreatIcon.get_material().set_shader_param("opacity", 0)


func _on_Main_to_treatment(p_treatment):
	$TreatIcon.frame = 1
	$TreatIcon/AnimatedSprite2.animation = p_treatment.to_lower()
	$TreatIcon/AnimatedSprite2.visible = true
	
	animalNode.treatment = p_treatment
