extends UIPanel
	
func set_values(p_animalName, p_nickname, p_weight, p_symptom, p_affliction, p_gender, p_rarity):
	$Name.bbcode_text = "[center]" + p_nickname + "[/center]"
	$SpeciesText.text = p_animalName
	$WeightText.text = str(p_weight)
	$StatusText.text = p_symptom
	$AfflictionText.text = p_affliction
	$GenderIcon.frame = p_gender
	$StarSheet.frame = p_rarity
