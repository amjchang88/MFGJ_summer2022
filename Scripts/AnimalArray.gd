extends Node2D

onready var animalArray 
onready var animalInstance = preload("res://Scenes/Animal.tscn")

onready var paused = false

var animalX := 0
var animalY := 0
var animalCount := 0

func _ready():
		
	place_animals()

func place_animals():
	animalCount = 0
	animalArray = get_children()

	for Animal in animalArray:
	
		Animal.arrayPos = animalCount
		
		animalX = (animalCount % 6) * 32
		animalY = floor(animalCount / 6) * 32
		Animal.position = Vector2(animalX, animalY)

		animalCount += 1


func _on_JournalPanel_returned():
	paused = false
