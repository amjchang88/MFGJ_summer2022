extends Node2D

onready var journalPanel = get_node("JournalPanel")
onready var animalArray = get_node("AnimalList").get_node("AnimalArray")
onready var time1 = get_node("HUD").get_node("Time1")
onready var time2 = get_node("HUD").get_node("Time2")
onready var time3 = get_node("HUD").get_node("Time3")
# Player variables
onready var reputation := 0 # reputation ~= xp
onready var time := 1
onready var day := 1
onready var season := 0



func _ready():
	randomize()


func _on_JournalButton_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			journalPanel.move_to(112,2)
			animalArray.paused = true
