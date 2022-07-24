extends Node2D

onready var global = get_node("/root/Global")

onready var journalPanel = get_node("JournalPanel")
onready var animalArray = get_node("AnimalList").get_node("AnimalArray")
onready var week1 = get_node("HUD").get_node("Week1")
onready var week2 = get_node("HUD").get_node("Week2")

# Player variables
onready var reputation := 0 # reputation ~= xp
onready var time := 1
onready var day := 1
onready var season := 0

var paused := false
var selecting := false

signal toNewAnimal
signal to_treatment
signal reset_info

func _on_JournalButton_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and !paused:
			journalPanel.move_to(112,2)
			animalArray.paused = true
			paused = true


func _on_ScreenTransition_animation_finished():
	if $ScreenTransition.animation == "end":
		# transition ended, reset transition animation
		$ScreenTransition.visible = false
		#$NewAnimal.visible = false
		$ScreenTransition.animation = "start"
		$ScreenTransition.stop()
	else:
		# mid transition (screen is black)
		# switch to newAnimal scene
		paused = true
		$AnimalList/AnimalArray.paused = true
		$ScreenTransition.animation = "end"
		$ScreenTransition.play()
		$NewAnimal.visible = true
		emit_signal("toNewAnimal")


func _on_EndButton_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and !paused:
			$ScreenTransition.visible = true
			$ScreenTransition.play()



func _on_JournalPanel_returned():
	paused = false
	$HUD.visible = true


func _on_NewAnimal_returnMain():
	$AnimalList/AnimalArray.paused = false
	paused = false
	
	# reset info panel
	emit_signal("reset_info")
	
func _on_InfoPanel_select_treatment_mode():
	if !selecting:
		selecting = true
		$TreatmentOverlay.visible = true

func _on_TreatmentPanel_clicked_treatment(p_treatment):
	if selecting:
		$TreatmentOverlay.visible = false
		emit_signal("to_treatment", p_treatment)
		selecting = false
