extends UIPanel

signal returned
onready var global = get_node("/root/Global")

func _on_Button_clicked():
	# reset title
	$Title.bbcode_text = "[center]Treatments[/center]"
	move_to(defaultX, defaultY)
	emit_signal("returned")

# treatment clicking
func _on_JournalIcon_clicked():
	$TreatmentName.text = "Anti inflammatory"
	$Affliction2.text = global.symptomDict[$TreatmentName.text].afflictionName

func _on_JournalIcon2_clicked():
	pass # Replace with function body.


func _on_JournalIcon3_clicked():
	pass # Replace with function body.


func _on_JournalIcon4_clicked():
	pass # Replace with function body.


func _on_JournalIcon5_clicked():
	pass # Replace with function body.


func _on_JournalIcon6_clicked():
	pass # Replace with function body.


func _on_JournalIcon7_clicked():
	pass # Replace with function body.


func _on_JournalIcon8_clicked():
	pass # Replace with function body.


func _on_JournalIcon9_clicked():
	pass # Replace with function body.


func _on_JournalIcon10_clicked():
	pass # Replace with function body.


func _on_JournalIcon11_clicked():
	pass # Replace with function body.


func _on_JournalIcon12_clicked():
	pass # Replace with function body.


func _on_JournalIcon13_clicked():
	pass # Replace with function body.


func _on_JournalIcon20_clicked():
	pass # Replace with function body.


func _on_JournalIcon15_clicked():
	pass # Replace with function body.


func _on_JournalIcon14_clicked():
	pass # Replace with function body.


func _on_JournalIcon16_clicked():
	pass # Replace with function body.


func _on_JournalIcon17_clicked():
	pass # Replace with function body.


func _on_JournalIcon18_clicked():
	pass # Replace with function body.


func _on_JournalIcon19_clicked():
	pass # Replace with function body.
