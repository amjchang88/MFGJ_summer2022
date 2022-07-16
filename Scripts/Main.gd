extends Node2D

onready var journalPanel = get_node("JournalPanel")
onready var animalArray = get_node("AnimalList").get_node("AnimalArray")
onready var week1 = get_node("HUD").get_node("Week1")
onready var week2 = get_node("HUD").get_node("Week2")

# Player variables
onready var reputation := 0 # reputation ~= xp
onready var time := 1
onready var day := 1
onready var season := 0

var paused = false

signal toNewAnimal

func _ready():
	randomize()


func _on_JournalButton_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and !paused:
			journalPanel.move_to(112,2)
			animalArray.paused = true
			paused = true
			$HUD.visible = false


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
