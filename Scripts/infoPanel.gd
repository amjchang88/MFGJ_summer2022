extends UIPanel

var animalNode
onready var global = get_node("/root/Global")
signal select_treatment_mode

var array
var max_size

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
		
	$ForwardButton.paused = false
	$BackButton.paused = false
	
	array = animalNode.get_parent()
	max_size = array.animalArray.size()

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


func _on_Main_reset_info():
	$Name.bbcode_text = ""
	$SpeciesText.text = ""
	$WeightText.text = ""
	$StatusText.text = ""
	
	$GenderIcon.visible = false
	$Shadow.visible = false
	$AnimatedSprite.visible = false
	$StarSheet.visible = false
	$TreatIcon.visible = false
	
	$ForwardButton.paused = true
	$BackButton.paused = true


func _on_ForwardButton_clicked():
	
	if animalNode:
		#print(animalNode)
		#print(max_size)
		if animalNode.arrayPos == max_size - 1:
			array.animalArray[0].send_values()
		elif (animalNode.arrayPos+1) < max_size:
			array.animalArray[animalNode.arrayPos + 1].send_values()


func _on_BackButton_clicked():
	if animalNode.arrayPos == 0:
		array.animalArray[max_size-1].send_values()
	elif animalNode.arrayPos > 0:
		array.animalArray[animalNode.arrayPos - 1].send_values()
