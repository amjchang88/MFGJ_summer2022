extends Node2D

onready var animalArray 
onready var animalInstance = preload("res://Scenes/Animal.tscn")

var animalX := 0
var animalY := 0
var animalCount := 0

func _ready():
	for _i in range(30):
		add_child(animalInstance.instance(), true)
		
	place_animals()

func place_animals():
	animalArray = get_children()

	for Animal in animalArray:
	
		Animal.arrayPos = animalCount
		
		animalX = (animalCount % 5) * 32
		animalY = floor(animalCount / 5) * 32
		Animal.position = Vector2(animalX, animalY)

		animalCount += 1
