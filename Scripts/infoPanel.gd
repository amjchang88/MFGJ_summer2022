extends UIPanel

var animalNode

func set_values(p_animalNode, p_animalName, p_nickname, p_weight, p_symptom, _p_affliction, p_gender, p_rarity, p_animation):
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
	
	# get reference to node clicked
	animalNode = p_animalNode
