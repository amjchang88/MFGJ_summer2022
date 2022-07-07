extends Node2D

# Player variables
onready var reputation := 0 # reputation ~= xp
onready var time := 1
onready var season := 1

func _ready():
	randomize()
