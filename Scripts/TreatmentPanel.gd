extends UIPanel

signal returned
onready var global = get_node("/root/Global")

func _on_Button_clicked():
	# reset title
	$Title.bbcode_text = "[center]Treatments[/center]"
	$Affliction2.text = "Unknown"
	$TreatmentName.text = "Select treatment"
	move_to(defaultX, defaultY)
	emit_signal("returned")

func click_treatment(p_treatment : String):
	$TreatmentName.text = p_treatment
	$Affliction2.text = "Unknown"
	if global.symptomDict[p_treatment].discovered == true:
		$Affliction2.text = global.symptomDict[p_treatment].afflictionName
		
# treatment clicking
func _on_JournalIcon_clicked():
	click_treatment("Anti inflammatory")
func _on_JournalIcon2_clicked():
	click_treatment("Antibiotics")
func _on_JournalIcon3_clicked():
	click_treatment("Antifungal")
func _on_JournalIcon4_clicked():
	click_treatment("Bandages")
func _on_JournalIcon5_clicked():
	click_treatment("Claw cream")
func _on_JournalIcon6_clicked():
	click_treatment("Dewormer")
func _on_JournalIcon7_clicked():
	click_treatment("Eye cream")
func _on_JournalIcon8_clicked():
	click_treatment("Eye drops")
func _on_JournalIcon9_clicked():
	click_treatment("Flea meds")
func _on_JournalIcon10_clicked():
	click_treatment("Flu meds")
func _on_JournalIcon11_clicked():
	click_treatment("Mange meds")
func _on_JournalIcon12_clicked():
	click_treatment("Med bath")
func _on_JournalIcon13_clicked():
	click_treatment("Mineral bath")
func _on_JournalIcon14_clicked():
	click_treatment("Parasite meds")
func _on_JournalIcon15_clicked():
	click_treatment("Refrigeration")
func _on_JournalIcon16_clicked():
	click_treatment("Splint")
func _on_JournalIcon17_clicked():
	click_treatment("Tank filter")
func _on_JournalIcon18_clicked():
	click_treatment("Teddy bear")
func _on_JournalIcon19_clicked():
	click_treatment("Thyroid meds")
func _on_JournalIcon20_clicked():
	click_treatment("Vitamin injection")
