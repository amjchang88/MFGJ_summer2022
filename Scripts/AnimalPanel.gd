extends UIPanel

signal returned 

var nameList = [" ", "", " ", " ", " ", " ", " ", " "]
var children 

func _ready():
	children = $AnimalList.get_children()
	
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	# clicked back button
	if event is InputEventMouseButton:
		if event.pressed:
			move_to(defaultX, defaultY)
			emit_signal("returned")

func initialize(p_name, p_variationList, p_nameList, p_rarity):
	$JournalTitle.bbcode_text = "[center]" + p_name + "[/center]"
	$StarSheet.frame = p_rarity
	for i in 8:
		if p_variationList[i]:
			children[i].animation = p_name.to_lower() + str(i)
		else:
			children[i].animation = p_name.to_lower() + "Shadow"
	


func _on_1_clicked():
	$NameText.text = nameList[0]


func _on_2_clicked():
	$NameText.text = nameList[1]


func _on_3_clicked():
	$NameText.text = nameList[2]


func _on_4_clicked():
	$NameText.text = nameList[3]


func _on_5_clicked():
	$NameText.text = nameList[4]


func _on_6_clicked():
	$NameText.text = nameList[5]


func _on_7_clicked():
	$NameText.text = nameList[6]


func _on_8_clicked():
	$NameText.text = nameList[7]
