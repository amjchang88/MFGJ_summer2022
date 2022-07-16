extends UIPanel

signal returned 

var nameList = [" ", "", " ", " ", " ", " ", " ", " "]
var children 
var variationList

func _ready():
	children = $AnimalList.get_children()
	
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	# clicked back button
	if event is InputEventMouseButton:
		if event.pressed:
			move_to(defaultX, defaultY)
			emit_signal("returned")

func initialize(p_name, p_variationList, p_nameList, p_rarity):
	variationList = p_variationList
	$JournalTitle.bbcode_text = "[center]" + p_name.to_upper() + "[/center]"
	$StarSheet.frame = p_rarity
	
	nameList = p_nameList
	$NameText.text = "Select Variation"
	for i in 8:
		if p_variationList[i]:
			children[i].animation = p_name.to_lower() + str(i)
		else:
			children[i].animation = p_name.to_lower() + "Shadow"
	
func set_entries(i):
	if variationList[i-1]:
		$NameText.text = nameList[0]
	else:
		$NameText.text = "Undiscovered"

# calling set_entries function
func _on_1_clicked():
	set_entries(1)
func _on_2_clicked():
	set_entries(2)
func _on_3_clicked():
	set_entries(3)
func _on_4_clicked():
	set_entries(4)
func _on_5_clicked():
	set_entries(5)
func _on_6_clicked():
	set_entries(6)
func _on_7_clicked():
	set_entries(7)
func _on_8_clicked():
	set_entries(8)
