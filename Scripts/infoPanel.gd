extends UIPanel
	
func set_values(p_animalName, p_nickname, p_weight, p_symptom, p_affliction, p_gender, p_rarity, p_animation):
	$Name.bbcode_text = "[center]" + p_nickname + "[/center]"
	$SpeciesText.text = p_animalName
	$WeightText.text = str("%.1f" % p_weight) + " lbs"
	$StatusText.text = p_symptom
	$AfflictionText.text = p_affliction
	$GenderIcon.frame = p_gender
	$StarSheet.frame = p_rarity
	$AnimatedSprite.animation = p_animation
