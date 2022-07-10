extends Node2D

onready var animalArray = get_children()

func _ready():
	for i in animalArray:
		print(i.happiness)
