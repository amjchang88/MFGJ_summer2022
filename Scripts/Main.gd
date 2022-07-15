extends Node2D

onready var journalPanel = get_tree().get_root().get_node("Main").get_node("JournalPanel")

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
