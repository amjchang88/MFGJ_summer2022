extends Node2D

onready var journalPanel = get_node("JournalPanel")
onready var hud = get_node("HUD")
onready var animalArray = get_node("AnimalList").get_node("AnimalArray")

# Player variables
onready var reputation := 0 # reputation ~= xp
onready var time := 1
onready var season := 1



func _ready():
	randomize()


func _on_JournalButton_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			journalPanel.move_to(112,2)
			animalArray.paused = true
